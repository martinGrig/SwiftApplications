//
//  AgendaTableViewCell.swift
//  Averi
//
//  Created by Student on 10/10/2019.
//  Copyright © 2019 Dimitar Ivanov. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DistanceLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var event: Event? {
      didSet {
        guard let event = event else { return }
        
        NameLabel.text = event.name
        DateLabel.text = event.date
        DistanceLabel.text = event.location
        ImageView.image = image()
      }
    }
    
    func image() -> UIImage? {
      let imageName = "Party"
      return UIImage(named: imageName)
    }

}
