//
//  ViewController.swift
//  LibSimpleRisk
//
//  Created by 9152264 on 09/29/2025.
//  Copyright (c) 2025 9152264. All rights reserved.
//

import UIKit
import FabricSimpleRisk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("获取Token", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.green, for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = self.view.center
        
        button.addTarget(self, action: #selector(onGetToken), for: .touchUpInside)

    }
    
    @objc func onGetToken() {
        let forterToken = FabricSimpleRisk.getForterToken()
        debugPrint("forterToken: \(String(describing: forterToken))")
        FabricSimpleRisk.getBlackBox { blackBox in
            debugPrint("blackBox: \(String(describing: blackBox))")

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

