//
//  CellVC.swift
//  IntroTV
//
//  Created by Martín on 02/12/2020.
//

import UIKit
import AlamofireImage

protocol CellVCDelegate {
    func didSelectMovie(movieId: Int)
}



class CellVC: UITableViewCell {

    @IBOutlet weak var rectangulaConstraints: NSLayoutConstraint!
    @IBOutlet weak var squaredConstraints: NSLayoutConstraint!
    @IBOutlet var buttonsCollection: [UIButton]!
    
    var delegate: CellVCDelegate?
    
    var circullarCells: Bool = false {
        didSet {
            squaredConstraints.isActive = circullarCells
            rectangulaConstraints.isActive = !circullarCells
            updateButtonsFormat()
        }
    }
    
    var rowHeight: CGFloat = 0 {
        didSet {
            updateButtonsFormat()
        }
    }
    
    var movies: [Movie] = [] {
        didSet {
            updateCoverImages()
            updateButtonsIds()
        }
    }
    
    private func updateButtonsFormat() {
        for button in buttonsCollection {
            let radius: CGFloat = circullarCells ? rowHeight*0.5: 0
            button.layer.cornerRadius = radius
            button.clipsToBounds = true
            button.imageView?.contentMode = .scaleAspectFill
        }
    }
    
    
    private func updateCoverImages() {
        buttonsCollection.forEach {
            $0.setImage(nil, for: .normal)
            $0.isHidden = true
        }
        
        zip(movies, buttonsCollection).forEach { (movie, button) in
            if let posterPath = movie.posterPath {
                let urlToImage = Endpoints.movieCoverImage.url + posterPath
                if let url = URL(string: urlToImage) {
                    button.af.setImage(for: .normal, url: url)
                    //aqui creo que falta el alamofire image
                    button.isHidden = false
                }
            }
        }
        
    }
    
    private func updateButtonsIds() {
        zip(movies, buttonsCollection).forEach { (movie, button) in
            button.tag = movie.id
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    
    @IBAction func buttonTouchedAct(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.didSelectMovie(movieId: sender.tag)
        }
    }
    
    
    
    
}
