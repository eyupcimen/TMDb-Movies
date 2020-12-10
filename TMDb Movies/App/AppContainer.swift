//
//  AppContainer.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation


let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = NetworkManager()
}
