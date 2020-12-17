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
    let pencilImage: UIImage = UIImage(systemName: "pencil")!
    
    
    //MARK: - Appears
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldOut.layer.borderColor = UIColor.gray.cgColor
        textFieldOut.layer.borderWidth = 2
        editButtonOut.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        
        if let avatarImageName = ProfileEditionViewModel.AvatarImageName {
            editButtonOut.setImage(UIImage(named: avatarImageName), for: .normal)
            editButtonOut.setBackgroundImage(nil, for: .normal)
            textFieldOut.text = ProfileEditionViewModel.name
        } else {
            textFieldOut.layer.borderColor = UIColor.gray.cgColor
            textFieldOut.layer.borderWidth = 2
            editButtonOut.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let avatarImageName = ProfileEditionViewModel.AvatarImageName {
            editButtonOut.setImage(UIImage(named: avatarImageName), for: .normal)
            editButtonOut.setBackgroundImage(nil, for: .normal)
            textFieldOut.text = ProfileEditionViewModel.name
        } else {
            textFieldOut.layer.borderColor = UIColor.gray.cgColor
            textFieldOut.layer.borderWidth = 2
            editButtonOut.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        editButtonOut.setImage(UIImage(systemName: "pencil"), for: .normal)
        editButtonOut.setBackgroundImage(nil, for: .normal)
        textFieldOut.text = "Insert name here"
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func textFieldAct(_ sender: Any) {
    }
    
    
    func removeAvatar() {
        ProfileEditionViewModel.AvatarImageName = nil
        editButtonOut.setBackgroundImage(UIImage(systemName: "pencil"), for: .normal)
        
    }
    
    @IBAction func cancelButtonAct(_ sender: Any) {
        removeAvatar()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        
        guard let name = textFieldOut.text
        else { return }
        let profile: Profile = Profile(name: name, id: 0, imageName: ProfileEditionViewModel.AvatarImageName ?? "LogoPNGTenoch")
        
        if let selectedProfile = MoviesViewModel.selectedProfile {
            profileManager.removeProfile(selectedProfile)
        }
        profileManager.saveProfile(profile)
        
    }
    
    @IBAction func removeButtonAct(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "Profile will be delete.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
            
            // de aqui
            if let profile = MoviesViewModel.selectedProfile {
                self.profileManager.removeProfile(profile)
            }
            self.navigationController?.popViewController(animated: true)
            // hasta aqui es la parte que elimina. El resto es la estructura del alert.
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func editImgAct(_ sender: Any) {
        performSegue(withIdentifier: "segueToAvatarImage", sender: self)
    }
    
    
    
    
}



