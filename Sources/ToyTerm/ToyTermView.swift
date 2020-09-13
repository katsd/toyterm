//
//  ToyTermView.swift
//  ToyTerm
//  
//  Created by Katsu Matsuda on 2020/09/04.
//

import SwiftUI

public struct ToyTermView: View {

    @StateObject public var toyTerm: ToyTerm

    public var body: some View {
        TextViewRepresentable(toyTerm: toyTerm)
    }

}

struct TextViewRepresentable: UIViewRepresentable {
    @StateObject var toyTerm: ToyTerm

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.text = toyTerm.text
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
            if !toyTerm.canWrite {
                return false
            }

            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            toyTerm.text = textView.text
        }
    }
}
