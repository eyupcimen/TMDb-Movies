//
//  ActorDetailViewModel.swift
//  TMDb Movies
//
//  Created by eyup cimen on 1.12.2020.
//

import Foundation


class ActorDetailViewModel {
    
    private let service : NetworkManager
    var castId : Int = -1
    
    init(service:NetworkManager) {
        self.service = service
    }
    
    func getActorDetail( _ completion : @escaping (Cast) -> Void) {
        
        let movieUrl = ActorDetailUrl.replacingOccurrences(of: "{person_id}", with: String(castId))
        service.requestForObject(movieUrl, success: { (response : Cast) in

            completion(response)

        }, failure: { (error) in })
    }
  
    
}
