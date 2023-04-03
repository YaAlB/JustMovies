//
//  ContentView.swift
//  JustMovies
//
//  Created by Yassin Ali on 25/2/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Group {
                HomeTabView()
            }.navigationBarTitle("Movies", displayMode: .automatic)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
