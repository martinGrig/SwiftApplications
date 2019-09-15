//
//  PlayerDetailsTableViewController.swift
//  Ratings
//
//  Created by Student on 14/09/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {

    var player: Player?
    var game: String = "Chess" {
        didSet {
            detailLabel.text = game
        }
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail",
            let playerName = nameTextField.text {
            player = Player(name: playerName, game: game, rating: 1)
        }
        if segue.identifier == "PickGame",
            let gamePickerViewController = segue.destination as? GamePickerViewController {
            gamePickerViewController.selectedGame = game
        }

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    }


extension PlayerDetailsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
}
}
extension PlayerDetailsTableViewController {
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
}
