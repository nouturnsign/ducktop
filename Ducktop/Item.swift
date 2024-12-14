//
//  Item.swift
//  Ducktop
//
//  Created by Eric Wang on 12/13/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
