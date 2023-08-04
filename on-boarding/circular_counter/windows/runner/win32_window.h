#ifndefRUNNER_WIN32_WINDOW_H_
#defineRUNNER_WIN32_WINDOW_H_

#include<windows.h>

#include<functional>
#include<memory>
#include<string>

//AclassabstractionforahighDPI-awareWin32Window.Intendedtobe
//inheritedfrombyclassesthatwishtospecializewithcustom
//renderingandinputhandling
classWin32Window{
public:
structPoint{
unsignedintx;
unsignedinty;
Point(unsignedintx,unsignedinty):x(x),y(y){}
};

structSize{
unsignedintwidth;
unsignedintheight;
Size(unsignedintwidth,unsignedintheight)
:width(width),height(height){}
};

Win32Window();
virtual~Win32Window();

//Createsawin32windowwith|title|thatispositionedandsizedusing
//|origin|and|size|.Newwindowsarecreatedonthedefaultmonitor.Window
//sizesarespecifiedtotheOSinphysicalpixels,hencetoensurea
//consistentsizethisfunctionwillscaletheinputtedwidthandheightas
//asappropriateforthedefaultmonitor.Thewindowisinvisibleuntil
//|Show|iscalled.Returnstrueifthewindowwascreatedsuccessfully.
boolCreate(conststd::wstring&title,constPoint&origin,constSize&size);

//Showthecurrentwindow.Returnstrueifthewindowwassuccessfullyshown.
boolShow();

//ReleaseOSresourcesassociatedwithwindow.
voidDestroy();

//Inserts|content|intothewindowtree.
voidSetChildContent(HWNDcontent);

//ReturnsthebackingWindowhandletoenableclientstoseticonandother
//windowproperties.Returnsnullptrifthewindowhasbeendestroyed.
HWNDGetHandle();

//Iftrue,closingthiswindowwillquittheapplication.
voidSetQuitOnClose(boolquit_on_close);

//ReturnaRECTrepresentingtheboundsofthecurrentclientarea.
RECTGetClientArea();

protected:
//Processesandroutesalientwindowmessagesformousehandling,
//sizechangeandDPI.Delegateshandlingofthesetomemberoverloadsthat
//inheritingclassescanhandle.
virtualLRESULTMessageHandler(HWNDwindow,
UINTconstmessage,
WPARAMconstwparam,
LPARAMconstlparam)noexcept;

//CalledwhenCreateAndShowiscalled,allowingsubclasswindow-related
//setup.Subclassesshouldreturnfalseifsetupfails.
virtualboolOnCreate();

//CalledwhenDestroyiscalled.
virtualvoidOnDestroy();

private:
friendclassWindowClassRegistrar;

//OScallbackcalledbymessagepump.HandlestheWM_NCCREATEmessagewhich
//ispassedwhenthenon-clientareaisbeingcreatedandenablesautomatic
//non-clientDPIscalingsothatthenon-clientareaautomatically
//respondstochangesinDPI.Allothermessagesarehandledby
//MessageHandler.
staticLRESULTCALLBACKWndProc(HWNDconstwindow,
UINTconstmessage,
WPARAMconstwparam,
LPARAMconstlparam)noexcept;

//Retrievesaclassinstancepointerfor|window|
staticWin32Window*GetThisFromHandle(HWNDconstwindow)noexcept;

//Updatethewindowframe'sthemetomatchthesystemtheme.
staticvoidUpdateTheme(HWNDconstwindow);

boolquit_on_close_=false;

//windowhandlefortoplevelwindow.
HWNDwindow_handle_=nullptr;

//windowhandleforhostedcontent.
HWNDchild_content_=nullptr;
};

#endif//RUNNER_WIN32_WINDOW_H_
