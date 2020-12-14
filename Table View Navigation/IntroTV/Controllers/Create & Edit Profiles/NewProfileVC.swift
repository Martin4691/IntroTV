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
    

    let profileManager: ProfileManager = ProfileManager()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        for (index, profile) in profileManager.readProfiles().enumerated() {
            if index == 0 {
                label0Out.text = profile.name

                profile0Out.backgroundColor = .black
                profile0Out.setImage(UIImage(named: profile.imageName), for: .normal)
                
            } else if index == 1 {
                label1Out.text = profile.name
                profile1Out.backgroundColor = .black
                profile1Out.setImage(UIImage(named: profile.imageName), for: .normal)
                
            } else if index == 2 {
                label2Out.text = profile.name
                profile2Out.backgroundColor = .black
                profile2Out.setImage(UIImage(named: profile.imageName), for: .normal)
                
            } else if index == 3 {
                label3Out.text = profile.name
                profile3Out.backgroundColor = .black
                profile3Out.setImage(UIImage(named: profile.imageName), for: .normal)
            }
        }
    }
    
    
    
    @IBAction func profile0Act(_ sender: Any) {
        if profileManager.readProfiles().count > 0 {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile =
                profileManager.readProfiles()[0].name
            ProfileEditionViewModel.name = profileManager.readProfiles()[0].name
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
    
    @IBAction func profile1Act(_ sender: Any) {
        if profileManager.readProfiles().count > 1 {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[1].name
            ProfileEditionViewModel.name = profileManager.readProfiles()[1].name
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
    
    @IBAction func profile2Act(_ sender: Any) {
        if profileManager.readProfiles().count > 2 {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[2].name
            ProfileEditionViewModel.name = profileManager.readProfiles()[2].name
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
    
    @IBAction func profile3Act(_ sender: Any) {
        if profileManager.readProfiles().count > 3 {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[3].name
            ProfileEditionViewModel.name = profileManager.readProfiles()[3].name
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
   
    
    
    
    
    
    
}

