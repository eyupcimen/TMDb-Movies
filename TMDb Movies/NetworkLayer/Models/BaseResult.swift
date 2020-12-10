//
//  BaseResult.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation


struct BaseResult <T: Decodable>: Decodable {
    
    let results: [T]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
