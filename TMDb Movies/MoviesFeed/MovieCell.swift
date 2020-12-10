//
//  MovieCell.swift
//  TMDb Movies
//
//  Created by eyup cimen on 28.11.2020.
//

import Foundation
import UIKit
import Kingfisher

let movieCellId = "movieCell"

class MovieCell : UITableViewCell {
    
    var index : Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    fileprivate var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    fileprivate var movieNameLbl : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16 , weight: .heavy )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let overviewLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14 , weight: .thin )
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var imPoster : UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 4.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate var dateLbl : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 11 , weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    fileprivate var releaseDateLbl : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 11 , weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var voteAverageLbl : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 11 , weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var item : Movie! {
        didSet {
            bindItem(item)
        }
    }
    
    fileprivate func bindItem(_ item : Movie)  {
    
        if let posterPath = item.posterPath {
            let url = URL(string: posterPath)
            imPoster.kf.indicatorType = .activity
            imPoster.kf.setImage(
                with: url,
                placeholder: UIImage(named: "defaultImage"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            imPoster.clipsToBounds = true
        }
      
        movieNameLbl.text = item.originalTitle
        overviewLbl.text = item.overview
        voteAverageLbl.text = "\(item.voteAverage!)"
        releaseDateLbl.text = item.releaseDate!
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor(white: 0 , alpha: 0.03)
        contentView.addSubview(imPoster)
        contentView.addSubview(movieNameLbl)
        contentView.addSubview(overviewLbl)
        contentView.addSubview(infoStackView)
        
        imPoster.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imPoster.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 8).isActive = true
        imPoster.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imPoster.widthAnchor.constraint(equalToConstant: 80).isActive = true

        
        movieNameLbl.topAnchor.constraint(equalTo: imPoster.topAnchor).isActive = true
        movieNameLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieNameLbl.leadingAnchor.constraint(equalTo: imPoster.trailingAnchor , constant: 8).isActive = true
        movieNameLbl.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor ).isActive = true
        

        overviewLbl.topAnchor.constraint(equalTo: movieNameLbl.bottomAnchor , constant: 4).isActive = true
        overviewLbl.heightAnchor.constraint(equalToConstant: 72).isActive = true
        overviewLbl.leadingAnchor.constraint(equalTo: imPoster.trailingAnchor , constant: 8).isActive = true
        overviewLbl.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor ).isActive = true

        infoStackView.topAnchor.constraint(equalTo: overviewLbl.bottomAnchor , constant: 4).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: imPoster.trailingAnchor , constant: 8).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor ).isActive = true

        infoStackView.addArrangedSubview(voteAverageLbl)
        infoStackView.addArrangedSubview(releaseDateLbl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        movieNameLbl.text = nil
        overviewLbl.text = nil
        print(index)
    }
}


 

