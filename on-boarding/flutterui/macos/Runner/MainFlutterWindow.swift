importCocoa
importFlutterMacOS

classMainFlutterWindow:NSWindow{
overridefuncawakeFromNib(){
letflutterViewController=FlutterViewController()
letwindowFrame=self.frame
self.contentViewController=flutterViewController
self.setFrame(windowFrame,display:true)

RegisterGeneratedPlugins(registry:flutterViewController)

super.awakeFromNib()
}
}
