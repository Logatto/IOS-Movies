//
//  Movie.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Codable {
    let id: Int
    let title: String
    let poster_path: String
    let release_date : Date
    let overview : String
    let backdrop_path: String
    
    func getImagePoster() -> UIImage {
        do {
            let url = URL(string: Contants.urlImage+self.poster_path)
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        }
        catch{
            print("ERROR")
        }
        return UIImage(named: "placeholder")!
    }
    func getImageBackdrop() -> UIImage {
        do {
            let url = URL(string: Contants.urlImage+self.backdrop_path)
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        }
        catch{
            print("ERROR")
        }
        return UIImage(named: "placeholder")!
    }
    
    func getYear() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let yearFormatterPrint = DateFormatter()
        yearFormatterPrint.dateFormat = "yyyy"
        
        let dateResult: NSDate? = self.release_date as NSDate
        return yearFormatterPrint.string(from: dateResult! as Date)
    }
}
