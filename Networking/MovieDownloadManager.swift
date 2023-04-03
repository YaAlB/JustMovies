//
//  movieDownloadManager.swift
//  JustMovies
//
//  Created by Yassin Ali on 26/2/2023.
//

import Foundation

final class MovieDownloadManager: ObservableObject {
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    @Published var currentPage: Int?
    @Published var totalPage: Int?
    static var movieListPage = 1
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getPopular(page: Int) {
        MovieDownloadManager.movieListPage = MovieDownloadManager.movieListPage + page
        getMovies(movieUrl: .popular)
    }
    
    func getUpcoming() {
        getMovies(movieUrl: .upcoming)
    }
    
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.cast = response.cast
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func getMovies(movieUrl: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieUrl.urlString) { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
                self.currentPage = movieResponse.page
                self.totalPage = movieResponse.total_pages
            case .failure(let err):
                print(err)
            }
        }
    }
}
