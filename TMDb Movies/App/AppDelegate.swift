//
//  AppDelegate.swift
//  TMDb Movies
//
//  Created by eyup cimen on 28.11.2020.
//

import UIKit
import SVProgressHUD


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router : AppRouter!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 80/255 , green: 180/255 , blue: 210/255 , alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width / 2,
        vertical: UIScreen.main.bounds.height / 2))
        
        app.router.movieListBuild()
        return true
    }
 

}

