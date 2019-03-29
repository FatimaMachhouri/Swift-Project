//
//  BalanceViewController.swift
//  ProjetSwift
//
//  Created by etud ig on 29/03/2019.
//  Copyright © 2019 F&Y. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tableViewController: PersonTableViewController!
    var travel: Travel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableViewController = PersonTableViewController(tableView: self.tableView)
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