//
//  GameModel.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import Foundation

enum LetterState {
    // attempt wasn't yet submitted
    case notSubmitted
    // solution doesn't contain the letter
    case notFound
    // solution contains the letter but it is in a wrong position
    case wrongPosition
    // solution contains the letter at this position
    case rightPosition
}

class GameModel: ObservableObject {
    let numberOfAttempts = 6
    let numberOfLetters = 5

    @Published var keyboard: Keyboard = load("keyboard-layout-en.json")

    // keeps a solution
    @Published var word: String = ""

    // all attempts
    @Published var attempts: [String] = []

    // index of the current attempt
    @Published var currentAttempt: Int = 0

    init() {
        newGame()
    }

    func newGame() {
        // TODO: Choose a random word from a dictionary
        word = "ABCDE"
        attempts = Array(repeating: "", count: numberOfAttempts)
        currentAttempt = 0
    }

    func checkAttempt() {
        if currentAttempt < numberOfAttempts {
            currentAttempt += 1
        }
    }

    func keyDown(key: KeyboardKey) {
        guard currentAttempt < numberOfAttempts else { return }
        let attemptedWord = attempts[currentAttempt]
        switch key.action {
        case .character:
            attempts[currentAttempt].append(key.value)
        case .backspace:
            if !attemptedWord.isEmpty {
                attempts[currentAttempt].removeLast()
            }
        case .enter:
            if attemptedWord.count == numberOfLetters {
                checkAttempt()
            }
        }
    }

    // returns a state of the letter for requested attempt
    func letterState(for attempt: Int, at index: Int) -> LetterState {
        let attemptedWord = attempts[attempt]
        guard
            wasSubmitted(attempt: attempt),
            word.count == attemptedWord.count
        else {
            return .notSubmitted
        }
        if word[index] == attemptedWord[index] {
            return.rightPosition
        }
        if let char = attemptedWord[index], word.contains(char) {
            return .wrongPosition
        }
        return .notFound
    }

    // indicates whether the attempt was submitted
    func wasSubmitted(attempt: Int) -> Bool {
        return attempt < currentAttempt
    }

    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard
            let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    static func previewModel() -> GameModel {
        let modelData = GameModel()
        modelData.attempts[0] = "GHJKL"
        modelData.attempts[1] = "ADOPU"
        modelData.attempts[2] = "AWEDV"
        modelData.currentAttempt = 2
        return modelData
    }
}
