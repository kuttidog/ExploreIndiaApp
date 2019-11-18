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
  
    var appTitleChange: String
  
    
    init(titleString: String) {
        self.appTitleChange = titleString
        
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
        done.addTarget(self, action: #selector(didTapDoneButton(sender:)), for: .touchUpInside)
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
    
    @objc func didTapDoneButton(sender: UIButton) {
        
        var state = (dictionaryExploreIndia["state"] as? [String : Any]) ?? [:]
        let city = state["Andhra"] as? [String : String] ?? [:]
        let cityDescription: String = city["\(holdertext.text!)"] ?? ""
        let vc = DescriptionViewController(titleString: holdertext.text!, desc: cityDescription)
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    }
 



