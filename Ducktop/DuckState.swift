//
//  DuckState.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//


import Foundation
import CoreGraphics

class DuckState: ObservableObject {
    static let shared = DuckState()
    @Published var lastPosition: CGPoint = .zero // Last position of the duck
    
    private let positionKey = "DuckLastPosition"

    private init() {
        // Load saved position
        if let savedPosition = UserDefaults.standard.object(forKey: positionKey) as? [CGFloat], savedPosition.count == 2 {
            lastPosition = CGPoint(x: savedPosition[0], y: savedPosition[1])
        }
    }

    func savePosition(_ position: CGPoint) {
        lastPosition = position
        UserDefaults.standard.set([position.x, position.y], forKey: positionKey)
    }
}
