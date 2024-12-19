//
//  TransparentSKView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/18/24.
//

import Foundation
import SpriteKit

class TransparentSKView: SKView {
    override func viewDidMoveToWindow() {
        if let window = window {
            window.isOpaque = false
            window.backgroundColor = .clear
            window.hasShadow = false
            window.styleMask.remove(.titled)
            window.ignoresMouseEvents = true
            window.setFrame(NSScreen.screens[0].frame, display: true)
            window.level = .floating
            window.makeKeyAndOrderFront(nil)
        }
        super.viewDidMoveToWindow()
    }
}
