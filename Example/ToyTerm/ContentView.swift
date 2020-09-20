//
//  ContentView.swift
//  ToyTerm
//
//  Created by Katsu Matsuda on 2020/09/04.
//

import SwiftUI

struct ContentView: View {
    let toyTerm = ToyTerm(text: "")

    var body: some View {
        NavigationView {
            ToyTermView(toyTerm: toyTerm)
                .onAppear {
                    toyTerm.delegate = self
                    toyTerm.prompt()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        HStack {
                            Button(">") {
                                toyTerm.prompt()
                            }
                            Button("OUT") {
                                toyTerm.output("Yay\n")
                            }
                        }
                    }
                }
        }
    }
}

extension ContentView: ToyTermDelegate {
    func input(_ text: String) {
        for _ in 0..<3 {
            toyTerm.output("\(text)\n")
        }
        toyTerm.prompt()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
