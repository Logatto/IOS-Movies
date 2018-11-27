//
//  DetailViewController.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/24/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var textDetail: UILabel!
    @IBOutlet weak var titleDetail: UINavigationItem!
    @IBOutlet weak var textYear: UILabel!
    
    var movieDetail: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        titleDetail.title = movieDetail.title
        textDetail.text = movieDetail.overview
        imageDetail.image = movieDetail.getImageBackdrop()
        textYear.text = movieDetail.getYear()

        // Do any additional setup after loading the view.
    }

}
