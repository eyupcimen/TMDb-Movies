//
//  VCBuilders.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

final class GeneralBuilder {
    
    static func makeMovies() -> UINavigationController {
        let moviesViewController = MoviesViewController()
        moviesViewController.viewModel = MoviesViewModel(service : app.service)
        let navigationController = UINavigationController(rootViewController: moviesViewController)
        return navigationController
    }
    
    static func makeMovieDetail(_ movieId : Int) -> MovieDetailViewController {
        let movieDetail = MovieDetailViewController()
        movieDetail.viewModel = MovieDetailViewModel(service : app.service)
        movieDetail.viewModel.movieId = movieId
        return movieDetail
    }
    
    static func makeActorDetail(_ castId : Int) -> ActorDetailViewController {
        let actorDetail = ActorDetailViewController()
        actorDetail.viewModel = ActorDetailViewModel(service : app.service)
        actorDetail.viewModel.castId = castId
        return actorDetail
    }
}
