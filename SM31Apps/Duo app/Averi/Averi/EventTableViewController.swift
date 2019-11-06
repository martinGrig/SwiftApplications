//
//  EventTableViewController.swift
//  Averi
//
//  Created by Student on 10/10/2019.
//  Copyright © 2019 Dimitar Ivanov. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
//var events = SampleData.generateEventData()
    var events: [Event] = [
        Event(name: "Party in the garden", location: "Garden", date: "14.01.2020", time: "11:00", entryLimit: 5, entryCost: 5.5, bio: "Super duper cool party in the garden", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party in the pool", location: "Pool", date: "15.02.2020", time: "12:00", entryLimit: 6, entryCost: 5.6, bio: "Super duper cool party in the pool", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party in Eindhoven", location: "Eindhoven", date: "16.03.2020", time: "13:00", entryLimit: 7, entryCost: 6.5, bio: "Super duper cool party in Eindhoven", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party on Stratum", location: "Stratum", date: "17.04.2020", time: "14:00", entryLimit: 8, entryCost: 7.5, bio: "Super duper cool party on Stratum", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party in Amsterdam", location: "Amsterdam", date: "18.05.2020", time: "15:00", entryLimit: 9, entryCost: 5.9, bio: "Super duper cool party in Amsterdam", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party in Sofia", location: "Sofia", date: "19.06.2020", time: "16:00", entryLimit: 10, entryCost: 10.5, bio: "Super duper cool party in Sofia", photo: #imageLiteral(resourceName: "Party")),
        Event(name: "Party in Plovdiv", location: "Plovdiv", date: "20.07.2020", time: "17:00", entryLimit: 11, entryCost: 11.5, bio: "Super duper cool party in Plovdiv", photo: #imageLiteral(resourceName: "Party"))
    ]

   
  
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return events.count
//  }
//
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let event = events[indexPath.row]
//    let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",
//                                             for: indexPath) as! EventTableViewCell
//    cell.ImageView?.image = event.photo
//    cell.NameLabel?.text = event.name
//    cell.DateLabel?.text = event.date
//    cell.DistanceLabel?.text = event.location
//
//    return cell
//  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
                return
        }
        detailsViewController.event = events[index]
    }
    

    
        

    }



extension EventTableViewController{
    @IBAction func cancelToEventViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveEventDetail(_ segue: UIStoryboardSegue) {
        
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

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let event = events[indexPath.row]
  let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",
                                           for: indexPath) as! EventTableViewCell
  cell.ImageView?.image = event.photo
  cell.NameLabel?.text = event.name
  cell.DateLabel?.text = event.date
  cell.DistanceLabel?.text = event.location
  
  return cell
}
}
