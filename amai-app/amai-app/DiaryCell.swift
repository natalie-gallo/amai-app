//
//  DiaryCell.swift
//  amai-app
//
//  Created by Natalie Gallo on 11/15/23.
//

import UIKit

class DiaryCell: UITableViewCell {

    
    @IBOutlet weak var moodIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
