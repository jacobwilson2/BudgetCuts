//
//  transactionsViewController.swift
//  Wilsonj-budgetcuts2
//
//  Created by Jacob Wilson on 3/13/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class transactionsViewController: UIViewController { 
    @IBOutlet weak var budgetHeader: UILabel!
    @IBOutlet weak var curBudget: UILabel!
    @IBOutlet weak var subtractAmount: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    
    var budget: Budget?
    
    @IBAction func submitAmount(_ sender: UIButton) {
        if let b = budget {
            let amount = (subtractAmount.text! as NSString).doubleValue
            let newLimit = b.limit - amount
            curBudget.text = String(newLimit)
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let b = budget {
            budgetHeader.text = b.name
            curBudget.text = String(b.limit)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
