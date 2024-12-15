//
//  TransparentNSView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//


import Cocoa

class TransparentNSView: NSView {
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        
        // Configure the window if available
        guard let window = self.window else { return }
        window.isOpaque = false
        window.backgroundColor = .clear
        window.styleMask.remove(.titled)
        window.ignoresMouseEvents = true
        window.setFrame(NSScreen.main?.frame ?? NSRect.zero, display: true)
        window.level = .floating
        window.makeKeyAndOrderFront(nil)
    }
}
