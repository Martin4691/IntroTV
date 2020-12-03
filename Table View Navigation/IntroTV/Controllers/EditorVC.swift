//
//  EditorVC.swift
//  IntroTV
//
//  Created by Martín on 30/11/2020.
//
import UIKit
import Foundation


class EditorVC: UIViewController {
    

    
    @IBOutlet weak var editButtonOut: UIButton!
    @IBOutlet weak var editLabelOut: UILabel!
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var allAgesOut: UILabel!
    @IBOutlet weak var removeButtonOut: UIButton!
    
    
    private let profile: String = "ProfileKey"
    let profileManager: ProfileManager = ProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldOut.layer.borderColor = UIColor.gray.cgColor
        textFieldOut.layer.borderWidth = 2
        
         
        
    }
    
    
    
    @IBAction func textFieldAct(_ sender: Any) {
    }
    
    @IBAction func cancelButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
   
        guard let name = textFieldOut.text
        else { return }
        
        profileManager.saveProfile(name)
        
    }
    
    
    @IBAction func removeButtonAct(_ sender: Any) {
        
    }
    
    
    @IBAction func editImgAct(_ sender: Any) {
        performSegue(withIdentifier: "segueToAvatarImage", sender: self)
    }
    
    
    
    
    
    
}



