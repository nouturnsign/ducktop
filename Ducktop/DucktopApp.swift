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
        
        MenuBarExtra("Ducktop", systemImage: "bird") {
            Button("About Ducktop") {
                let alert = NSAlert()
                alert.messageText = "Ducktop App"
                alert.informativeText = "Version 1.0\nDeveloped by Eric Wang\nEnjoy the duck following your cursor!"
                alert.alertStyle = .informational
                alert.runModal()
            }
            
            Button(isDuckVisible ? "Hide Duck" : "Show Duck") {
                isDuckVisible.toggle()
            }
            
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
        }
    }
}
