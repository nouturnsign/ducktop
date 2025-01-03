//
//  ContentView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI

struct ContentView : View {
    @Binding var isDuckVisible: Bool
    @Binding var snapToCenter: Bool
    @Binding var screenIndex: Int
    
    var body : some View {
        if isDuckVisible {
            TransparentSpriteView(scene: DuckScene(size: CGSize(width: 256, height: 256)), snapToCenter: $snapToCenter, screenIndex: $screenIndex)
        }
    }
}

#Preview {
    ContentView(isDuckVisible: .constant(true), snapToCenter: .constant(false), screenIndex: .constant(0))
}
