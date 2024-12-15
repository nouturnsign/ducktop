//
//  TransparentWindow.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI
import AppKit

struct TransparentWindow: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()

        // Access the NSWindow to modify its properties
        DispatchQueue.main.async {
            if let window = view.window {
                // Set the window to invisible
                window.isOpaque = false
                window.backgroundColor = .clear
                window.level = .floating
                window.titleVisibility = .hidden
                window.titlebarAppearsTransparent = true
                window.styleMask.remove(.titled) // Remove title bar
                window.ignoresMouseEvents = true // Make the window non-clickable
                
                // Set the window to full-screen
                window.setFrame(NSScreen.main?.frame ?? NSRect.zero, display: true)
                window.collectionBehavior = .fullScreenPrimary
                window.makeKeyAndOrderFront(nil) // Bring window to front
            }
        }

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
