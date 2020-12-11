//
//  ProfileManager.swift
//  IntroTV
//
//  Created by Martín on 01/12/2020.
//
import Alamofire
import Foundation
import UIKit

struct ProfileManager {
    
    func readProfiles() -> [Profile] {
        if let encodedData = UserDefaults.standard.data(forKey: ProfileKeys.profileList.rawValue) {
            do {
                let userList = try JSONDecoder().decode([Profile].self, from: encodedData)
                return userList
                
            } catch {
                print("Unable to decode [Profiles] (\(error)")
            }
        }
        return []
    }
    
    
    func saveProfile(_ profile: Profile) {
        removeProfile(profile)
        var userList = readProfiles()
        userList.append(profile)
        saveAllProfiles(userList)
    }
    
    func removeProfile(_ profile:Profile) {
        var userList = readProfiles()
        userList.removeAll(where: {$0 == profile })
        saveAllProfiles(userList)
    }
    
    private func saveAllProfiles(_ profile: [Profile]) {
        guard let encodedData = try? JSONEncoder().encode(profile) else { return }
        UserDefaults.standard.set(encodedData, forKey: ProfileKeys.profileList.rawValue)
        UserDefaults.standard.synchronize()
    }
}



enum ProfileKeys: String {
    case profileList
}










/*
 MARK: - OLD/FIRST CODE
 
 ---> Aqui dejo el código inicial donde se pasaba solo el nombre de usuario como identificador por si hubiera de recuperarlo.
 A partir de aqui intentaremos que pase la imagen y segun Cesc habrá que darle caña al UserDefaults, con lo que se va a complicar la cosa en cuanto a complejidad.
 
 --------> Codigo inicial:
 
 struct ProfileManager {
 
 let profile: String = "ProfileKey"
 
 
 func readProfiles() -> [String] {
 let listOfUsers: [String] = UserDefaults.standard.stringArray(forKey: profile ) ?? [String]()
 
 return listOfUsers
 }
 
 
 func saveProfile(_ userName: String) {
 var listOfUsers: [String] = UserDefaults.standard.stringArray(forKey: profile ) ?? [String]()
 
 listOfUsers.append(userName)
 UserDefaults.standard.set(listOfUsers, forKey: profile)
 UserDefaults.standard.synchronize()
 print("\(listOfUsers)")
 }
 
 
 }
 
 */
