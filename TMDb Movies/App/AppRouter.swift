//
//  AppRouter.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit


final class AppRouter {
    
    var window : UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        Util.shared.window = window
    }
    
    func movieListBuild (){
        window = UIWindow(frame: UIScreen.main.bounds)
        let movies = GeneralBuilder.makeMovies()
        window.rootViewController = movies
        window.makeKeyAndVisible()
    }
    
}

