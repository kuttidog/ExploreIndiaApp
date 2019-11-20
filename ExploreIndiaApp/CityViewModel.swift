//
//  CityViewModel.swift
//  ExploreIndiaApp
//
//  Created by Kulanthaivel, Myl (.) on 18/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

class CityViewModel {
    
    
    var appTitle: String = ""
    var labelText: String = ""
    var placeHolder: String = ""
    
    func didTapDoneButton(appTitle: String) {
        let appT = appTitle
        labelText = "Choose a City from \(appT)"
        placeHolder = "Choose a city to explore"
    }
}
