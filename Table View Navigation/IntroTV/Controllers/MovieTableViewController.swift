//
//  TableVC.swift
//  Table View Navigation
//
//  Created by Martín on 29/10/2020.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var avatarButtonOut: UIBarButtonItem!
    
    let sectionsName: [String] = ["Popular", "New", "Most Voted", "Random", "International"]
    
    
    override func viewDidLoad() {
        
        let nib = UINib(nibName: "CellVC", bundle: nil)
        // nib es igual que xib, pero con una nomenclatura antigua.
        self.tableView.register(nib, forCellReuseIdentifier: "standardCell")
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showProfileSelectionIfNeeded()
        avatarButtonOut.title = MoviesViewModel.selectedProfile
        
    }
    
    
    private var profileSelectionScreenNeeded: Bool = true
    private func showProfileSelectionIfNeeded() {
        if profileSelectionScreenNeeded {
            goToProfileSelection()
            profileSelectionScreenNeeded = false
        }
    }
    
    @IBAction func avatarButtonAct(_ sender: Any) {
        performSegue(withIdentifier: "goToProfileSelection", sender: self)
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 200.0
        } else {
            return 150.0
        }
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    private func goToProfileSelection() {            performSegue(withIdentifier: "goToProfileSelection", sender: self)
    }
    
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        currentDescription = items[indexPath.row].description
    //        performSegue(withIdentifier: "show_detail", sender: nil)
    //    }
    
    //    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //        if let destinationVC = segue.destination as? DetailVC {
    //            destinationVC.descriptionText = currentDescription
    //        }
    //    }
    //
    
    
    
    //  MARK: - Section Info
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // aqui Cesc uso una enum con sus case y asi fue dandole valores segun la necesidad (nombre, tamañano, etc...)
        
        return sectionsName[section]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
