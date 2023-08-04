#include"win32_window.h"

#include<dwmapi.h>
#include<flutter_windows.h>

#include"resource.h"

namespace{

///Windowattributethatenablesdarkmodewindowdecorations.
///
///Redefinedincasethedeveloper'smachinehasaWindowsSDKolderthan
///version10.0.22000.0.
///See:https://docs.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
#ifndefDWMWA_USE_IMMERSIVE_DARK_MODE
#defineDWMWA_USE_IMMERSIVE_DARK_MODE20
#endif

constexprconstwchar_tkWindowClassName[]=L"FLUTTER_RUNNER_WIN32_WINDOW";

///Registrykeyforappthemepreference.
///
///Avalueof0indicatesappsshouldusedarkmode.Anon-zeroormissing
///valueindicatesappsshoulduselightmode.
constexprconstwchar_tkGetPreferredBrightnessRegKey[]=
L"Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize";
constexprconstwchar_tkGetPreferredBrightnessRegValue[]=L"AppsUseLightTheme";

//ThenumberofWin32Windowobjectsthatcurrentlyexist.
staticintg_active_window_count=0;

usingEnableNonClientDpiScaling=BOOL__stdcall(HWNDhwnd);

//Scalehelpertoconvertlogicalscalervaluestophysicalusingpassedin
//scalefactor
intScale(intsource,doublescale_factor){
returnstatic_cast<int>(source*scale_factor);
}

//Dynamicallyloadsthe|EnableNonClientDpiScaling|fromtheUser32module.
//ThisAPIisonlyneededforPerMonitorV1awarenessmode.
voidEnableFullDpiSupportIfAvailable(HWNDhwnd){
HMODULEuser32_module=LoadLibraryA("User32.dll");
if(!user32_module){
return;
}
autoenable_non_client_dpi_scaling=
reinterpret_cast<EnableNonClientDpiScaling*>(
GetProcAddress(user32_module,"EnableNonClientDpiScaling"));
if(enable_non_client_dpi_scaling!=nullptr){
enable_non_client_dpi_scaling(hwnd);
}
FreeLibrary(user32_module);
}

}//namespace

//ManagestheWin32Window'swindowclassregistration.
classWindowClassRegistrar{
public:
~WindowClassRegistrar()=default;

//Returnsthesingletonregistrarinstance.
staticWindowClassRegistrar*GetInstance(){
if(!instance_){
instance_=newWindowClassRegistrar();
}
returninstance_;
}

//Returnsthenameofthewindowclass,registeringtheclassifithasn't
//previouslybeenregistered.
constwchar_t*GetWindowClass();

//Unregistersthewindowclass.Shouldonlybecalledifthereareno
//instancesofthewindow.
voidUnregisterWindowClass();

private:
WindowClassRegistrar()=default;

staticWindowClassRegistrar*instance_;

boolclass_registered_=false;
};

WindowClassRegistrar*WindowClassRegistrar::instance_=nullptr;

constwchar_t*WindowClassRegistrar::GetWindowClass(){
if(!class_registered_){
WNDCLASSwindow_class{};
window_class.hCursor=LoadCursor(nullptr,IDC_ARROW);
window_class.lpszClassName=kWindowClassName;
window_class.style=CS_HREDRAW|CS_VREDRAW;
window_class.cbClsExtra=0;
window_class.cbWndExtra=0;
window_class.hInstance=GetModuleHandle(nullptr);
window_class.hIcon=
LoadIcon(window_class.hInstance,MAKEINTRESOURCE(IDI_APP_ICON));
window_class.hbrBackground=0;
window_class.lpszMenuName=nullptr;
window_class.lpfnWndProc=Win32Window::WndProc;
RegisterClass(&window_class);
class_registered_=true;
}
returnkWindowClassName;
}

voidWindowClassRegistrar::UnregisterWindowClass(){
UnregisterClass(kWindowClassName,nullptr);
class_registered_=false;
}

Win32Window::Win32Window(){
++g_active_window_count;
}

Win32Window::~Win32Window(){
--g_active_window_count;
Destroy();
}

boolWin32Window::Create(conststd::wstring&title,
constPoint&origin,
constSize&size){
Destroy();

constwchar_t*window_class=
WindowClassRegistrar::GetInstance()->GetWindowClass();

constPOINTtarget_point={static_cast<LONG>(origin.x),
static_cast<LONG>(origin.y)};
HMONITORmonitor=MonitorFromPoint(target_point,MONITOR_DEFAULTTONEAREST);
UINTdpi=FlutterDesktopGetDpiForMonitor(monitor);
doublescale_factor=dpi/96.0;

HWNDwindow=CreateWindow(
window_class,title.c_str(),WS_OVERLAPPEDWINDOW,
Scale(origin.x,scale_factor),Scale(origin.y,scale_factor),
Scale(size.width,scale_factor),Scale(size.height,scale_factor),
nullptr,nullptr,GetModuleHandle(nullptr),this);

if(!window){
returnfalse;
}

UpdateTheme(window);

returnOnCreate();
}

boolWin32Window::Show(){
returnShowWindow(window_handle_,SW_SHOWNORMAL);
}

//static
LRESULTCALLBACKWin32Window::WndProc(HWNDconstwindow,
UINTconstmessage,
WPARAMconstwparam,
LPARAMconstlparam)noexcept{
if(message==WM_NCCREATE){
autowindow_struct=reinterpret_cast<CREATESTRUCT*>(lparam);
SetWindowLongPtr(window,GWLP_USERDATA,
reinterpret_cast<LONG_PTR>(window_struct->lpCreateParams));

autothat=static_cast<Win32Window*>(window_struct->lpCreateParams);
EnableFullDpiSupportIfAvailable(window);
that->window_handle_=window;
}elseif(Win32Window*that=GetThisFromHandle(window)){
returnthat->MessageHandler(window,message,wparam,lparam);
}

returnDefWindowProc(window,message,wparam,lparam);
}

LRESULT
Win32Window::MessageHandler(HWNDhwnd,
UINTconstmessage,
WPARAMconstwparam,
LPARAMconstlparam)noexcept{
switch(message){
caseWM_DESTROY:
window_handle_=nullptr;
Destroy();
if(quit_on_close_){
PostQuitMessage(0);
}
return0;

caseWM_DPICHANGED:{
autonewRectSize=reinterpret_cast<RECT*>(lparam);
LONGnewWidth=newRectSize->right-newRectSize->left;
LONGnewHeight=newRectSize->bottom-newRectSize->top;

SetWindowPos(hwnd,nullptr,newRectSize->left,newRectSize->top,newWidth,
newHeight,SWP_NOZORDER|SWP_NOACTIVATE);

return0;
}
caseWM_SIZE:{
RECTrect=GetClientArea();
if(child_content_!=nullptr){
//Sizeandpositionthechildwindow.
MoveWindow(child_content_,rect.left,rect.top,rect.right-rect.left,
rect.bottom-rect.top,TRUE);
}
return0;
}

caseWM_ACTIVATE:
if(child_content_!=nullptr){
SetFocus(child_content_);
}
return0;

caseWM_DWMCOLORIZATIONCOLORCHANGED:
UpdateTheme(hwnd);
return0;
}

returnDefWindowProc(window_handle_,message,wparam,lparam);
}

voidWin32Window::Destroy(){
OnDestroy();

if(window_handle_){
DestroyWindow(window_handle_);
window_handle_=nullptr;
}
if(g_active_window_count==0){
WindowClassRegistrar::GetInstance()->UnregisterWindowClass();
}
}

Win32Window*Win32Window::GetThisFromHandle(HWNDconstwindow)noexcept{
returnreinterpret_cast<Win32Window*>(
GetWindowLongPtr(window,GWLP_USERDATA));
}

voidWin32Window::SetChildContent(HWNDcontent){
child_content_=content;
SetParent(content,window_handle_);
RECTframe=GetClientArea();

MoveWindow(content,frame.left,frame.top,frame.right-frame.left,
frame.bottom-frame.top,true);

SetFocus(child_content_);
}

RECTWin32Window::GetClientArea(){
RECTframe;
GetClientRect(window_handle_,&frame);
returnframe;
}

HWNDWin32Window::GetHandle(){
returnwindow_handle_;
}

voidWin32Window::SetQuitOnClose(boolquit_on_close){
quit_on_close_=quit_on_close;
}

boolWin32Window::OnCreate(){
//No-op;providedforsubclasses.
returntrue;
}

voidWin32Window::OnDestroy(){
//No-op;providedforsubclasses.
}

voidWin32Window::UpdateTheme(HWNDconstwindow){
DWORDlight_mode;
DWORDlight_mode_size=sizeof(light_mode);
LSTATUSresult=RegGetValue(HKEY_CURRENT_USER,kGetPreferredBrightnessRegKey,
kGetPreferredBrightnessRegValue,
RRF_RT_REG_DWORD,nullptr,&light_mode,
&light_mode_size);

if(result==ERROR_SUCCESS){
BOOLenable_dark_mode=light_mode==0;
DwmSetWindowAttribute(window,DWMWA_USE_IMMERSIVE_DARK_MODE,
&enable_dark_mode,sizeof(enable_dark_mode));
}
}
