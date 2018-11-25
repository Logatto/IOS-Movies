//
//  Persist.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/24/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import Foundation

class Persist{
    
    static func readMovies() -> [Movie]{
        if let value = UserDefaults.standard.value(forKey:"movies") as? Data {
            let movies = try? PropertyListDecoder().decode([Movie].self, from: value)
            return movies!
        }
        return []
    }
    
    static func setMovies(movies: [Movie]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(movies), forKey:"movies")
        UserDefaults.standard.synchronize()
    }
    
    static func readPage() -> Int{
        if let value : Int = UserDefaults.standard.integer(forKey: "page") {
            return value > 0 ? value : 1
        }else{
            return 1
        }
    }
    
    static func setPage(page: Int){
        UserDefaults.standard.set(page, forKey: "page")
        UserDefaults.standard.synchronize()
    }
    
}
