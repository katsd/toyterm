//
//  ContentView.swift
//  ToyTerm
//
//  Created by Katsu Matsuda on 2020/09/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToyTermView(toyTerm: ToyTerm(text: "")) { input in
            print(input)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
