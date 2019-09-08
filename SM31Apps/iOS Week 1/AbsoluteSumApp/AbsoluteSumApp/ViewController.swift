//
//  ViewController.swift
//  AbsoluteSumApp
//
//  Created by Student on 08/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var absoluteSum = 0
    
    @IBOutlet weak var aNumber: UITextField!
    @IBOutlet weak var bNumber: UITextField!
    @IBOutlet weak var cNumber: UITextField!
    @IBOutlet weak var dNumber: UITextField!
    @IBOutlet weak var eNumber: UITextField!
    @IBOutlet weak var fNumber: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getTheAbsoluteSum(){
        
        var aNum: Int = Int(aNumber.text!)!
        var bNum: Int = Int(bNumber.text!)!
        var cNum: Int = Int(cNumber.text!)!
        var dNum: Int = Int(dNumber.text!)!
        var eNum: Int = Int(eNumber.text!)!
        var fNum: Int = Int(fNumber.text!)!
        
        
        if aNum < 0{
            aNum *= -1
        } else if bNum < 0{
            bNum *= -1
        }else if cNum < 0{
            cNum *= -1
        }else if dNum < 0{
            dNum *= -1
        }else if eNum < 0{
            eNum *= -1
        }else if fNum < 0{
            fNum *= -1
        }
        absoluteSum = aNum + bNum + cNum + dNum + eNum + fNum
        
        answerLabel.text = String(absoluteSum)
        
    }

}

