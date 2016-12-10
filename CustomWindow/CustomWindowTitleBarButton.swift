//
//  CustomWindowTitleBarButton.swift
//  CustomWindow
//
//  Created by king on 2016/12/10.
//  Copyright © 2016年 king. All rights reserved.
//

import Cocoa

enum ButtonState {
    
    case normal
    case highlighted
}

class CustomWindowTitleBarButton: NSButton {

    private(set) var imageNormal: NSImage?
    private(set) var imageHighlighted: NSImage?
    
    public var btnState: ButtonState = .normal {
        didSet {
            self.image = (btnState == .normal) ? imageNormal : imageHighlighted
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
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if mouseTrackingArea != nil {
            removeTrackingArea(mouseTrackingArea)
        }
        
        mouseTrackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways], owner: self, userInfo: nil)
        addTrackingArea(mouseTrackingArea)
    }
   
    open func setup()  {
        
        setButtonType(.momentaryChange)
        isBordered = false
    }
    
    public func setImage(forState: ButtonState = .normal, image: NSImage?) {
        
        switch forState {
        case .normal:
            self.imageNormal = image
        case .highlighted:
            self.imageHighlighted = image
        }
        self.btnState = .normal
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseExited(with: event)
        btnState = .highlighted
    }
    
    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        btnState = .normal
    }
    
}
