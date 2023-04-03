//
//  JustMoviesTests.swift
//  JustMoviesTests
//
//  Created by Yassin Ali on 2/3/2023.
//

import XCTest
@testable import JustMovies

class JustMoviesTests: XCTestCase {
    
    func testVoteAverageIsReturningDoubleValue() {
      // given
        let movie = Movie.init(id: 12, title: "The Movie", original_language: "en", vote_average: 80.0)
        
        // then
        XCTAssertEqual(movie.voteAverage, 8.0, "voteAverage computed is true")
    }

    func testVoteAverageIsReturningWrongDoubleValue() {
      // given
        let movie = Movie.init(id: 12, title: "The Movie", original_language: "en", vote_average: 50.0)
        
        // then
        XCTAssertNotEqual(movie.voteAverage, 5.5, "voteAverage computed is wrong")
    }
    
    func testprofile_pathIsReturningRightImagePath() {
      // given
        let cast = Cast.init(id: 100, name: "John", profile_path: "johnpic.img")
        
        // then
        XCTAssertEqual(cast.profilePhoto, "https://image.tmdb.org/t/p/original/johnpic.img", "profilePhoto computed is right")
    }


}
