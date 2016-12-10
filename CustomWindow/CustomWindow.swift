//
//  CustomWindow.swift
//  CustomWindow
//
//  Created by king on 2016/12/10.
//  Copyright © 2016年 king. All rights reserved.
//

import Cocoa

class CustomWindow: NSWindow {

    
    override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
        
        super.init(contentRect: contentRect, styleMask: NSWindowStyleMask.resizable, backing: bufferingType, defer: flag)
        setup()
    }
    
    convenience init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool, screen: NSScreen?) {
        self.init(contentRect: contentRect, styleMask: NSWindowStyleMask.resizable, backing: bufferingType, defer: flag, screen: screen)
        setup()
    }
    
    func setup() {
        isMovableByWindowBackground = true
        isOpaque = false
        backgroundColor = NSColor.clear
    }
}
