//
//  CastCell.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation
import UIKit


let castCellId = "castCellId"

class CastCell : UICollectionViewCell {
    
    var index : Int = -1
    var openDetail : (Int) -> () = {_ in }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var cast : Cast! {
        didSet{
            bindCast(cast)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let actorNameLbl : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(white: 0 , alpha: 0.03)
        label.font = UIFont.systemFont(ofSize: 13 , weight: .light )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actorNameBtn : UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textColor = .black
        btn.backgroundColor = UIColor(white: 0 , alpha: 0.03)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13 , weight: .light )
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    func setupViews() {
        backgroundColor = UIColor(white: 0 , alpha: 0.03)
        addSubview(actorNameLbl)
        actorNameLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        actorNameLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: actorNameLbl, attribute: .height, relatedBy: .equal, toItem: self , attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: actorNameLbl, attribute: .width, relatedBy: .equal, toItem: self , attribute: .width, multiplier: 1, constant: 0).isActive = true
    }
    
    func bindCast (_ cast : Cast) {
        actorNameLbl.text = cast.name
    }
    
    @objc
    func actorDetail() {
        openDetail(index)
    }
}


 


