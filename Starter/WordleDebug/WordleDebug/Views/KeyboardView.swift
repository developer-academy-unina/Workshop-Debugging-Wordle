//
//  KeyboardView.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var gameModel: GameModel
    
    private let spacing: CGFloat = 5

    private var maxNumberOfKeysInRow: Int {
        gameModel.keyboard.rows.reduce(0) {
            $0 > $1.count ? $0 : $1.count
        }
    }

    private var keySize: CGFloat {
        (UIScreen.main.bounds.width - CGFloat(maxNumberOfKeysInRow + 1) * spacing) / CGFloat(maxNumberOfKeysInRow)
    }

    var body: some View {
        VStack(spacing: spacing) {
            ForEach(gameModel.keyboard.rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row) { key in
                        Text(key.value)
                            .frame(width: keySize, height: keySize)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .onTapGesture {
                                gameModel.keyDown(key: key)
                            }
                    }
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static let gameModel = GameModel()
    static var previews: some View {
        KeyboardView()
            .environmentObject(gameModel)
    }
}
