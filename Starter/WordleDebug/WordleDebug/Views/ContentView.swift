//
//  ContentView.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameModel: GameModel

    var body: some View {
        VStack {
            Board()
            Spacer()
            KeyboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let gameModel = GameModel.previewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(gameModel)
    }
}
