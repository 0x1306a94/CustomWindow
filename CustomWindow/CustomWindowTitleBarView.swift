//
//  CustomWindowTitleBarView.swift
//  CustomWindow
//
//  Created by king on 2016/12/10.
//  Copyright © 2016年 king. All rights reserved.
//

import Cocoa




class CustomWindowTitleBarView: NSView {

    public var closeBtn: CustomWindowTitleBarButton!
    public var minimizeBtn: CustomWindowTitleBarButton!
    public var fullscreenBtn: CustomWindowTitleBarButton!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        closeBtn = CustomWindowTitleBarButton()
        closeBtn.setImage(forState: .normal, image: NSImage(named: "close_normal"))
        closeBtn.setImage(forState: .highlighted, image: NSImage(named: "close_highlighted"))
        
        minimizeBtn = CustomWindowTitleBarButton()
        minimizeBtn.setImage(forState: .normal, image: NSImage(named: "narrow_normal"))
        minimizeBtn.setImage(forState: .highlighted, image: NSImage(named: "narrow_highlighted"))
        
        fullscreenBtn = CustomWindowTitleBarButton()
        fullscreenBtn.setImage(forState: .normal, image: NSImage(named: "fullscreen_normal"))
        fullscreenBtn.setImage(forState: .highlighted, image: NSImage(named: "fullscreen_highlighted"))
        addSubview(closeBtn)
        addSubview(minimizeBtn)
        addSubview(fullscreenBtn)
        
        
    }
    
    override func layout() {
        super.layout()
        let y: CGFloat = (self.bounds.size.height - 25) * 0.5;
        var x: CGFloat = 5.0
        closeBtn.frame = NSMakeRect(x, y, 25, 25)
        x = CGFloat(5.0 + 25.0 + 5.0)
        minimizeBtn.frame = NSMakeRect(x, y, 25, 25)
        x = CGFloat(5.0 + 25.0 + 5.0 + 25.0 + 5.0)
        fullscreenBtn.frame = NSMakeRect(x, y, 25, 25)
    }
    
    
}
