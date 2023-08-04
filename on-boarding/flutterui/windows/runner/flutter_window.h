#ifndefRUNNER_FLUTTER_WINDOW_H_
#defineRUNNER_FLUTTER_WINDOW_H_

#include<flutter/dart_project.h>
#include<flutter/flutter_view_controller.h>

#include<memory>

#include"win32_window.h"

//AwindowthatdoesnothingbuthostaFlutterview.
classFlutterWindow:publicWin32Window{
public:
//CreatesanewFlutterWindowhostingaFlutterviewrunning|project|.
explicitFlutterWindow(constflutter::DartProject&project);
virtual~FlutterWindow();

protected:
//Win32Window:
boolOnCreate()override;
voidOnDestroy()override;
LRESULTMessageHandler(HWNDwindow,UINTconstmessage,WPARAMconstwparam,
LPARAMconstlparam)noexceptoverride;

private:
//Theprojecttorun.
flutter::DartProjectproject_;

//TheFlutterinstancehostedbythiswindow.
std::unique_ptr<flutter::FlutterViewController>flutter_controller_;
};

#endif//RUNNER_FLUTTER_WINDOW_H_
