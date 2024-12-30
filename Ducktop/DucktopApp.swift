//
//  DucktopApp.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI

@main
struct DucktopApp: App {
    @State var isDuckVisible: Bool = true
    @State var snapToCenter: Bool = true
    @State var screenIndex: Int = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView(isDuckVisible: $isDuckVisible, snapToCenter: $snapToCenter, screenIndex: $screenIndex)
        }

        MenuBarExtra("Ducktop", image: "duck-icon") {
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
            
            Divider()
            
            Button(isDuckVisible ? "Hide Duck" : "Show Duck") {
                // TODO: add graceful enter and exit animations
                isDuckVisible.toggle()
            }
            
            Button("Snap to Center") {
                snapToCenter = true
            }
            
            Menu("Change Screen...") {
                ForEach(0..<NSScreen.screens.count, id: \.self) { index in
                    Button("Screen \(index + 1)") {
                        screenIndex = index
                    }
                }
            }
        }
    }
}
