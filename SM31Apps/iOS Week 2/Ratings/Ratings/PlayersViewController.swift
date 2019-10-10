import UIKit

class PlayersViewController: UITableViewController {
  var players = SampleData.generatePlayersData()
}

extension PlayersViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailsViewController = segue.source as? PlayerDetailsTableViewController,
            let player = playerDetailsViewController.player else {
                return
        }
        
        players.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                             for: indexPath) as! PlayerCell
    
    let player = players[indexPath.row]
    cell.player = player
    return cell
  }
}
