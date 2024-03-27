//
//  ListCell.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Kingfisher

class ListCell: UITableViewCell {
    
    @IBOutlet private weak var portraitImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Functions
    func display(obj disk: DiskEntity) {
        let url = URL(string: disk.image)
        portraitImage.kf.setImage(with: url)
        titleLabel.text = disk.title
        authorLabel.text = disk.author
    }
}
