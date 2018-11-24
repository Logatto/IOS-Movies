//
//  ViewController.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadMovies()
    }
    
    func loadMovies(){
        APIMovie.getMovies{ result in
            switch result {
            case .success(let moviesResult):
                self.movies = moviesResult.results
                print("MOVies ", self.movies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

