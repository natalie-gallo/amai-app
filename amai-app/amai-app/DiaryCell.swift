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
    
    // The closure called, passing in the associated entry, when the "Complete" button is tapped.
    //var onCompleteButtonTapped: ((DiaryEntry) -> Void)?
    
    //entry associated with cell
    var entry: DiaryEntry!
    
    // Initial configuration of the task cell
    // 1. Set the main task property
    // 2. Set the onCompleteButtonTapped closure
    // 3. Update the UI for the given task
    func configure(with entry: DiaryEntry) {
        // 1.
        self.entry = entry
        // 3.
        update(with: entry)
    }
    
    // Update the UI for the given task
    private func update(with entry: DiaryEntry) {
        titleLabel.text = entry.title
        //let unformattedDate = entry.createdDate.description // YYYY-MM-DD HH:MM:SS ±HHMM
        /*
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        let date = dateFormatter.string(from: entry.createdDate)
        dateLabel.text = date*/
        
        dateLabel.text = entry.createdDate.formatted()
    }
    
    // This overrides the table view cell's default selected and highlighted behavior to do nothing, otherwise, the row would darken when tapped
    // This is just a design / UI polish for this particular use case. Since we also have the "Completed" button in the row, it looks kinda weird if the whole cell darkens during selection.
    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

}
