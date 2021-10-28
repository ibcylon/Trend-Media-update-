//
//  MovieInfoTableViewCell.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/23.
//

import UIKit

class MovieInfoTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var shadowView: UIView!{
        didSet {
            shadowView.layer.shadowOpacity = 0.7
            shadowView.layer.shadowOffset = .init(width: -10, height: -10)
            shadowView.layer.shadowRadius = 10
            shadowView.layer.masksToBounds = false
//            shadowView.layer.borderWidth = 1
            shadowView.layer.shadowColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
            cellView.layer.masksToBounds = true

        }
    }
    @IBOutlet weak var tagLabel: UILabel! {
        didSet {
            tagLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var titleKORLabel: UILabel!{
        didSet{
            titleKORLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        
    }
    @IBOutlet weak var releaseDateLabel: UILabel! {
        didSet{
            releaseDateLabel.textColor = .lightGray
            releaseDateLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    static let identifier:String = "MovieInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCellByRow(_ row : TvShow){
        tagLabel.text = "#\(row.genre)"
        titleKORLabel.text = row.title
        titleLabel.text = row.title
        releaseDateLabel.text = row.releaseDate
        rateLabel.text = "\(row.rate)"
        let url = URL(string: row.backdropImage)
        posterImage.kf.setImage(with : url)
    }
}
