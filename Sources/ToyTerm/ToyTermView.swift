//
//  ToyTermView.swift
//  ToyTerm
//  
//  Created by Katsu Matsuda on 2020/09/04.
//

import SwiftUI

public struct ToyTermView: View {
    @ObservedObject var toyTerm: ToyTerm

    public init(_ toyTerm: ToyTerm) {
        self.toyTerm = toyTerm
    }

    public var body: some View {
        TextViewRepresentable(toyTerm: toyTerm)
    }

}

struct TextViewRepresentable: UIViewRepresentable {
    @ObservedObject var toyTerm: ToyTerm

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.text = toyTerm.text
        textView.font = .monospacedSystemFont(ofSize: 15, weight: .medium)
        textView.smartInsertDeleteType = .no
        textView.smartQuotesType = .no
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = toyTerm.text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(toyTerm: toyTerm)
    }

}

extension TextViewRepresentable {
    class Coordinator: NSObject, UITextViewDelegate {
        let toyTerm: ToyTerm

        init(toyTerm: ToyTerm) {
            self.toyTerm = toyTerm
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            toyTerm.addText(text: text, range: range)
        }

        func textViewDidChange(_ textView: UITextView) {
            toyTerm.text = textView.text
            toyTerm.input()
        }
    }
}
