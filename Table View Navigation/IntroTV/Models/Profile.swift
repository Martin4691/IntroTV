//
//  SignUp.swift
//  IntroTV
//
//  Created by Martín on 30/11/2020.
//
import UIKit
import Foundation

struct Profile: Equatable, Codable {
    var name: String
    var id: Int
    var imageName: String 
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var miniImage: UIImage? {
        return UIImage(named: (imageName+"_mini"))
    }

    
    //Codigo de Cesc
    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.id == rhs.id
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName
    }

    
}







