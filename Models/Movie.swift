//
//  Movie.swift
//  JustMovies
//
//  Created by Yassin Ali on 25/2/2023.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
    var page: Int?
    var total_pages: Int?
    
}

struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Int?
    var video: Bool?
    var adult: Bool?
    var release_date: String?
    var posterPath: String {
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return ""
        }
    }
    var voteAverage: Double {
        if let avg = vote_average {
            return avg / 10.0
        }
        return 0.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else { return "" }
        return "\(title)(\(lang))"
    }
}
