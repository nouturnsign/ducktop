//
//  DuckScene.swift
//  Ducktop
//
//  Created by Eric Wang on 12/13/24.
//

import SpriteKit

fileprivate let textureNames = ["kaczuha 4 1", "kaczuha 4 2", "kaczuha 4 3", "kaczuha 4 4"]

class DuckScene: SKScene {
    private var duck: SKSpriteNode!
    private let textures = textureNames.map { name in SKTexture(imageNamed: name) }

    override func didMove(to view: SKView) {
        // Add duck sprite
        duck = SKSpriteNode(texture: textures.first)
        duck.size = CGSize(width: 64, height: 64)
        duck.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(duck)

        // Start walking animation
        let walkAction = SKAction.animate(with: textures, timePerFrame: 0.2)
        let loopAction = SKAction.repeatForever(walkAction)
        duck.run(loopAction)
    }
}
