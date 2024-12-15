//
//  TransparentView.swift
//  Ducktop
//
//  Created by Eric Wang on 12/14/24.
//

import SwiftUI
import AppKit

struct TransparentView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        return TransparentNSView(frame: .zero)
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
