//
//  NewProfileVC.swift
//  IntroTV
//
//  Created by Martín on 30/11/2020.
//
import UIKit
import Foundation


class NewProfileVC: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var profile0Out: UIButton!
    @IBOutlet weak var label0Out: UILabel!
    
    @IBOutlet weak var profile1Out: UIButton!
    @IBOutlet weak var label1Out: UILabel!
    
    @IBOutlet weak var profile2Out: UIButton!
    @IBOutlet weak var label2Out: UILabel!
    
    @IBOutlet weak var profile3Out: UIButton!
    @IBOutlet weak var label3Out: UILabel!
    
    
    @IBOutlet weak var doneOut: UIBarButtonItem!
    @IBOutlet weak var editModeOut: UIBarButtonItem!
    
    
    
    let profileManager: ProfileManager = ProfileManager()
   
    var isEditMode: Bool = false
    func editionMode() {
     if isEditMode == false {
        doneOut.hide()
       editModeOut.show()
        editModeOut.title = "Edit"
        editModeOut.tintColor = .white
     } else {
        doneOut.show()
        doneOut.title = "Done"
        doneOut.tintColor = .white
       editModeOut.hide()
     }
    }
    
    
    //MARK: - Appear Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isEditMode = false
        editionMode()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        resetButtons()
        
        for (index, profileBucle) in profileManager.readProfiles().enumerated() {
            if index == 0 {
                label0Out.text = profileBucle.name

                profile0Out.backgroundColor = .black
                profile0Out.setImage(UIImage(named: profileBucle.imageName), for: .normal)
                
            } else if index == 1 {
                label1Out.text = profileBucle.name
                profile1Out.backgroundColor = .black
                profile1Out.setImage(UIImage(named: profileBucle.imageName), for: .normal)
                
            } else if index == 2 {
                label2Out.text = profileBucle.name
                profile2Out.backgroundColor = .black
                profile2Out.setImage(UIImage(named: profileBucle.imageName), for: .normal)
                
            } else if index == 3 {
                label3Out.text = profileBucle.name
                profile3Out.backgroundColor = .black
                profile3Out.setImage(UIImage(named: profileBucle.imageName), for: .normal)
            }
        }
    }
    
    
    //MARK: - Profiles Actions
    
    @IBAction func profile0Act(_ sender: Any) {
        if profileManager.readProfiles().count > 0 && !isEditMode {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile =
                profileManager.readProfiles()[0]
            ProfileEditionViewModel.name = MoviesViewModel.selectedProfile?.name
            MoviesViewModel.newAvatarImage = MoviesViewModel.selectedProfile?.imageName
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
   
    
    @IBAction func profile1Act(_ sender: Any) {
        if profileManager.readProfiles().count > 1 && !isEditMode {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[1]
            ProfileEditionViewModel.name = MoviesViewModel.selectedProfile?.name
            MoviesViewModel.newAvatarImage = MoviesViewModel.selectedProfile?.imageName
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
    
    @IBAction func profile2Act(_ sender: Any) {
        if profileManager.readProfiles().count > 2 && !isEditMode {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[2]
            ProfileEditionViewModel.name = MoviesViewModel.selectedProfile?.name
            MoviesViewModel.newAvatarImage = MoviesViewModel.selectedProfile?.imageName
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
    
    @IBAction func profile3Act(_ sender: Any) {
        if profileManager.readProfiles().count > 3 && !isEditMode {
            dismiss(animated: true, completion: nil)
            MoviesViewModel.selectedProfile = profileManager.readProfiles()[3]
            ProfileEditionViewModel.name = MoviesViewModel.selectedProfile?.name
            MoviesViewModel.newAvatarImage = MoviesViewModel.selectedProfile?.imageName
        } else {
            self.performSegue(withIdentifier: "segueToEdit", sender: self)
        }
    }
   
    
    //MARK: - Other Actions
    
    @IBAction func doneAct(_ sender: Any) {
        isEditMode = false
         editionMode()
        
    }
    
    
    @IBAction func editModeAct(_ sender: Any) {
       isEditMode = true
        editionMode()
    
    }
    
  
    // Esta funcion resetea al valor inicial los botones para que el ciclo for del willApear reemplace estos botones de perfil vacio. Objetivo: que cuando elimine un perfil el boton vuelva al estado inicial preedicion del perfil eliminado. Sin este reset no se va a borrar el icono y nombre del perfil hasta que cierres el simulador y lo vuelvas a abrir. PD: Esta planteado de una forma poco refinada.
    func resetButtons() {
        profile0Out.backgroundColor = .gray
        profile0Out.setImage(UIImage(systemName: "plus"), for: .normal)
        label0Out.text = "New Profile"
        
        profile1Out.backgroundColor = .gray
        profile1Out.setImage(UIImage(systemName: "plus"), for: .normal)
        label1Out.text = "New Profile"
        
        profile2Out.backgroundColor = .gray
        profile2Out.setImage(UIImage(systemName: "plus"), for: .normal)
        label2Out.text = "New Profile"
        
        profile3Out.backgroundColor = .gray
        profile3Out.setImage(UIImage(systemName: "plus"), for: .normal)
        label3Out.text = "New Profile"
        
    }
    
    

    
}

