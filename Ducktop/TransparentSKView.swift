//
//  TransparentSKView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/18/24.
//

import Foundation
import SpriteKit

class TransparentSKView: SKView {
    private var screenIndex: Int = 0
    
    override func viewDidMoveToWindow() {
        if let window = window {
            window.isOpaque = false
            window.backgroundColor = .clear
            window.hasShadow = false
            window.styleMask.remove(.titled)
            window.ignoresMouseEvents = true
            window.setFrame(NSScreen.screens[screenIndex].frame, display: true)
            window.level = .floating
            window.makeKeyAndOrderFront(nil)
        }
        super.viewDidMoveToWindow()
    }
    
    func setScreenIndex(_ index: Int) {
        if screenIndex == index { return }
        screenIndex = index
        if let window = window {
            window.setFrame(NSScreen.screens[screenIndex].frame, display: true)
        }
    }
}
