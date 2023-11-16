//
//  ViewController.swift
//  amai-app
//
//  Created by Natalie Gallo on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var diaryButton: UIButton!
    @IBOutlet weak var recipesButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        //navigationController?.navigationBar.prefersLargeTitles = true
    }


}

