//
//  ViewController.swift
//  AlphabetSoup
//
//  Created by Student on 08/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var input: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func orderLetters(){
        let string: String = input.text!
        
        let sortedString = String(string.sorted())
        answer.text = sortedString
    }


}

