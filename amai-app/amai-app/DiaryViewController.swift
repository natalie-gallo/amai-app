//
//  DiaryViewController.swift
//  amai-app
//
//  Created by Natalie Gallo on 11/15/23.
//

import UIKit

class DiaryViewController: UIViewController {
    
    //Table View Outlet
    @IBOutlet weak var tableView: UITableView!
    
    var diary = [DiaryEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up nav bar
        title = "Diary"
        //configureItems()
        
        // Hide top cell separator
        tableView.tableHeaderView = UIView()

        // Set table view data source
        // Needed for standard table view setup:
        //    - tableView(numberOfRowsInSection:)
        //    - tableView(cellForRowAt:)
        // Also for swipe to delete row:
        //    - tableView(_:commit:forRowAt:)
        tableView.dataSource = self

        // Set table view delegate
        // Needed to detect row selection: tableView(_:didSelectRowAt:)
        tableView.delegate = self
        
    }
    
    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshDiary()
    }
    
    @IBAction func didTapNewEntryButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    // Prepare for navigation to the Task Compose View Controller.
    // 1. Check the segue identifier to confirm the segue that is being performed is indeed the "ComposeSegue".
    //    - The segue ID, "ComposeSegue", was set in the storyboard.
    // 2. Get the task Compose View Controller so we can configure it ahead of navigation.
    //    i. Since the segue is actually hooked up to the navigation controller that manages the TaskComposeViewController, we need to access the navigation controller first...
    //    ii. ...then get the actual ComposeViewController via the navigation controller's `topViewController` property.
    // 3. If a task was sent along as the segue's sender (for the edit task case), set that task as the `taskToEdit`.
    // 4. Add the code to be run when a task is composed (i.e. created or edited, which happens when the user taps the "Done" button on the task compose view controller and the onComposeTask closure is called)
    //    i. Save the new or edited task.
    //    ii. Refresh the tasks list.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1.
        if segue.identifier == "ComposeSegue" {
            // 2.
            // i.
            if let composeNavController = segue.destination as? UINavigationController,
                // ii.
               let composeViewController = composeNavController.topViewController as? DiaryComposeViewController {

                // 3.
                composeViewController.entryToEdit = sender as? DiaryEntry

                // 4.
                // i.
                // ii.
                composeViewController.onComposeEntry = { [weak self] entry in
                    entry.save()
                    self?.refreshDiary()
                }
            }
        }
    }

    // MARK: - Helper Functions
    
    // Refresh all tasks
    // 1. Get the current saved tasks
    // 2. Sort the tasks list for the following conditions:
    //    i. For completed tasks, sort ascending based on the completed date.
    //    ii. For incomplete tasks, sort ascending based on the date they were created.
    //    iii. Sort incomplete tasks before completed tasks.
    // 3. Update the main tasks array with the refreshed and sorted tasks.
    // 4. Hide the "empty state label" if there are tasks present.
    // 5. Reload the table view data to reflect any updates to the tasks array.
    //    - reloadSections(IndexSet(integer: 0), with: .automatic) is similar to `reloadData()` with the added ability to update the table view changes with animation.
    private func refreshDiary() {
        var diary = DiaryEntry.getDiary()
        self.diary = diary
        // 5.
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}


// MARK: - Table View Data Source Methods

// An extension to group all table view data source related methods
extension DiaryViewController: UITableViewDataSource {
    //Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let entry = diary[indexPath.row]
        cell.configure(with: entry)
        return cell
    }
    
    // Enable "Swipe to Delete" functionality. The existence of this data source method enables the default "Swipe to Delete".
    // 1. Handle the "delete" case:
    // 2. Remove the associated task from the tasks array.
    // 3. Save the updated tasks array.
    // 4. Tell the table view to delete the associated row.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            diary.remove(at: indexPath.row)
            // 3.
            DiaryEntry.save(diary)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// An extension to group all table view delegate related methods
extension DiaryViewController: UITableViewDelegate {

    // The table view delegate method called when a row is selected.
    // In this case, the user has tapped an existing task row and we want to segue them to the Compose View Controller to edit the associated task.
    // 1. Deselect the row so the row doesn't stay in the slected state. (This is just a design preference in this case).
    // 2. Get the task associated with the selected row.
    // 3. Perform the segue to the Compose View Controller (i.e. "ComposeSegue") passing in the selected task for the sender.
    //    - The sender can be any type and you can use it however you want. In this case we pass in the selected task so we can have easy access to it when preparing for navigation to the Compose View Controller when preparing for the segue in prepare(for:sender)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedTask = diary[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedTask)
    }
}
