//
//  Endpoints.swift
//  IntroTV
//
//  Created by Martín on 02/12/2020.
//

import Foundation
import UIKit


enum Endpoints: String {
    case movieDiscover = "https://api.themoviedb.org/3/discover/movie?"
    case movieDetails = "https://api.themoviedb.org/3/movie"
    case movieCoverImage = "https://image.tmdb.org/t/p/w500"
    
    var url: String { self.rawValue }
    
}


enum EndpointsParameters: String {
    case apiKey
    case query = "q"
    
    
    
}
