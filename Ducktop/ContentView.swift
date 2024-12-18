//
//  ContentView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI

struct ContentView : View {
    @Binding var isDuckVisible: Bool
    
    var body : some View {
        if isDuckVisible {
            TransparentSpriteView(scene: DuckScene(size: CGSize(width: 256, height: 256)))
        }
    }
}

#Preview {
    ContentView(isDuckVisible: .constant(true))
}
