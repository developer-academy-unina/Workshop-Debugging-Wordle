//
//  BoardView.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct Board: View {
    @EnvironmentObject var gameModel: GameModel

    var body: some View {
        VStack {
            ForEach(gameModel.attempts.indices) { index in
                BoardRow(attempt: index)
            }
        }
    }
}

struct Board_Previews: PreviewProvider {
    static let modelData = GameModel.previewModel()
    static var previews: some View {
        Board()
            .environmentObject(modelData)
    }
}
