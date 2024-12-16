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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // TODO: use a duck image instead of bird system image
        MenuBarExtra("Ducktop", systemImage: "bird") {
            Button("About Ducktop") {
                // TODO: make the about page easier to see
                let alert = NSAlert()
                alert.messageText = "Ducktop App"
                alert.informativeText = "Version 1.0\nDeveloped by Eric Wang\nEnjoy the duck following your cursor!"
                alert.alertStyle = .informational
                alert.runModal()
            }
            
            Button(isDuckVisible ? "Hide Duck" : "Show Duck") {
                // TODO: this setting doesn't do anything currently; add graceful enter and exit animations
                isDuckVisible.toggle()
            }
            
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
        }
    }
}
