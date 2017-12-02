//
//  DetailViewController.swift
//  Star Wars
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var heightLabel: UILabel!
    
    
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    var myCharacter: SWCharacterInfo!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "filmSegue" :
            if let filmTVC = segue.destination as? FilmsTableViewController {
                filmTVC.thisCharacter = myCharacter
                filmTVC.filmURLS = myCharacter.films
                
            }
            //TO DO make case for species segue
        default:
            print("nothing")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myCharacter.name
        heightLabel.text = myCharacter.height
        massLabel.text = myCharacter.mass
        genderLabel.text = myCharacter.gender

    }

   

}
