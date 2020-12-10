//
//  MovieDetailViewController.swift
//  TMDb Movies
//
//  Created by eyup cimen on 28.11.2020.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var viewModel : MovieDetailViewModel!
    fileprivate let scrollView : UIScrollView = {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 200)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    fileprivate let posterView : UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let movieNameLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
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
    
    fileprivate let castCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let castCollView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        castCollView.translatesAutoresizingMaskIntoConstraints = false
        castCollView.backgroundColor = .white
        castCollView.register(CastCell.self , forCellWithReuseIdentifier: castCellId)
        return castCollView
    }()
    
    fileprivate var contentView : UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .white
        return content
    }()
    
    
    fileprivate var genreLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15 , weight: .regular )
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getMovieDetail()
    }
    
    fileprivate func getMovieDetail () {
        viewModel.getMovieDetail { (movie) in
            self.setMovie(movie)
        }
        viewModel.getCastList {
            self.castCollectionView.reloadData()
        }
    }
   
    fileprivate func actorDetail ( _ index : Int) {
        let cast = viewModel.castList[index]
        let actorDetailScreen = GeneralBuilder.makeActorDetail(cast.id!)
        self.navigationController?.pushViewController(actorDetailScreen, animated: true)
    }

    fileprivate func setMovie (_ item : Movie) {
        
        title = item.originalTitle
        if let posterPath = item.backdropPath {
            let url = URL(string: posterPath)
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
        movieNameLbl.text = item.originalTitle
        overviewLbl.text = item.overview
        genreLbl.text = "\(item.runtime!) minute" + "\t" + "\(item.genres!.first!.name!)" + "\t" +  item.releaseDate!
        castCollectionView.reloadData()
    }
}

extension MovieDetailViewController {
    
    fileprivate func setupViews() {
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        castCollectionView.isScrollEnabled = true
        
        contentView.addSubview(posterView)
        contentView.addSubview(movieNameLbl)
        contentView.addSubview(overviewLbl)
        contentView.addSubview(castCollectionView)
        contentView.addSubview(genreLbl)
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: -16.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 16.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
    
        contentView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: -8.0).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        posterView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: -8.0).isActive = true
        posterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        posterView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        posterView.heightAnchor.constraint(equalToConstant: view.bounds.width / 16 * 9 ).isActive = true
        
       
        movieNameLbl.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 8.0).isActive = true
        movieNameLbl.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: -8.0).isActive = true
        movieNameLbl.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
        //movieNameLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
         
        
        genreLbl.topAnchor.constraint(equalTo: movieNameLbl.bottomAnchor, constant: 8.0).isActive = true
        genreLbl.leadingAnchor.constraint(equalTo: movieNameLbl.layoutMarginsGuide.leadingAnchor, constant: -8.0).isActive = true
        genreLbl.trailingAnchor.constraint(equalTo: movieNameLbl.layoutMarginsGuide.trailingAnchor, constant: 8.0).isActive = true
      
         
        NSLayoutConstraint(item: overviewLbl, attribute: .leadingMargin, relatedBy: .equal, toItem: genreLbl, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: overviewLbl, attribute: .trailingMargin, relatedBy: .equal, toItem: genreLbl, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: overviewLbl, attribute: .top, relatedBy: .equal, toItem: genreLbl, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        
        NSLayoutConstraint(item: castCollectionView, attribute: .leadingMargin, relatedBy: .equal, toItem: overviewLbl, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: castCollectionView, attribute: .trailingMargin, relatedBy: .equal, toItem: overviewLbl, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: castCollectionView, attribute: .top, relatedBy: .equal, toItem: overviewLbl, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: castCollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: castCollectionView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
    }

}

extension MovieDetailViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.castList.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCellId, for: indexPath) as! CastCell
        cell.cast = viewModel.castList[indexPath.row]
        return cell
    }
}
 

extension MovieDetailViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = viewModel.castList[indexPath.row].name!
        var itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13 , weight: .light )
        ])
        itemSize.height = 50
        itemSize.width = itemSize.width + 20
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
 
extension MovieDetailViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actorDetail(indexPath.row)
    }
}
