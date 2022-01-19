//
//  WordleDebugApp.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

@main
struct WordleDebugApp: App {
    @StateObject private var gameModel = GameModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameModel)
        }
    }
}
