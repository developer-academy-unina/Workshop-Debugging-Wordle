//
//  BoardRow.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct BoardRow: View {
    @EnvironmentObject var gameModel: GameModel
    var attempt: Int

    private let spacing: CGFloat = 10

    private var attemptedWord: String {
        gameModel.attempts[attempt]
    }

    private func tileState(at index: Int) -> LetterState {
        gameModel.letterState(for: attempt, at: index)
    }

    private var tileSize: CGFloat {
        let numberOfTitles = gameModel.numberOfLetters
        return (UIScreen.main.bounds.width - CGFloat(numberOfTitles + 1) * spacing) / CGFloat(numberOfTitles)
    }

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<gameModel.numberOfLetters) { index in
                TileView(
                    letter: attemptedWord[index] ?? "",
                    letterState: tileState(at: index),
                    tileSize: tileSize
                )
            }
        }
    }
}

struct BoardRow_Previews: PreviewProvider {
    static let modelData = GameModel.previewModel()
    static var previews: some View {
        VStack {
            BoardRow(attempt: 1)
                .environmentObject(modelData)
        }
    }
}
