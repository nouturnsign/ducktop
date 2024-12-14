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
        // Set the scene background to clear
        scene.backgroundColor = .clear
        
        // Set the view allows transparency and clear
        let skView = SKView()
        skView.allowsTransparency = true
        skView.presentScene(scene)
        return skView
    }

    func updateNSView(_ nsView: SKView, context: Context) {
        // Update the scene if needed (e.g., replace it with a new scene)
        nsView.presentScene(scene)
    }
}
