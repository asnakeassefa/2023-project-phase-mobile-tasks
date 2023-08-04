#include"flutter_window.h"

#include<optional>

#include"flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(constflutter::DartProject&project)
:project_(project){}

FlutterWindow::~FlutterWindow(){}

boolFlutterWindow::OnCreate(){
if(!Win32Window::OnCreate()){
returnfalse;
}

RECTframe=GetClientArea();

//Thesizeheremustmatchthewindowdimensionstoavoidunnecessarysurface
//creation/destructioninthestartuppath.
flutter_controller_=std::make_unique<flutter::FlutterViewController>(
frame.right-frame.left,frame.bottom-frame.top,project_);
//Ensurethatbasicsetupofthecontrollerwassuccessful.
if(!flutter_controller_->engine()||!flutter_controller_->view()){
returnfalse;
}
RegisterPlugins(flutter_controller_->engine());
SetChildContent(flutter_controller_->view()->GetNativeWindow());

flutter_controller_->engine()->SetNextFrameCallback([&](){
this->Show();
});

returntrue;
}

voidFlutterWindow::OnDestroy(){
if(flutter_controller_){
flutter_controller_=nullptr;
}

Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWNDhwnd,UINTconstmessage,
WPARAMconstwparam,
LPARAMconstlparam)noexcept{
//GiveFlutter,includingplugins,anopportunitytohandlewindowmessages.
if(flutter_controller_){
std::optional<LRESULT>result=
flutter_controller_->HandleTopLevelWindowProc(hwnd,message,wparam,
lparam);
if(result){
return*result;
}
}

switch(message){
caseWM_FONTCHANGE:
flutter_controller_->engine()->ReloadSystemFonts();
break;
}

returnWin32Window::MessageHandler(hwnd,message,wparam,lparam);
}
