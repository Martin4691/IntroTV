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
    
    // esta mierda es un lab de campeonato:
    let videoURL = URL(string: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8")
    
    func showVideo() {
    let player = AVPlayer(url: videoURL!)
    let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = viewOut.bounds
        viewOut.layer.addSublayer(playerLayer)
        player.play()
    }
    
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
        
        showVideo()
        
        
        
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
        let videoURL = URL(string: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8")
        let player = AVPlayer(url: videoURL!)
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

