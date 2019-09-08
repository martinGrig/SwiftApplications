//
//  ViewController.swift
//  FindTheSmallestNumberInArray
//
//  Created by Student on 08/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numbers: [Int] = []
    
    @IBOutlet weak var numberInPut: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var list:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addANumber(){
        let input: Int = Int(numberInPut.text!)!
        numbers.append(input)
        list.text += "\(input)\n"
    }
    @IBAction func findTheSmallestNumInArray(){
        let smallest = numbers.min()
        answerLabel.text = String(smallest!)
        
    }


}

