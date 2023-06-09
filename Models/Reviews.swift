//
//  Reviews.swift
//  JustMovies
//
//  Created by Dina Aly on 26/2/2023.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
    
}
