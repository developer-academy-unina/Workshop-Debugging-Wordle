//
//  TileView.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct TileView: View {
    let letter: String
    let letterState: LetterState
    let tileSize: CGFloat
    
    private var letterColor: Color {
        if letterState == .notSubmitted {
            return .black
        } else {
            return .white
        }
    }
    
    private var tileColor: Color {
        switch letterState {
        case .notSubmitted:
            return .white
        case .notFound:
            return .gray
        case .wrongPosition:
            return .yellow
        case .rightPosition:
            return .green
        }
    }
    
    var body: some View {
        Text(letter)
            .font(.title)
            .foregroundColor(letterColor)
            .frame(width: tileSize, height: tileSize)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(tileColor)
                    )
            )
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TileView(letter: "A", letterState: .wrongPosition, tileSize: 40)
            TileView(letter: "B", letterState: .rightPosition, tileSize: 40)
            TileView(letter: "C", letterState: .notFound, tileSize: 40)
            TileView(letter: "D", letterState: .notSubmitted, tileSize: 40)
        }
    }
}
