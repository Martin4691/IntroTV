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
