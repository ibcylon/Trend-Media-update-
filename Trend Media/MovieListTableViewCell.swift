//
//  MovieListTableViewCell.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/25.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier:String = "MovieList"
    
    @IBOutlet weak var subtitle: UITextView!
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var poster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
