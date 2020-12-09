//
//  MoviesManagers.swift
//  IntroTV
//
//  Created by Martín on 04/12/2020.
//
import UIKit
import Foundation
import Alamofire

struct MoviesManagers {
    static let apiKeyValue: String = "d3e5f2e7aa48d158fe52cb91d420410c"
    
    func fetchMovieList(success: @escaping (MovieList) -> ()) {
        let parameters: [String:String] = [
            MovieParameters.api_key.rawValue: MoviesManagers.apiKeyValue
        ]
        
        AF.request(Endpoints.movieDiscover.url, parameters: parameters).validate().responseDecodable(of: MovieList.self) { response in
            guard let listOfMovies = response.value else {
                debugPrint("Se te esta atascando en la petición sobre MovieList \(#function).")
                self.printResponse(response)
                return
            }
            success(listOfMovies)
        }
    }

    
    
    func fetchMovieDetails(movieId: Int,
                           success: @escaping (MoviesDetails) -> ()) {
        let parameters: [String:String] = [
            MovieParameters.api_key.rawValue: MoviesManagers.apiKeyValue
        ]
        
        let fullUrl = Endpoints.movieDetails.url + "/" + String(movieId)
        AF.request(fullUrl, parameters: parameters).validate().responseDecodable(of: MoviesDetails.self) { response in
            guard let listOfMovies = response.value else {
                debugPrint("Se te esta atascando en la petición sobre MovieList \(#function).")
                self.printResponse(response)
                return
            }
           
            success(listOfMovies)
        }
    }
    
    
  
    
    
    private func printResponse<T>(_ response: AFDataResponse<T>) {
        debugPrint("Request: \(String(describing: response.request))")
        debugPrint("Error: \(String(describing: response.error))")
    }

    
}
