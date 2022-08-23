//
//  SongTableViewCell.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 23/08/22.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    // MARK: UI Elements

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songPerformerLabel: UILabel!

    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: Methods

    func setup(withSong song: Song) {
        songTitleLabel.text = song.title
        songPerformerLabel.text = song.performer
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
