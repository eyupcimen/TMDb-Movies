//
//  Constant.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation
import UIKit

let www = "https://api.themoviedb.org/3"
let apiKey = "this_is_your_api_key_for_TMDb"
let additionalValues = "?api_key=\(apiKey)&page=1&include_video=false&sort_by=popularity.desc&language=en-US&include_adult=false"

let DiscoverMovie  = www + "/discover/movie" + additionalValues
let SliderUrl  = www + "/movie/now_playing" + additionalValues
let MainUrl  = www + "/movie/upcoming" + additionalValues
let SearchUrl  = www + "/search/movie" + additionalValues + "&query="
let DetailUrl  = www + "/movie/{movie_id}" + additionalValues
let CreditsUrl = www + "/movie/{movie_id}/credits" + additionalValues
let ActorDetailUrl  = www + "/person/{person_id}" + additionalValues
let SimilarUrl = www + "/movie/{movie_id}/similar" + additionalValues
let PicUrl = "https://image.tmdb.org/t/p/w500/"
let ImdbUrl = "https://www.imdb.com/title/"

// This commit added for Github actions :)
