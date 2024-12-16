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
    private var targetPosition: CGPoint?
    private let textures = textureNames.map { name in SKTexture(imageNamed: name) }
    private let moveSpeed: CGFloat = 1.0
    private let timePerFrame: CGFloat = 0.2
    private let duckSizeRatio: CGFloat = 0.04
    private let idleRadius: CGFloat = 8.0

    override func didMove(to view: SKView) {
        // Add duck sprite
        duck = SKSpriteNode(texture: textures.first)
        duck.size = CGSize(width: size.width * duckSizeRatio, height: size.height * duckSizeRatio)
        duck.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(duck)

        // Start walking animation
        let walkAction = SKAction.animate(with: textures, timePerFrame: timePerFrame)
        let loopAction = SKAction.repeatForever(walkAction)
        duck.run(loopAction)
        
        // Track mouse movement
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) { [weak self] event in
            guard let self = self, let skView = self.view else { return event }
            // Convert macOS window coordinates to SpriteKit scene coordinates
            let sceneLocation = skView.scene?.convertPoint(fromView: event.locationInWindow)
            self.targetPosition = sceneLocation
            return event
        }
    }

    override func update(_ currentTime: TimeInterval) {
        guard let target = targetPosition else { return }

        // Calculate the direction to the target
        let direction = CGVector(dx: target.x - duck.position.x, dy: target.y - duck.position.y)
        let distance = hypot(direction.dx, direction.dy)

        // If the duck is close enough, stop moving
        if distance < idleRadius { return }

        // Normalize the direction vector
        let normalizedDirection = CGVector(dx: direction.dx / distance, dy: direction.dy / distance)

        // Calculate movement for this frame
        let movement = CGVector(dx: normalizedDirection.dx * moveSpeed * timePerFrame,
                                dy: normalizedDirection.dy * moveSpeed * timePerFrame)

        // Update the duck's position
        duck.position.x += movement.dx
        duck.position.y += movement.dy
        
        // Save duck position
        DuckState.shared.savePosition(duck.position)
    }
}
