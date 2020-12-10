//
//  ViewController.swift
//  TMDb Movies
//
//  Created by eyup cimen on 28.11.2020.
//

import Foundation
import UIKit


class MoviesViewController: BaseViewController  {

    var viewModel : MoviesViewModel!
    var mSearchBar : UISearchBar!
    var moviesList : UITableView!
    var isSearching = false

    let emptyLbl : UILabel = {
        let label = UILabel()
        label.text = "Result not found!"
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getMovies()
    }
    
    fileprivate func getMovies () {
        viewModel.getMovies {
            self.moviesList.reloadData()
        }
    }
    
    fileprivate func movieDetail(_ movieId : Int) {
        let movieDetail = GeneralBuilder.makeMovieDetail(movieId)
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
}
 

extension MoviesViewController {
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "Movies"
        mSearchBar = UISearchBar()
        mSearchBar.delegate = self
        mSearchBar.placeholder = "Search"
        mSearchBar.translatesAutoresizingMaskIntoConstraints = false
        mSearchBar.backgroundColor = .white
        mSearchBar.tintColor = .darkGray
        view.addSubview(mSearchBar)
        
        mSearchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor ).isActive = true
        mSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ).isActive = true
        mSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor ).isActive = true
         
        moviesList = UITableView()
        moviesList.translatesAutoresizingMaskIntoConstraints = false
        moviesList.backgroundColor = .white
        moviesList.dataSource = self
        moviesList.delegate = self
        moviesList.register(MovieCell.self , forCellReuseIdentifier: movieCellId)
        view.addSubview(moviesList)
        
        moviesList.topAnchor.constraint(equalTo: mSearchBar.bottomAnchor, constant: 0 ).isActive = true
        moviesList.leadingAnchor.constraint(equalTo: view.leadingAnchor ).isActive = true
        moviesList.trailingAnchor.constraint(equalTo: view.trailingAnchor ).isActive = true
        moviesList.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
        
         
        emptyLbl.isHidden = true
        view.addSubview(emptyLbl)
        
        emptyLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor ).isActive = true
        emptyLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor ).isActive = true
    }
}


extension MoviesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellId , for: indexPath) as! MovieCell
        let movie = viewModel.movies[indexPath.row]
        cell.item = movie
        cell.index = indexPath.row
        return cell
    }
    
}

extension MoviesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        movieDetail(movie.Id!)
    }
    
}
 

extension MoviesViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

        moviesList.dataSource = nil
        isSearching = searchBar.text!.count > 2
        moviesList.dataSource = self
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        mSearchBar.text = ""
        mSearchBar.searchTextField.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        mSearchBar.resignFirstResponder()
    }
     

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            getMovies()
            view.endEditing(true)
        } else {
            searchKeyword(searchText)
        }
    }

    func searchKeyword(_ searchText : String) {
        
        let keyword = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        isSearching = keyword.count > 2
        if isSearching {
            viewModel.getSearchWithKeyword(keyword) {
                if self.viewModel.movies.count == 0 {
                    self.moviesList.isHidden = true
                    self.emptyLbl.isHidden = false
                } else {
                    self.moviesList.isHidden = false
                    self.emptyLbl.isHidden = true
                    self.moviesList.reloadData()
                }
            }
        } else {
            viewModel.clearResults()
            moviesList.isHidden = true
            emptyLbl.isHidden = false
            if keyword.isEmpty {
                mSearchBar.resignFirstResponder()
            }
        }
    }
}
