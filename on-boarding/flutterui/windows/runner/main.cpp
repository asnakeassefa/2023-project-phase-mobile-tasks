#include<flutter/dart_project.h>
#include<flutter/flutter_view_controller.h>
#include<windows.h>

#include"flutter_window.h"
#include"utils.h"

intAPIENTRYwWinMain(_In_HINSTANCEinstance,_In_opt_HINSTANCEprev,
_In_wchar_t*command_line,_In_intshow_command){
//Attachtoconsolewhenpresent(e.g.,'flutterrun')orcreatea
//newconsolewhenrunningwithadebugger.
if(!::AttachConsole(ATTACH_PARENT_PROCESS)&&::IsDebuggerPresent()){
CreateAndAttachConsole();
}

//InitializeCOM,sothatitisavailableforuseinthelibraryand/or
//plugins.
::CoInitializeEx(nullptr,COINIT_APARTMENTTHREADED);

flutter::DartProjectproject(L"data");

std::vector<std::string>command_line_arguments=
GetCommandLineArguments();

project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

FlutterWindowwindow(project);
Win32Window::Pointorigin(10,10);
Win32Window::Sizesize(1280,720);
if(!window.Create(L"flutterui",origin,size)){
returnEXIT_FAILURE;
}
window.SetQuitOnClose(true);

::MSGmsg;
while(::GetMessage(&msg,nullptr,0,0)){
::TranslateMessage(&msg);
::DispatchMessage(&msg);
}

::CoUninitialize();
returnEXIT_SUCCESS;
}
