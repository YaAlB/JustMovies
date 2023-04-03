//
//  HomeTabView.swift
//  JustMovies
//
//  Created by Yassin Ali on 25/2/2023.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Int {
        case movie
        case credit
    }
    
    @State private var selectedTab = Tab.movie
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                MoviesView().tabItem {
                    tabBarItem(text: "Movies", image: "film")
                }.tag(Tab.movie)
                
                CreditView().tabItem {
                    tabBarItem(text: "Credit", image: "info.circle.fill")
                }.tag(Tab.credit)
            }
        }
    }
    
    private func tabBarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
