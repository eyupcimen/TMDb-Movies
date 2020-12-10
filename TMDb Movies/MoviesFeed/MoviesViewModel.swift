//
//  MovieViewModel.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation

class MoviesViewModel {
    
    private let service : NetworkManager
    var movies = [Movie]()
    
    init(service:NetworkManager) {
        self.service = service
    }
    
    func getMovies ( _ completion: @escaping () -> Void) {
        service.requestForArray(DiscoverMovie , success: { (response : BaseResult<Movie>) in

            if let resultArray = response.results {
                self.movies = resultArray
            }
            completion()
        }, failure: { (error) in })
    }
    
    func getSearchWithKeyword(_ keyword : String, _ completion : @escaping () -> Void) {
        
        movies.removeAll()
        let searchUrl = SearchUrl + keyword
        service.requestForArray(searchUrl, success: { (response : BaseResult<Movie>) in

            if let resultArray = response.results {
                self.movies = resultArray
            }
            completion()
        }, failure: { (error) in })
    }
    
    func clearResults() {
        movies.removeAll()
    }
    
}
