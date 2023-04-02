//
//  ContentView.swift
//  Knownen
//
//  Created by Romi on 14/01/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            WebView(url: URL(string: "https://fr.wikipedia.org/wiki/Special:Random")!)
            HStack {
                Spacer()
                Button("👎             ") {
                    WikiFile.addEntry(url: Page.current!, interest: "-1")
                }.font(.system(size: 30, weight: .bold)).background(RoundedRectangle(cornerRadius: 5).fill(.red))
                Spacer()
                Button("👍             ") {
                    WikiFile.addEntry(url: Page.current!, interest: "1")
                }.font(.system(size: 30, weight: .bold)).background(RoundedRectangle(cornerRadius: 5).fill(.green))
                Spacer()
            }.padding()
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
