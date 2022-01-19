//
//  Keyboard.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import Foundation

enum KeyboardKeyAction: String, Decodable {
    // add a character
    case character
    // delete the last character
    case backspace
    // submit the word
    case enter
}

// describes a virtual keyboard key
struct KeyboardKey: Identifiable, Hashable, Decodable {
    var action: KeyboardKeyAction
    let value: String

    var id: String {
        value
    }
}

// describes virtual keyboard keys in a row
typealias KeyboardRow = [KeyboardKey]

// describes a virtual keyboard
struct Keyboard: Decodable {
    let language: String
    let rows: [KeyboardRow]
}
