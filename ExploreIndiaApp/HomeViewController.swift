//
//  ViewController.swift
//  ExploreIndiaApp
//
//  Created by Kulanthaivel, Myl (.) on 14/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {

    
    var appTitle: UILabel = {
        var title = UILabel()
        title.text = "Explore India!"
        return title
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "Select a state from Below"
        return label
    }()
    
    var holdertext: UITextField = {
        var holdtext = UITextField()
        holdtext.placeholder = "Enter a state to Explore"
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
    @objc func didTapDoneButton(sender:UIButton) {
        guard let state = holdertext.text else { return }
        var states = (dictionaryExploreIndia["state"] as? [String : Any]) ?? [:]
        let city = states["\(state)"] as? [String : String] ?? [:]
        let vc = CityViewController(titleString: state)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

