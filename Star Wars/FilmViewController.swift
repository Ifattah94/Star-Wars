//
//  FilmViewController.swift
//  Star Wars
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    
    @IBOutlet weak var directorLabel: UILabel!
    
   
    
    @IBOutlet weak var releaseDate: UILabel!
    
    var thisFilm: SWFilm!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmTitleLabel.text = thisFilm.title
        episodeNumber.text = "episode: \(thisFilm.episode_id.description)"
        directorLabel.text = "director: \(thisFilm.director)"
        releaseDate.text = thisFilm.release_date

        // Do any additional setup after loading the view.
    }

  

}
