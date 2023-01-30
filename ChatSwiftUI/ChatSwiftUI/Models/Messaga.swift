//
//  Messaga.swift
//  ChatSwiftUI
//
//  Created by Anton Zyabkin on 29.01.2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

