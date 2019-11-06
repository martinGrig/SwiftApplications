//
//  DetailsViewController.swift
//  Averi
//
//  Created by Student on 24.10.2019 г..
//  Copyright © 2019 Dimitar Ivanov. All rights reserved.
//

import UIKit
import MapKit
import EventKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DistanceLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var BioLabel: UILabel!
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var JoinButton: UIButton!
    @IBOutlet weak var EntryLimitLabel: UILabel!
    @IBOutlet weak var EntryFeeLimit: UILabel!
    
    var event : Event?
    
    
    var agendaViewController:AgendaTableViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? AgendaDetailsViewController
            else {
                return
        }
        detailsViewController.event = event
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageView?.image = event?.photo
        NameLabel?.text = "Name: \(event?.name ?? "")"
        DistanceLabel?.text = "Destination: \(event?.location ?? "")"
        DateLabel?.text = "Date: \(event?.date ?? "")"
        BioLabel?.text = "Bio: \(event?.bio ?? "")"
        TimeLabel?.text = "Time: \(event?.time ?? "")"
        EntryLimitLabel?.text = "Entry Limit: \(event?.entryLimit ?? 0)"
        EntryFeeLimit?.text = "Entry Fee: \(event?.entryCost ?? 0)$"
        
        
    }
    
    func insertEvent(store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: .event)
            
        for calendar in calendars {
            // 2
            if calendar.title == "ioscreator" {
                // 3
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy HH:mm"
                let startDateTime = formatter.date(from: "\(event?.date ?? "") \(event?.time ?? "")")
                
                let startDate = startDateTime
                // 2 hours
                let endDate = startDateTime!.addingTimeInterval(2 * 60 * 60)
                    
                // 4
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                    
                event.title = self.event?.name
                event.startDate = startDate
                event.endDate = endDate
                    
                // 5
                do {
                    try store.save(event, span: .thisEvent)
                }
                catch {
                   print("Error saving event in calendar")             }
                }
        }
    }
    

    @IBAction func JoinClicked(_ sender: Any) {
        
        let eventStore = EKEventStore()
            
        // 2
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore)
            case .denied:
                print("Access denied")
            case .notDetermined:
            // 3
                eventStore.requestAccess(to: .event, completion:
                  {[weak self] (granted: Bool, error: Error?) -> Void in
                      if granted {
                        self!.insertEvent(store: eventStore)
                      } else {
                            print("Access denied")
                      }
                })
                default:
                    print("Case default")
        }
        
        agendaViewController?.onUserAction(event: event!)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    /// Returns a date from a string in MMMM dd, yyyy. Will return today's date if input is invalid.
    var asDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: self) ?? Date()
    }
}
