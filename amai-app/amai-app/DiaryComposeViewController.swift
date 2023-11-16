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
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var goodMoodButton: UIButton!
    @IBOutlet weak var mehMoodButton: UIButton!
    @IBOutlet weak var badMoodButton: UIButton!
    @IBOutlet weak var goodMoodLabel: UILabel!
    @IBOutlet weak var mehMoodLabel: UILabel!
    @IBOutlet weak var badMoodLabel: UILabel!
    @IBOutlet weak var diaryEntryTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding border to textView
        self.diaryEntryTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.diaryEntryTextView.layer.borderWidth = 1
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
