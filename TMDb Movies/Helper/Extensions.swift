//
//  Extensions.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation

extension String {
    func encodeUrl() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
