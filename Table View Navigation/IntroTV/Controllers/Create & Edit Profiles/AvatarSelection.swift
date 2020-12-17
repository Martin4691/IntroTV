//
//  AvatarSelection.swift
//  IntroTV
//
//  Created by Martín on 01/12/2020.
//
import UIKit
import Foundation


class AvatarSelection: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func blueHead(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_16"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func gipsyGirl(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_08"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func transexualMoor(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_07"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func captain(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_38"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func motherLand(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_30"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func blackGrandma(_ sender: Any) {
        ProfileEditionViewModel.AvatarImageName = "avatar_19"
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func backButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}


