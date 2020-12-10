//
//  BaseViewController.swift
//  TMDb Movies
//
//  Created by eyup cimen on 30.11.2020.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func handleErrorMessage (_ err : String) {
        let alert = UIAlertController(title: "Error", message: err , preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


