//
//  ViewController.swift
//  Table View Navigation
//
//  Created by Martín on 29/10/2020.
//
import Alamofire
import UIKit
import AVKit

class DetailVC: UIViewController {
    
    let movieManager = MoviesManagers()
    var movieDetails: MoviesDetails?
    
    
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
        movieManager.fetchMovieDetails(movieId: selectedId) { movieDetails in
            self.movieDetails = movieDetails
            self.loadIt(movieDetails: movieDetails)
            self.showVideo()
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
//        configurePlayer(movieDetails: movieDetails)
    }
    
    
    
    // MARK: - Ejemplos para reproducir videos.
    
    //1 AVPlayerLayer: Forma sencilla de reproducir video (no tiene ningun boton ni herramienta por defecto añadida).
    
    
    
    func showVideo() {
        guard let movieDetails = self.movieDetails else { return }
        let player = AVPlayer(url: movieDetails.videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = viewOut.bounds
        viewOut.layer.addSublayer(playerLayer)
        player.play()
    }
    
    /*
    // 2 AVPlayetViewController: + Complejo + Herramientas por defecto
    
    private func configurePlayer(movieDetails: MoviesDetails) {
        guard let videoURL = movieDetails.videoURL else {
            debugPrint("Error: video URL invalid in \(#function)")
            return
            
        }
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        guard let playerView = playerViewController.view else {
            debugPrint("Error: player view is nil")
            return
        }
        
        self.addChild(playerViewController)
        viewOut.addSubview(playerView)
        playerViewController.didMove(toParent: self)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: playerView, attribute: .top, relatedBy: .equal, toItem: viewOut, attribute: .top, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: playerView, attribute: .bottom, relatedBy: .equal, toItem: viewOut, attribute: .bottom, multiplier: 1, constant: 0)
        
        let leadingConstraint = NSLayoutConstraint(item: playerView, attribute: .leading, relatedBy: .equal, toItem: viewOut, attribute: .leading, multiplier: 1, constant: 0)
        
        let trailingConstraint = NSLayoutConstraint(item: playerView, attribute: .trailing, relatedBy: .equal, toItem: viewOut, attribute: .trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
        
        player.play()
        
    }
    */

    @IBAction func playAct(_ sender: Any) {
        guard let movieDetails = self.movieDetails else { return }
        let player = AVPlayer(url: movieDetails.videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
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

