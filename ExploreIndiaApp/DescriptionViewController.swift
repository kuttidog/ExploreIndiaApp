//
//  DescriptionViewController.swift
//  ExploreIndiaApp
//
//  Created by Kulanthaivel, Myl (.) on 14/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class DescriptionViewController: UIViewController {
    
    var appTitleChange: String
    var descText: String
    init(titleString: String, desc: String) {
        self.appTitleChange = titleString
        self.descText = desc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var appTitle: UILabel = {
        var title = UILabel()
      
        return title
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "City desceription"
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        appTitle.text = appTitleChange
        label.text = descText
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(250)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(400)
        }
    }
    
    
}
