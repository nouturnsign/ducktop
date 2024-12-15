//
//  ContentView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI

struct ContentView : View {
    private let sceneSize = CGSize(width: 64, height: 64)
    
    var body : some View {
        TransparentSpriteView(scene: DuckScene(size: sceneSize))
            .background(Color.clear)
    }
}

#Preview {
    ContentView()
}
