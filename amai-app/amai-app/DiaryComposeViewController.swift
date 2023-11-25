//
//  DiaryComposeViewController.swift
//  amai-app
//
//  Created by Natalie Gallo on 11/16/23.
//

import UIKit

class DiaryComposeViewController: UIViewController {

    
    @IBOutlet weak var diaryTitleTextField: UITextField!
    @IBOutlet weak var bloodGlucoseTextField: UITextField!
    @IBOutlet weak var heartRateTextField: UITextField!
    @IBOutlet weak var bloodPressureTextField: UITextField!
    @IBOutlet weak var diaryEntryTextView: UITextView!
    @IBOutlet weak var notesLabel: UILabel!
    
    
    /*
    @IBAction func didTapGoodMoodButton(_ sender: UIButton) {
        goodMoodButton.isSelected = true
    }
    
    @IBAction func didTapMehMoodButton(_ sender: UIButton) {
        mehMoodButton.isSelected = true
    }
    
    @IBAction func didTapBadMoodButton(_ sender: UIButton) {
        badMoodButton.isSelected = true
    }*/
    
    var entryToEdit: DiaryEntry?
    
    // When a new entry is created (or an existing task is edited), this closure is called
    // passing in the entry as an argument so it can be used by whoever presented the DiaryComposeViewController.
    var onComposeEntry: ((DiaryEntry) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding border to textView
        self.diaryEntryTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.diaryEntryTextView.layer.borderWidth = 1
        
        //if entry was passed in to edit, set all fields with the task to edit properties
        if let entry = entryToEdit {
            diaryTitleTextField.text = entry.title
            bloodGlucoseTextField.text = entry.bloodGlucoseLevel
            heartRateTextField.text = entry.heartRate
            bloodPressureTextField.text = entry.bloodPressure
            diaryEntryTextView.text = entry.note
            
            /*
            if (entry.mood == "good") {
                goodMoodButton.isSelected = true
            } else if (entry.mood == "meh") {
                mehMoodButton.isSelected = true
            } else if (entry.mood == "bad") {
                badMoodButton.isSelected = true
            }*/
            
            self.title = "Edit Task"
        }
    }
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        //Make sure we have non-nil text and the text isn't empty.
        guard let title = diaryTitleTextField.text, 
                !title.isEmpty
        else {
            //If it's nil or empty, present an alert prompting the user to enter a title.
            presentAlert(title: "Title Missing", message: "Make sure to add a title")
            //Exit the funtion (i.e. return).
            return
        }
        
        //Create a variable to hold the created or edited entry
        var entry: DiaryEntry
        
        //If a "entry to edit" is present, we're editing an existing entry...
        if let editEntry = entryToEdit {
            //Set the entry variable as the "entry to edit".
            entry = editEntry
            //Update the entry's properties
            entry.title = title
            entry.bloodGlucoseLevel = bloodGlucoseTextField.text
            entry.heartRate = heartRateTextField.text
            entry.bloodPressure = bloodPressureTextField.text
            entry.note = diaryEntryTextView.text
            
            /*
            if (goodMoodButton.isSelected) {
                entry.mood = "good"
            } else if (mehMoodButton.isSelected) {
                entry.mood = "meh"
            } else if (badMoodButton.isSelected) {
                entry.mood = "bad"
            }*/
            
        } else {
            //If NO "entry to edit" is present, we're creating a new entry. Set the entry variable with a newly created entry.
            entry = DiaryEntry(title: title, bloodGlucoseLevel: bloodGlucoseTextField.text, heartRate: heartRateTextField.text,
                               bloodPressure: bloodPressureTextField.text, note: diaryEntryTextView.text)
        }
        //Call the "onComposeEntry" closure passing in the new or edited task.
        onComposeEntry?(entry)
        
        //Dismiss the DiaryComposeViewController.
        dismiss(animated: true)
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // A helper method to present an alert given a title and message.
    // 1. Create an Alert Controller instance with, title, message and alert style.
    // 2. Create an Alert Action (i.e. an alert button)
    //    - You could add an action (i.e. closure) to be called when the user taps the associated button.
    // 3. Add the action to the alert controller
    // 4. Present the alert
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
}
