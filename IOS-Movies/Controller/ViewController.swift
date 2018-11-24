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
                print("MOVies ", self.movies)
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("MOVIES ", self.movies.count)
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let movie = self.movies[indexPath.item]
        do {
            let url = URL(string: Contants.urlImage+movie.poster_path)
            let data = try Data(contentsOf: url!)
            cell.imageView.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("EPA ", indexPath.item)
    }
    

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
//            navigationController?.setNavigationBarHidden(true, animated: true)
//            print("HIDE")
//           
//        } else {
//            navigationController?.setNavigationBarHidden(false, animated: true)
//            print("SHOW")
//        }
//    }
    
   

}

