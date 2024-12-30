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
    @Binding var screenIndex: Int

    func makeNSView(context: Context) -> TransparentSKView {
        // Set the view allows transparency and clear
        let skView = TransparentSKView()
        skView.allowsTransparency = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
        return skView
    }

    func updateNSView(_ skView: TransparentSKView, context: Context) {
        if snapToCenter {
            scene.snapToCenter()
            snapToCenter = false
        }
        skView.setScreenIndex(screenIndex)
    }
}
