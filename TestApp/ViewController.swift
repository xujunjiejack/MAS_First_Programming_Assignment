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
    @IBOutlet weak var Attraction1Label: UILabel!
    
    @IBOutlet weak var Attraction1LabelCity: UILabel!
    
    @IBOutlet weak var Attraction1LabelPrice: UILabel!
    
    @IBOutlet weak var Attraction2Label: UILabel!
    
    @IBOutlet weak var Attraction2LabelCity: UILabel!
    
    @IBOutlet weak var Attraction2LabelPrice: UILabel!
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Label.text = "Tourist attration"

        let url = URL(string: "https://mas-db.firebaseio.com/attraction.json")!
        
        View1.alpha = 0
        View2.alpha = 0
        Label.center.y = 400
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            let jsonString = String(data: data, encoding: .utf8)!
            
            print(jsonString)
            do {
                
                
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>?]
               
                if let myDict = jsonArray
                {
                    print(myDict)
                    
                    let attraction1 = jsonArray![1]!
                    let attraction2 = jsonArray![2]!
                    print(attraction1)
                    print(attraction2)
                    
                    DispatchQueue.main.sync(
                        execute: {
                            
                            UIView.animate(withDuration: 0.35, delay:0, options:.curveEaseOut, animations: {
//                                options:UILabel.AnimationOptions.curveEaseOut,
                                let label: UILabel! = self.Label
                                label.center.y = CGFloat(150)
                            })
                            
                            UIView.animate(withDuration: 0.3, delay: 0.12, animations: {
                                self.View1.alpha = 1
                                self.View2.alpha = 1
                            })
                            
                            self.Attraction1Label.text = attraction1["attraction_name"] as! String
                            
                            let city1 = attraction1["city"] as! String
                            //                    print (city1)
                            
                            self.Attraction1LabelCity.text = city1
                            
                            self.Attraction1LabelPrice.text =  (attraction1["ticket_price"] as! NSNumber).stringValue
        
                            self.Attraction2Label.text = attraction2["attraction_name"] as! String
                            let city2 = attraction2["city"] as! String
                            print (city2)
                            self.Attraction2LabelCity.text = city2
                            
                                                self.Attraction2LabelPrice.text = (attraction2["ticket_price"] as! NSNumber).stringValue
                        }
                    );
                    
                    
                    
                } else {
                    print("bad json")
                }
                
            }catch let error as NSError{
                print(error)
            }
            
        }

        task.resume()
        
        
//        UIButton.animate(withDuration: 4, animations: {
//            self.Button1.center.x = 400
//        })
//
    }


}

