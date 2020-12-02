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
        
        var listOfNames: [String] = UserDefaults.standard.stringArray(forKey: profile ) ?? [String]()
        
        listOfNames.append(name)
        UserDefaults.standard.set(listOfNames, forKey: profile)
        UserDefaults.standard.synchronize()
        print("\(listOfNames)")
        
        
    }
    
    
    
    @IBAction func removeButtonAct(_ sender: Any) {
//        UserDefaults.standard.removeObject(forKey: ProfileEditionViewModel.name!)
    }
    
    
    @IBAction func editImgAct(_ sender: Any) {
        performSegue(withIdentifier: "segueToAvatarImage", sender: self)
    }
    
    
    
    
    
    
}



