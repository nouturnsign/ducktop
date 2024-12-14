//
//  ContentView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI

fileprivate let duckWidth = 64
fileprivate let duckHeight = 64

struct ContentView : View {
    private let scene = DuckScene(size: CGSize(width: duckWidth, height: duckHeight))
    
    var body : some View {
        TransparentSpriteView(scene: scene)
            .background(Color.clear)
            .frame(width: CGFloat(duckWidth), height: CGFloat(duckHeight))
    }
}

#Preview {
    ContentView()
}
