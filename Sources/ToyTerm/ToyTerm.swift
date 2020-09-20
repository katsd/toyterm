//
//  ToyTerm.swift
//  ToyTerm
//  
//  Created by Katsu Matsuda on 2020/09/04.
//

import Foundation

public class ToyTerm: ObservableObject {

    @Published public var text: String

    public var delegate: ToyTermDelegate?

    private(set) var canWrite = false

    private var inputStartPosition = 0

    private var needInput = false

    private static let promptText = "\n> "

    static let enterText = "\n"

    public init(text: String) {
        self.text = text
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
        if !needInput {
            return
        }
        delegate?.input(String(text.suffix(text.count - inputStartPosition).dropLast(1)))
        needInput = false
    }

    func addText(text enteredText: String, range: NSRange) -> Bool {
        if !canWrite {
            return false
        }

        if range.location < inputStartPosition {
            return false
        }

        if enteredText == ToyTerm.enterText {
            needInput = true
            canWrite = false
            return true
        }

        if enteredText.isEmpty {
            if inputStartPosition == self.text.count {
                return false
            }
        }

        return true
    }
}