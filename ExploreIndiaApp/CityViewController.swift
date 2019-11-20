//
//  CityViewController.swift
//  ExploreIndiaApp
//
//  Created by Kulanthaivel, Myl (.) on 14/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class CityViewController: UIViewController {
    
    weak var delegate: CityCoordinatorDelegate?
    var appTitleChange: String
    var cityModel: CityViewModel
    
    init(titleString: String, cityModel: CityViewModel) {
        self.appTitleChange = titleString
        self.cityModel = cityModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var appTitle: UILabel = {
        var title = UILabel()
//        title.text = "Explore India!"
        return title
    }()
    
    var label: UILabel = {
        var label = UILabel()
//        label.text = "Select a state from Below"
        return label
    }()
    
    var holdertext: UITextField = {
        var holdtext = UITextField()
        holdtext.placeholder = "Enter a city to Explore"
        return holdtext
    }()
    
    var submit: UIButton = {
        var done = UIButton()
        done.setTitle("Done", for: .normal)
        done.addTarget(self, action: #selector(cityDidTapDoneButton(sender:)), for: .touchUpInside)
        return done
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        appTitle.text = appTitleChange
        label.text = "Select a city from \(appTitleChange)"
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(250)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.top).offset(50)
        }
        
        view.addSubview(holdertext)
        holdertext.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.top).offset(30)
        }
        
        
        view.addSubview(submit)
        submit.snp.makeConstraints { (make) in
            make.top.equalTo(holdertext.snp.top).offset(30)
        }
        
    }
    
    @objc func cityDidTapDoneButton(sender: UIButton) {
        
        var state = (dictionaryExploreIndia["state"] as? [String : Any]) ?? [:]
        let city = state["\(appTitleChange)"] as? [String : String] ?? [:]
        let cityDescription: String = city["\(holdertext.text!)"] ?? ""
        guard let enteredCity = holdertext.text else {return}
        delegate?.cityDidTapDoneButton(titleString: enteredCity, cityDesc: cityDescription)
    }
    
}

protocol CityCoordinatorDelegate: class {
    func cityDidTapDoneButton(titleString: String, cityDesc: String)
}


