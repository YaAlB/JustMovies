//
//  MovieCell.swift
//  JustMovies
//
//  Created by Yassin Ali on 27/2/2023.
//

import SwiftUI

struct MovieCell: View {
    
    var movie: Movie
    
    var body: some View {
        
        VStack {
            moviePoster
            
            VStack(alignment: .leading) {
                movieTitle
                
                HStack {
                    movieReleaseDate
                    Spacer()
                    movieVotes
                }
                .padding(.top, 0.5)
            }
        }.padding(.vertical, 10.0)
    }
    
    private var moviePoster: some View {
        AsyncImage(url: URL(string: movie.posterPath)!) {
            Rectangle().foregroundColor(Color.gray.opacity(0.4))
        } image: { (img) -> Image in
            Image(uiImage: img)
                .resizable()
        }
        .frame(width: 220, height: 300)
        .animation(.easeInOut(duration: 0.5), value: true)
        .transition(.opacity)
        .scaledToFill()
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    private var movieTitle: some View {
        Text(movie.titleWithLanguage)
            .font(.headline)
    }
    
    private var movieVotes: some View {
        Group {
            Text(String.init(format: "%0.2f", movie.vote_average ?? 0.0))
                .foregroundColor(Color("prezzi_theme"))
                .font(.subheadline)
            Text("/ 10")
                .foregroundColor(Color("prezzi_theme"))
                .font(.subheadline)
        }
    }
    
    private var movieReleaseDate: some View {
        Text(movie.release_date ?? "")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
