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
    
    let videos: [String] = [
        "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
        "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8",
        "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
        "https://y5w8j4a9.ssl.hwcdn.net/andflixhd/tracks-v1a1/index.m3u8",
        "https://dai2.xumo.com/xumocdn/p=roku/amagi_hls_data_xumo1212A-filmrisefreemovies/CDN/1280x720_5000000/chunklist.m3u8"
    ]
    
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
