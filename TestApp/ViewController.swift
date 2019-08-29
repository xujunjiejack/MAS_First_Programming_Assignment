//
//  ViewController.swift
//  TestApp
//
//  Created by Junjie Xu on 8/28/19.
//  Copyright © 2019 Junjie Xu. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Label.text = "hello world"
//        UIButton.animate(withDuration: 0.2, animations: {
//            Button1.center.x = 100
//        })
    }


}

