//
//  ActorDetailViewController.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import UIKit

class ActorDetailViewController: UIViewController {
 
    var viewModel : ActorDetailViewModel!
    let scrollView : UIScrollView = {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView : UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .white
        return content
    }()
    
    let posterView : UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let actorNameLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16 , weight: .heavy )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let biographyTitle : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Biography"
        label.font = UIFont.systemFont(ofSize: 14 , weight: .semibold )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let biographyLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14 , weight: .thin )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let birthdayLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14 , weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let genderLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14 , weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.getActorDetail { (cast) in
            self.setCast(cast)
        }
    }
    
    fileprivate func setCast ( _ cast : Cast ) {
        
        title = cast.name
        if let profilePath = cast.profilePath {
            let url = URL(string: profilePath)
            posterView.kf.indicatorType = .activity
            posterView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "defaultImage"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            posterView.clipsToBounds = true
        }
        actorNameLbl.text = cast.name
        birthdayLbl.text = cast.birthday
        biographyLbl.text = cast.biography
        genderLbl.text = cast.gender == 0 ? "Man" : "Woman"
    }
}


extension ActorDetailViewController {
       
    fileprivate func setupViews() {
        view.backgroundColor = .green
        
        contentView.addSubview(actorNameLbl)
        contentView.addSubview(posterView)
        contentView.addSubview(birthdayLbl)
        contentView.addSubview(biographyLbl)
        contentView.addSubview(biographyTitle)
        contentView.addSubview(genderLbl)
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: -16.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 16.0 ).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
    
        contentView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: -8.0).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
         
        NSLayoutConstraint(item: posterView, attribute: .leadingMargin , relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: posterView, attribute: .topMargin , relatedBy: .equal, toItem: contentView, attribute: .topMargin , multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: posterView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.bounds.width / 16 * 9).isActive = true
        NSLayoutConstraint(item: posterView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute , multiplier: 1, constant: view.bounds.width / 2.5 ).isActive = true
        
        
        NSLayoutConstraint(item: biographyTitle, attribute: .top, relatedBy: .equal, toItem: posterView, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: biographyTitle, attribute: .leadingMargin, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: biographyTitle, attribute: .trailingMargin, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: biographyTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        
        NSLayoutConstraint(item: biographyLbl, attribute: .top, relatedBy: .equal, toItem: biographyTitle, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: biographyLbl, attribute: .leadingMargin, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: biographyLbl, attribute: .trailingMargin, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: biographyLbl, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        
       
        actorNameLbl.topAnchor.constraint(equalTo: posterView.topAnchor, constant: 0.0).isActive = true
        actorNameLbl.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 8.0).isActive = true
        actorNameLbl.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        actorNameLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        genderLbl.topAnchor.constraint(equalTo: actorNameLbl.bottomAnchor, constant: 8.0).isActive = true
        genderLbl.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 8.0).isActive = true
        genderLbl.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        genderLbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        birthdayLbl.topAnchor.constraint(equalTo: genderLbl.bottomAnchor, constant: 8.0).isActive = true
        birthdayLbl.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 8.0).isActive = true
        birthdayLbl.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        birthdayLbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
