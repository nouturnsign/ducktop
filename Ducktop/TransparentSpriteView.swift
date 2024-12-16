//
//  TransparentSpriteView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//


import SwiftUI
import SpriteKit

struct TransparentSpriteView: NSViewRepresentable {
    let scene: SKScene

    func makeNSView(context: Context) -> SKView {
        // Set the scene background to clear and scale properly
        scene.backgroundColor = .clear
        scene.scaleMode = .aspectFill
        
        // Set the view allows transparency and clear
        let skView = SKView()
        skView.allowsTransparency = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
        
        // Make the window "invisible"
        DispatchQueue.main.async {
            guard let window = skView.window else { return }
            window.isOpaque = false
            window.backgroundColor = .clear
            window.styleMask.remove(.titled)
            window.ignoresMouseEvents = true
            window.setFrame(NSScreen.main?.frame ?? NSRect.zero, display: true)
            window.level = .floating
            window.makeKeyAndOrderFront(nil)
            skView.frame = window.frame
        }

        return skView
    }

    func updateNSView(_ nsView: SKView, context: Context) { }
}
