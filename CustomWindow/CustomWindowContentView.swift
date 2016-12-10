//
//  CustomWindowContentView.swift
//  CustomWindow
//
//  Created by king on 2016/12/10.
//  Copyright © 2016年 king. All rights reserved.
//

import Cocoa

class CustomWindowContentView: NSView {

    var openAutomaticHidden: Bool = false {
        didSet {
            if !openAutomaticHidden {
                titleBar.isHidden = openAutomaticHidden
            }
        }
    }
    
    var titleBar: CustomWindowTitleBarView!
    var titleBarHeight: CGFloat = 30
    var backgroundColor: NSColor = NSColor.clear {
        didSet {
            layer?.backgroundColor = backgroundColor.cgColor
        }
    }
    var titleBarBackgroundColor: NSColor = NSColor.white {
        didSet {
            titleBar.layer?.backgroundColor = titleBarBackgroundColor.cgColor
        }
    }
    
    private var mouseTrackingArea: NSTrackingArea!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        var rect = self.frame
        rect.size.height = titleBarHeight
        rect.origin.y = self.frame.size.height - titleBarHeight
        titleBar.frame = rect
    }
    
    func setup() {
        
        self.layer?.masksToBounds = true
        wantsLayer = true
        titleBar = CustomWindowTitleBarView()
        self.addSubview(titleBar, positioned: .above, relativeTo: nil)
        autoresizesSubviews = true
        
        titleBar.wantsLayer = true
        titleBar.layer?.backgroundColor = titleBarBackgroundColor.cgColor
        titleBar.layer?.masksToBounds = true
        
        titleBar.closeBtn.target = self
        titleBar.closeBtn.action = #selector(close)
        
        titleBar.minimizeBtn.target = self
        titleBar.minimizeBtn.action = #selector(minimize)
        
        titleBar.fullscreenBtn.target = self
        titleBar.fullscreenBtn.action = #selector(fullscreen)
        
        
    }
    
    func close() {
        
        window?.close()
        titleBar.closeBtn.btnState = .normal
    }
    
    func minimize() {
        window?.miniaturize(nil)
        titleBar.minimizeBtn.btnState = .normal
    }
    
    func fullscreen() {
        window?.zoom(nil)
        titleBar.fullscreenBtn.btnState = .normal
    }
    
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if mouseTrackingArea != nil {
            removeTrackingArea(mouseTrackingArea)
        }
        
        mouseTrackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways, .mouseMoved], owner: self, userInfo: nil)
        addTrackingArea(mouseTrackingArea)
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseExited(with: event)
        mouseInTitleBarView(with: event)
    }
    
    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        mouseInTitleBarView(with: event)
    }
    
    override func mouseMoved(with event: NSEvent) {
        super.mouseMoved(with: event)
        mouseInTitleBarView(with: event)
    }
    
    func mouseInTitleBarView(with event: NSEvent) {
        // 获取鼠标在当前window 的point
        if !openAutomaticHidden {
            return
        }
        var point = event.locationInWindow
        Swift.print("前:\(point)")
        Swift.print("titleBar:\(titleBar.frame.origin)")
        // 转换到当前视图所在的point
        point = self.convert(point, from: nil)
        Swift.print("后:\(point)")
        // 判断鼠标是否在 titleBar 矩形中
        titleBar.isHidden = !NSPointInRect(point, titleBar.frame)
    }
}
