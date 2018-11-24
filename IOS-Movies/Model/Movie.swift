//
//  Movie.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let poster_path: String
    let release_date : Date
    let overview : String
}
