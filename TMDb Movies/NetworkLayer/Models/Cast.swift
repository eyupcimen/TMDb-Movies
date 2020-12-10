//
//  Cast.swift
//  TMDb Movies
//
//  Created by eyup cimen on 1.12.2020.
//

import Foundation

struct CastResponse : Codable {
    
    let cast : [Cast]?
    let id : Int?
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

struct Cast : Codable {
    
    let adult : Bool?
    let castId : Int?
    let character : String?
    let creditId : String?
    let gender : Int?
    let id : Int?
    let knownForDepartment : String?
    let name : String?
    let order : Int?
    let originalName : String?
    let popularity : Float?
    var profilePath : String?
    let alsoKnownAs : [String]?
    let biography : String?
    let birthday : String?
    let deathday : String?
    let homepage : String?
    let imdbId : String?
    let placeOfBirth : String?
    
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case order = "order"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case alsoKnownAs = "also_known_as"
        case biography = "biography"
        case birthday = "birthday"
        case deathday = "deathday"
        case homepage = "homepage"
        case imdbId = "imdb_id"
        case placeOfBirth = "place_of_birth"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        castId = try values.decodeIfPresent(Int.self, forKey: .castId)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        knownForDepartment = try values.decodeIfPresent(String.self, forKey: .knownForDepartment)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        profilePath = profilePath != nil ? (PicUrl + profilePath!) : profilePath
        alsoKnownAs = try values.decodeIfPresent([String].self, forKey: .alsoKnownAs)
        biography = try values.decodeIfPresent(String.self, forKey: .biography)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        deathday = try values.decodeIfPresent(String.self, forKey: .deathday)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        placeOfBirth = try values.decodeIfPresent(String.self, forKey: .placeOfBirth)
    }
    
}
