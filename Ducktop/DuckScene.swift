//
//  DuckScene.swift
//  Ducktop
//
//  Created by Eric Wang on 12/13/24.
//

import SpriteKit

fileprivate enum DuckDirection {
    case idle
    case frontWalk
    case backWalk
    // TODO: add tempIdle direction, used to ease transition from backWalk to idle
}
fileprivate let idleTextureNames = ["kaczuha 1", "kaczuha 2", "kaczuha 3", "kaczuha 4", "kaczuha 5"]
fileprivate let frontWalkTextureNames = ["Walking_Animation-1", "Walking_Animation-2", "Walking_Animation-3", "Walking_Animation-4", "Walking_Animation-5", "Walking_Animation-6", "Walking_Animation-7", "Walking_Animation-8", "Walking_Animation-9", "Walking_Animation-10", "Walking_Animation-11", "Walking_Animation-12", "Walking_Animation-13"]
fileprivate let backWalkTextureNames = ["kaczuha 5 1", "kaczuha 5 2", "kaczuha 5 3", "kaczuha 5 4"]

class DuckScene: SKScene {
    private var duck: SKSpriteNode!
    private var targetPosition: CGPoint?
    private var duckDirection: DuckDirection = .idle
    private let idleTextures = idleTextureNames.map { name in SKTexture(imageNamed: name) }
    private let frontWalkTextures = frontWalkTextureNames.map { name in SKTexture(imageNamed: name) }
    private let backWalkTextures = backWalkTextureNames.map { name in SKTexture(imageNamed: name) }
    private let moveSpeed: CGFloat = 0.8
    private let timePerFrame: CGFloat = 0.2
    private let duckSizeRatio: CGFloat = 0.07
    private let idleRadius: CGFloat = 8.0
    private var shouldSnapToCenter: Bool = false

    override func didMove(to view: SKView) {
        // Set the scene background to clear and scale properly
        backgroundColor = .clear
        scaleMode = .aspectFill
        
        // Add duck sprite
        duck = SKSpriteNode(texture: frontWalkTextures.first)
        duck.size = CGSize(width: size.width * duckSizeRatio, height: size.height * duckSizeRatio)
        duck.position = DuckState.shared.lastPosition
        addChild(duck)
        duckDirection = .idle
        setDuckDirection(.idle)
        
        // Track mouse movement
        // TODO: consider enabling cross-monitor movement
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) { [weak self] event in
            guard let self = self, let view = self.view, let window = view.window else { return event }
            
            let globalMouseLocation = NSEvent.mouseLocation
            let screenFrame = window.screen?.frame ?? .zero
            let localMouseLocation = CGPoint(x: globalMouseLocation.x - screenFrame.origin.x,
                                              y: globalMouseLocation.y - screenFrame.origin.y)
            
            // Convert macOS window coordinates to SpriteKit scene coordinates
            var sceneLocation = self.convertPoint(fromView: localMouseLocation)
            sceneLocation.x = max(0, min(sceneLocation.x, self.size.width))
            sceneLocation.y = max(0, min(sceneLocation.y, self.size.height))
            self.targetPosition = sceneLocation
            return event
        }
        
        // TODO: get rid of the initial weird frame and stutter in animation
    }
    
    func snapToCenter() {
        shouldSnapToCenter = true
    }

    override func update(_ currentTime: TimeInterval) {
        if (shouldSnapToCenter) {
            DuckState.shared.savePosition(CGPoint(x: size.width / 2, y: size.height / 2))
            duck.position = DuckState.shared.lastPosition
            shouldSnapToCenter = false
            return
        }
        guard let target = targetPosition else { return }

        // Calculate the direction to the target
        let direction = CGVector(dx: target.x - duck.position.x, dy: target.y - duck.position.y)
        let distance = hypot(direction.dx, direction.dy)

        // If the duck is close enough, stop moving
        if distance < idleRadius {
            setDuckDirection(.idle)
            return
        }

        // Normalize the direction vector
        let normalizedDirection = CGVector(dx: direction.dx / distance, dy: direction.dy / distance)

        // Calculate movement for this frame
        let movement = CGVector(dx: normalizedDirection.dx * moveSpeed * timePerFrame,
                                dy: normalizedDirection.dy * moveSpeed * timePerFrame)

        // Update the duck's position
        duck.position.x += movement.dx
        duck.position.y += movement.dy
        if movement.dx < 0 {
            setDuckDirection(.frontWalk)
        }
        else {
            setDuckDirection(.backWalk)
        }
        
        // Save duck position
        DuckState.shared.savePosition(duck.position)
    }
    
    private func setDuckDirection(_ direction: DuckDirection) {
        if duckDirection != direction {
            duck.removeAllActions()
            let (textures, key) = switch direction {
            case .idle: (idleTextures, "idle")
            case .frontWalk: (frontWalkTextures, "frontWalk")
            case .backWalk: (backWalkTextures, "backWalk")
            }
            let action = SKAction.animate(with: textures, timePerFrame: timePerFrame)
            let loopAction = SKAction.repeatForever(action)
            duck.run(loopAction, withKey: key)
            duckDirection = direction
        }
    }
}
