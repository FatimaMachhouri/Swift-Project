//
//  ExpenseViewController.swift
//  ProjetSwift
//
//  Created by Fatima Machhouri on 30/03/2019.
//  Copyright © 2019 F&Y. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewController: ExpenseTableViewController!
    var travel: Travel? = nil
    var balanceViewController: BalanceViewController? = nil
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        guard let t = travel else {
            fatalError("Unusual error")
        }
        self.tableViewController = ExpenseTableViewController(tableView: tableView, travel: t)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // TODO: Come up with a better way to do this
        // this updates table view of balance
        self.balanceViewController?.tableViewController.dataSetChanged()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destController = segue.destination as? ExpenseDetailViewController {
            if let cell = sender as? UITableViewCell {
                guard let indexPath = self.tableView.indexPath(for: cell) else {
                    return
                }
                destController.expense = self.tableViewController.expenses.get(expenseAt: indexPath.row)
            }
        }
        if let destController = segue.destination as? AddExpenseViewController {
            destController.travel = self.travel
        }
    }
    
    @IBAction func unwindToExpenseViewAfterCreatingExpense(_ unwindSegue: UIStoryboardSegue) {
        if let addExpenseController = unwindSegue.source as? AddExpenseViewController {
            if let expense = addExpenseController.newExpense {
                self.tableViewController.expenses.add(expense: expense)
            }
        }
    }
    
}

