//
//  BudgetTableViewController.swift
//  Wilsonj-budgetcuts2
//
//  Created by Jacob Wilson on 3/12/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class BudgetTableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
   
    var budgets: [Budget] = []
    
    @IBAction func addPressed(_ sender: UIButton) {
        let title = "New Budget"
        let message = "Enter name and limit of budget"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (budgetTitle) in
            budgetTitle.placeholder = "Enter budget name"
        }
        alert.addTextField { (budgetLimit) in
            budgetLimit.placeholder = "Enter budget limit"
        }
        let action = UIAlertAction(title: "add", style: .default) {(_) in
            guard let budgetTitle1 = alert.textFields?[0].text else {return}
            guard let budgetLimit1 = alert.textFields?[1].text else {return}
            let floatBudgetLimit1 = (budgetLimit1 as NSString).doubleValue
            self.budgets.append(Budget(name: budgetTitle1, limit: floatBudgetLimit1))
            self.tableview.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var count = -1
        for budget in budgets {
            count = count + 1
            if (budget.limit == 0) {
                budgets.remove(at: count)
            }
        }
        self.tableview.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return budgets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let budget = budgets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetPrototype", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = budget.name
        cell.detailTextLabel?.text = ("$ " + String(budget.limit))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        budgets.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    //Override to support editing the table view.
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let indexPath = self.tableview.indexPathForSelectedRow {
                detailViewController.budget = budgets[indexPath.row]
            }
        }
        
        if let AnalysisTableViewController = segue.destination as? analysisTableViewController {
            AnalysisTableViewController.budgets = budgets
        }
    }
    

}
