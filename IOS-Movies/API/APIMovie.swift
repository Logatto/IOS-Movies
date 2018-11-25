//
//  APIMovie.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import Foundation
import Alamofire

class APIMovie {
    static let url = Contants.urlApi+"/movie/popular"
    static var params : Parameters = [
        "api_key" : Contants.apiKey,
        ]
    
    static func getMovies(page:Int, completion:@escaping (Result<ObjectList>)->Void) {
        let jsonDecoder = JSONDecoder()
        params["page"] = page
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.dateFormatter)
        AF.request(URL(string: url)!,parameters: params)
            .responseJSONDecodable (decoder: jsonDecoder){ (response: DataResponse<ObjectList>) in
                completion(response.result)
        }
    }
    
}
