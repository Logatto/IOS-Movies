//
//  ViewController.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
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
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let movie = self.movies[indexPath.item]
        cell.imageView.image = movie.getImagePoster()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        nextViewController.data = self.movies[indexPath.item]
    
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}

