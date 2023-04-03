//
//  DiscoverView.swift
//  JustMovies
//
//  Created by Yassin Ali on 25/2/2023.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Image("blue_square_2")
            Text("Just Movies")
                .font(.title)
                .padding()

            Text("This app is developed for coding challenge purposes only")
                .font(.subheadline)
        }.padding()
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
