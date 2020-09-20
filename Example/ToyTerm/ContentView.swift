//
//  ContentView.swift
//  ToyTerm
//
//  Created by Katsu Matsuda on 2020/09/04.
//

import SwiftUI

struct ContentView: View {

    let toyTerm = ToyTerm(text: "") { input in
        print(input)
    }

    var body: some View {
        NavigationView {
            ToyTermView(toyTerm: toyTerm)
                .onAppear {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
