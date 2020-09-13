//
//  ToyTerm.swift
//  ToyTerm
//  
//  Created by Katsu Matsuda on 2020/09/04.
//

import Foundation

public class ToyTerm: ObservableObject {

    @Published public var text: String

    let onInput: (String) -> ()

    private(set) var canWrite = false

    private var inputStartPosition = 0

    private static let promptText = "\n> "

    static let enterText = "\n"

    public init(text: String, _ onInput: @escaping (String) -> ()) {
        self.text = text
        self.onInput = onInput
    }

    public func output(_ text: String) {
        canWrite = false
        self.text += text
    }

    public func prompt() {
        text += ToyTerm.promptText
        inputStartPosition = text.count
        canWrite = true
    }

    func input() {
        onInput(String(text.suffix(text.count - inputStartPosition)))
    }

    func addText(_ text: String) -> Bool {
        if !canWrite {
            return false
        }

        if text == ToyTerm.enterText {
            canWrite = false
            return true
        }

        if text == "\u{8}" {
            
        }

        return true
    }
}