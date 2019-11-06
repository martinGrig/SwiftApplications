//
//  AgendaTableViewController.swift
//  Averi
//
//  Created by Student on 10/10/2019.
//  Copyright © 2019 Dimitar Ivanov. All rights reserved.
//

import UIKit

class AgendaTableViewController: UITableViewController {
    
    
    var events: [Event] = [
    Event(name: "Party in the garden", location: "Garden", date: "14.01.2020", time: "11:00", entryLimit: 5, entryCost: 5.5, bio: "Super duper cool party in the garden", photo: #imageLiteral(resourceName: "Party")),
    Event(name: "Party in the pool", location: "Pool", date: "15.02.2020", time: "12:00", entryLimit: 6, entryCost: 5.6, bio: "Super duper cool party in the pool", photo: #imageLiteral(resourceName: "Party")),
    Event(name: "Party in Eindhoven", location: "Eindhoven", date: "16.03.2020", time: "13:00", entryLimit: 7, entryCost: 6.5, bio: "Super duper cool party in Eindhoven", photo: #imageLiteral(resourceName: "Party"))
    ]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? AgendaDetailsViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
                return
        }
        detailsViewController.event = events[index]
    }
    
    func onUserAction(event: Event){
        
        events.append(event)
        let vc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        vc.agendaViewController = self
        let indexPath = IndexPath(row: events.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}
    

extension AgendaTableViewController {
    
@IBAction func cancelToEventViewController(_ segue: UIStoryboardSegue) {
}

@IBAction func saveAgendaDetail(_ segue: UIStoryboardSegue) {
    
    guard let createViewController = segue.source as? CreateTableViewController,
        let event = createViewController.event else {
            return
    }
    
    events.append(event)
    
    // update the tableView
    let indexPath = IndexPath(row: events.count - 1, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
}
    
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let event = events[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaCell",
                                             for: indexPath) as! AgendaTableViewCell
    cell.ImageView?.image = event.photo
    cell.NameLabel?.text = event.name
    cell.DateLabel?.text = event.date
    cell.DistanceLabel?.text = event.location
    
    return cell
  }
    
    
}
