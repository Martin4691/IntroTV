//
//  ViewController.swift
//  Table View Navigation
//
//  Created by Martín on 29/10/2020.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionText: String = ""
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    
    
  }

    override func viewWillAppear(_ animated: Bool) {
        descriptionLabel.text = descriptionText
    }

}

