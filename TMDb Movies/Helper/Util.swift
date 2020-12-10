//
//  Util.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation
import UIKit
import SVProgressHUD

class Util {
    
    static var shared = Util()
    var window = UIWindow()
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }

    func showHud() {
        SVProgressHUD.show()
    }
    @objc func dismissLoading(recognizer: UITapGestureRecognizer) {
        removeHud()
    }
    func removeHud() {
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
    }
    
  
}

