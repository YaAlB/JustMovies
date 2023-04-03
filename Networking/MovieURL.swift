//
//  MovieURL.swift
//  JustMovies
//
//  Created by Yassin Ali on 26/2/2023.
//

import Foundation

enum MovieURL: String {
    case popular = "popular"
    case upcoming = "upcoming"
    
    public var urlString: String {
        "\(MovieDownloadManager.baseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=\(self.rawValue == "popular" ? MovieDownloadManager.movieListPage : 1)"
    }
}
