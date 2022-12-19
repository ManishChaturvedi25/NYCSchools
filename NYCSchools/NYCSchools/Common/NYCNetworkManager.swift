//
//  NYCNetworkManager.swift
//  NYCSchools
//
//  Created by Manish Chaturvedi on 10/23/22.
//  Copyright © 2022 Manish Chaturvedi. All rights reserved.
//

import Foundation

struct APIURLConstants {
    static let fetchSchools = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    static let fetchSATScores = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}

class NYCNetworkManager{
    let token = ""

    
    func fetchData(urlString: String, completionHandler: @escaping (Any?, Error?) -> ()) -> (){
        
        guard let urlPath = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlPath) else {
            print("Error: cannot create URL")
            completionHandler([], nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (responseData, response
            , error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 403 {
                    print("Error: Access Denied.")
                    completionHandler([], error)
                }
            }
            
            if error != nil {
                print("Error: Received Error.")
                completionHandler([], error)
                return
            }
            
            guard responseData != nil else {
                print("Error: did not receive data")
                completionHandler([], error)
                return
            }
            
            completionHandler(responseData, error)
        }
        task.resume()
    }
}
