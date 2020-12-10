//
//  MovieDetailViewModel.swift
//  TMDb Movies
//
//  Created by eyup cimen on 30.11.2020.
//

import Foundation

class MovieDetailViewModel {
    
    private let service : NetworkManager
    var movieId : Int = -1
    var castList : [Cast] = []
    
    init(service:NetworkManager) {
        self.service = service
    }
    
    func getMovieDetail( _ completion : @escaping (Movie) -> Void) {
        
        let movieUrl = DetailUrl.replacingOccurrences(of: "{movie_id}", with: String(movieId))
        service.requestForObject(movieUrl, success: { (response : Movie) in

            completion(response)

        }, failure: { (error) in })
    }
    
    func getCastList( _ completion : @escaping () -> Void) {
        
        let movieUrl = CreditsUrl.replacingOccurrences(of: "{movie_id}", with: String(movieId))
        service.requestForObject(movieUrl, success: { (response : CastResponse) in

            self.castList = response.cast!
            completion()

        }, failure: { (error) in })
    }
    
}
