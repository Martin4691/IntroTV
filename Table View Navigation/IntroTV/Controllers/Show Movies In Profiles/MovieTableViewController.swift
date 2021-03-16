//
//  TableVC.swift
//  Table View Navigation
//
//  Created by Martín on 29/10/2020.
//

import AlamofireImage
import UIKit

class MovieTableViewController: UITableViewController {
    
    
    @IBOutlet weak var avatarButtonOut: UIBarButtonItem!
    
    let moviesManager = MoviesManagers()
    var movies: [Movie]? = []
    
    var idMoviesList = [Int: String]()
    
    
    
    override func viewDidLoad() {
        
        let nib = UINib(nibName: "CellVC", bundle: nil)
        // nib es igual que xib, pero con una nomenclatura antigua.
        self.tableView.register(nib, forCellReuseIdentifier: "standardCell")
        
        super.viewDidLoad()
        
        fetchMovies()

  
    }
    
    //MARK: - Fetch functions:
    
    private func fetchMovieList() {
        moviesManager.fetchMovieList(success: { (movieList) in
            for movies in movieList.results {
                self.moviesManager.fetchMovieDetails(movieId: movies.id) { details in print("=> \(details.title): \(String(describing: details.overview)) ")
                    print(">---------------------------------------<")
                }
                print("La peli se llama: \(movies.title)")
            }
            self.tableView.reloadData()
        })
    }
    
    
    //    private func fetchMovieDetails() {
    //        moviesManager.fetchMovieDetails(movieId: "\(Array(idMoviesList.keys))" , success: { (movieDetails) in
    //            print("Details!:\n\(movieDetails)")
    //            self.tableView.reloadData()
    //        })
    //    }
    
    
    private func fetchMovies() {
        moviesManager.fetchMovieList() { moviesList in
            self.movies = moviesList.results
            self.tableView.reloadData()
        }
    }
    
    
    
    private func fetchMovieId() {
        moviesManager.fetchMovieList(success: { (idList) in
            for ids in idList.results {
                self.moviesManager.fetchMovieDetails(movieId: ids.id) { details in
                    self.idMoviesList.updateValue("\(details.title)", forKey: details.id)
                    print("Se introduce la siguiente pelicula en el diccionario=\nID: \(details.id), TITULO: \(details.title)")
                    print(self.idMoviesList)
                }
            }
            self.tableView.reloadData()
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let profile = MoviesViewModel.selectedProfile {
            avatarButtonOut.image = profile.miniImage
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showProfileSelectionIfNeeded()
        
    }
    
    private var profileSelectionScreenNeeded: Bool = true
    private func showProfileSelectionIfNeeded() {
        if profileSelectionScreenNeeded {
            goToProfileSelection()
            profileSelectionScreenNeeded = false
        }
    }
    
    
    
    @IBAction func avatarButtonAct(_ sender: Any) {
        performSegue(withIdentifier: "goToProfileSelection", sender: self)
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell", for: indexPath)
        
        if let moviesCell = cell as? CellVC,
           let section: SectionType = SectionType(rawValue: indexPath.section) {
            moviesCell.rowHeight = section.rowHeight
            moviesCell.circullarCells = section.isCircular
            moviesCell.movies = moviesForSection(indexPath.section)
            moviesCell.delegate = self
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section: SectionType = SectionType(rawValue: indexPath.section) else {
            return 100
        }
        return section.rowHeight
    }
    
    
    private func moviesForSection(_ section: Int) -> [Movie] {
        guard let allMovies = self.movies,
              let sectionType: SectionType = SectionType(rawValue: section) else {
            return [] }
        switch sectionType {
        case .mostPopular:
            return allMovies.sorted{ $0.popularity > $1.popularity}
        case .recentlyAdded:
            return allMovies.sorted{ $0.releaseDate > $1.releaseDate}
        case .mostVoted:
            return allMovies.sorted{ $0.voteAverage > $1.voteAverage}
        case .discover:
            return allMovies.shuffled()
        case .internationalMovies:
            return allMovies.filter{ $0.originalLanguage != "en"}
            
        }
        
    }
    
    
    // MARK: - Navigation
    
    private func goToProfileSelection() {
        performSegue(withIdentifier: "goToProfileSelection", sender: self)
    }
    
    private func goToMovieDetails() {
        performSegue(withIdentifier: "show_detail", sender: self)
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionType: SectionType = SectionType(rawValue: section) else {
            return "<missing_title>"
        }
        return sectionType.name
    }
      
    
}


// MARK: - Table View Delegate
extension MovieTableViewController: CellVCDelegate {
    func didSelectMovie(movieId: Int) {
        MoviesViewModel.selectedMovieId = movieId
        print("Id movie: \(movieId)")
        goToMovieDetails()
    }
}


//  MARK: - Info for Sections
extension MovieTableViewController {
    enum SectionType: Int, CaseIterable {
        case mostPopular, recentlyAdded, mostVoted, discover, internationalMovies
        
        var name: String {
            switch self {
            case .mostPopular:
                return "Most Populars"
            case .recentlyAdded:
                return "Recently Added"
            case .mostVoted:
                return "Most Voted"
            case .discover:
                return "For you"
            case .internationalMovies:
                return "International Movies"
            }
        }
        
        var rowHeight: CGFloat {
            switch self {
            case .mostPopular:
                return 300.0
            default:
                return 150.0
            }
        }
        
        var isCircular: Bool {
            switch self {
            case .mostVoted:
                return true
            default:
                return false
            }
        }
    }
}
