//
//  TransparentSpriteView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//


import SwiftUI
import SpriteKit

struct TransparentSpriteView: NSViewRepresentable {
    let scene: DuckScene
    @Binding var snapToCenter: Bool

    func makeNSView(context: Context) -> SKView {        
        // Set the view allows transparency and clear
        let skView = TransparentSKView()
        skView.allowsTransparency = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
        return skView
    }

    func updateNSView(_ nsView: SKView, context: Context) {
        if (snapToCenter) {
            scene.snapToCenter()
            snapToCenter = false
        }
    }
}
