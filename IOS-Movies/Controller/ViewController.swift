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
    var movies : [Movie] = []
    var currentPage = 1
    var isLoadData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        loadMovies()
    }
    
    func loadMovies(){
        
        isLoadData = true
        
        APIMovie.getMovies(page: self.currentPage){ result in
            switch result {
            case .success(let moviesResult):
                
                self.movies.append(contentsOf: moviesResult.results)
                self.collectionView.reloadData()
                self.resizeCells()
                self.isLoadData = false
                self.currentPage+=1
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func resizeCells(){
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        layout.minimumInteritemSpacing = 2
        let size = self.collectionView.frame.size
        layout.itemSize = CGSize(width: (size.width-20)/3 , height: size.height/4)
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // load more Movies next page
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if(offsetY > contentHeight - scrollView.frame.height){
            if(!isLoadData){
                loadMovies()
            }
        }
        
        // Hide or show NavigationBar
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }

}

