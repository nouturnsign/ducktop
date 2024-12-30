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
    
    var body: some Scene {
        WindowGroup {
            ContentView(isDuckVisible: $isDuckVisible, snapToCenter: $snapToCenter)
        }

        MenuBarExtra("Ducktop", image: "duck-icon") {
            Button(isDuckVisible ? "Hide Duck" : "Show Duck") {
                // TODO: add graceful enter and exit animations
                isDuckVisible.toggle()
            }
            
            Button("Snap to Center") {
                snapToCenter = true
            }
            
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
        }
    }
}
