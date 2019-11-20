//
//  HomeCoordinator.swift
//  ExploreIndiaApp
//
//  Created by Kulanthaivel, Myl (.) on 18/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator {
    func start()
}

class HomeCoordinator: Coordinator {
    private let router: UINavigationController
    init(router: UINavigationController) {
        self.router = router
    }
    
    func start() {
        let vm = HomeViewModel()
        let vc = HomeViewController(homeView: vm)
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func didTapDoneButton(titleString: String) {
        let sendTitle = titleString
        let vm = CityViewModel()
        let vc = CityViewController(titleString: sendTitle, cityModel: vm)
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: CityCoordinatorDelegate {
    func cityDidTapDoneButton(titleString: String, cityDesc: String) {
        let vc = DescriptionViewController(titleString: titleString, desc: cityDesc)
        router.pushViewController(vc, animated: true)
        
    }
    
    
}
