//
//  ViewController.swift
//  SoundBoardApp
//
//  Created by Student on 07/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func aTapped(_ sender: Any) {
        let url = Bundle.main.url(forResource: "a", withExtension: "mp3")
        guard url != nil else{
            return
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch
        {
            print("error")
        }
    }
    @IBAction func bTapped(_ sender: Any) {
        let url = Bundle.main.url(forResource: "b", withExtension: "mp3")
        guard url != nil else{
            return
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch
        {
            print("error")
        }
    }
    @IBAction func cTapped(_ sender: Any) {
        let url = Bundle.main.url(forResource: "c", withExtension: "mp3")
        guard url != nil else{
            return
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch
        {
            print("error")
        }
    }
    @IBAction func dTapped(_ sender: Any) {
        let url = Bundle.main.url(forResource: "d", withExtension: "mp3")
        guard url != nil else{
            return
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch
        {
            print("error")
        }
    }
}

