//
//  ViewController.swift
//  FizzBuzzApp
//
//  Created by Student on 08/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var list: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 1...100{
            list.text += "\(index), "
        }
    }
    
    @IBAction func FizzBuzz(){
        list.text = ""
        for index in 1...100{
            if index % 5 == 0 && index % 3 == 0{
                list.text += "FizzBuzz, "
            } else if index % 3 == 0{
                list.text += "Fizz, "
            } else if index % 5 == 0{
                list.text += "Buzz, "
            } else{
                list.text += "\(index), "
            }
            
        }
    }
    @IBAction func Back(){
        list.text = ""
        for index in 1...100{
            list.text += "\(index), "
        }
    }


}

