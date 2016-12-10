//
//  AppDelegate.swift
//  CustomWindow
//
//  Created by king on 2016/12/10.
//  Copyright © 2016年 king. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var mainView: CustomWindowContentView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        mainView.wantsLayer = true
        mainView.layer?.cornerRadius = 10;
        mainView.layer?.masksToBounds = true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    @IBAction func siderChanager(_ sender: NSSlider) {
        
        mainView.titleBarHeight = CGFloat(sender.floatValue)
        mainView.display()
        
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        
        window.makeKeyAndOrderFront(self)
        return true
    }

    @IBAction func randomColor(_ sender: NSButton) {
        
        let r = CGFloat(arc4random() % 255) / 255.0
        let g = CGFloat(arc4random() % 255) / 255.0
        let b = CGFloat(arc4random() % 255) / 255.0
        
        let color = NSColor(calibratedRed: r, green: g, blue: b, alpha: 1.0)
        
        mainView.titleBarBackgroundColor = color
    }
    @IBAction func hiddenTitleBar(_ sender: NSButton) {
        
        mainView.titleBar.isHidden = !mainView.titleBar.isHidden
        
        if mainView.titleBar.isHidden {
            sender.title = "show titleBar"
        } else {
            sender.title = "hidden titleBar"
        }
    }
    @IBAction func openAutomaticHidden(_ sender: NSButton) {
        
        mainView.openAutomaticHidden = !mainView.openAutomaticHidden
        sender.title = mainView.openAutomaticHidden ? "Close Automatic Hidden" : "Open Automatic Hidden"
    }

}

