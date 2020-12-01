//
//  NewProfileVC.swift
//  IntroTV
//
//  Created by Martín on 30/11/2020.
//
import UIKit
import Foundation


class NewProfileVC: UIViewController {
    
    @IBOutlet weak var profile0Out: UIButton!
    @IBOutlet weak var label0Out: UILabel!
    
    @IBOutlet weak var profile1Out: UIButton!
    @IBOutlet weak var label1Out: UILabel!
    
    @IBOutlet weak var profile2Out: UIButton!
    @IBOutlet weak var label2Out: UILabel!
    
    @IBOutlet weak var profile3Out: UIButton!
    @IBOutlet weak var label3Out: UILabel!
    
    private let profile: String = "ProfileKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile0Out.layer.borderColor = UIColor.gray.cgColor
        profile0Out.layer.borderWidth = 5
        profile1Out.layer.borderColor = UIColor.gray.cgColor
        profile1Out.layer.borderWidth = 5
        profile2Out.layer.borderColor = UIColor.gray.cgColor
        profile2Out.layer.borderWidth = 5
        profile3Out.layer.borderColor = UIColor.gray.cgColor
        profile3Out.layer.borderWidth = 5
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let listOfNames: [String] = UserDefaults.standard.stringArray(forKey: profile ) ?? [String]()
        
        for (index, name) in listOfNames.enumerated() {
            if index == 0 {
                label0Out.text = name
            } else if index == 1 {
                label1Out.text = name
            } else if index == 2 {
                label2Out.text = name
            } else if index == 3 {
                label3Out.text = name
            }
        }
 
        
    }
    
    
    
    @IBAction func profile0Act(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToEdit", sender: self)

    }
    
    @IBAction func profile1Act(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToEdit", sender: self)
        
    }
    
    @IBAction func profile2Act(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToEdit", sender: self)
       
    }
    
    @IBAction func profile3Act(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToEdit", sender: self)
        
    }
    
    
    
}

