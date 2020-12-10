//
//  Movie.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation
 
struct Movie : Codable {

    var Id : Int?
    var overview : String?
    var voteAverage : Double?
    var imdbLink : String?
    var originalTitle: String?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var video: Bool?
    var runtime : Int?
    var genres : [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case originalTitle = "original_title"
        case overview
        case voteAverage = "vote_average"
        case imdbLink
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case backdropPath = "backdrop_path"
        case runtime
        case genres
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Id = try values.decodeIfPresent(Int.self, forKey: .Id)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        imdbLink = try values.decodeIfPresent(String.self, forKey: .imdbLink)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        posterPath = posterPath != nil ? (PicUrl + posterPath!) : posterPath
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        backdropPath = try? values.decodeIfPresent(String.self, forKey: .backdropPath)
        backdropPath = backdropPath != nil ? (PicUrl + backdropPath!) : backdropPath
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        genres = try values.decodeIfPresent([Genre].self, forKey: .genres)
    }

}


struct Genre : Codable {

    var Id : Int?
    var name : String?
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case name
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Id = try values.decodeIfPresent(Int.self, forKey: .Id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
