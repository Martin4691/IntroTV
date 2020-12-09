//
//  ViewController.swift
//  Table View Navigation
//
//  Created by Martín on 29/10/2020.
//
import Alamofire
import UIKit

class DetailVC: UIViewController {

    let movieManager = MoviesManagers()
    
    @IBOutlet weak var viewOut: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var randomItem: UILabel!
    @IBOutlet weak var yearOut: UILabel!
    @IBOutlet weak var random2: UILabel!
    
    @IBOutlet weak var playOut: UIButton!
    @IBOutlet weak var downloadOut: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var productedByLabel: UILabel!

    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchDetailFromMovie()
   
    
    
  }

    private func fetchDetailFromMovie() {
        guard let selectedId = MoviesViewModel.selectedMovieId else { return }
        movieManager.fetchMovieDetails(movieId: selectedId) { movieDetails in self.loadIt(movieDetails: movieDetails)
        }
    }
    
    
    private func loadIt(movieDetails: MoviesDetails) {
        labelTitle.text = "\(movieDetails.title)"
        randomItem.text = "Popularity: \(movieDetails.popularity)"
        yearOut.text = "\(movieDetails.releaseDate)"
        random2.text = "\(movieDetails.originalLanguage)\n"
        
        descriptionLabel.text = "Overview:\n\(movieDetails.overview ?? "No overview")\n"
        genreLabel.text = "Genre: " + movieDetails.genres.map{$0.name}.joined(separator: ", ") + ".\n"
        productedByLabel.text = "Producted by: " + movieDetails.productionCompanies.map{$0.name}.joined(separator: ", ") + ".\n"
        
    }
    
    
    @IBAction func playAct(_ sender: Any) {
    }
    @IBAction func downloadAct(_ sender: Any) {
    }
    
    
    @IBAction func plusAct(_ sender: Any) {
    }
    @IBAction func likeAct(_ sender: Any) {
    }
    @IBAction func sendAct(_ sender: Any) {
    }
    
    
    @IBAction func backButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
}

