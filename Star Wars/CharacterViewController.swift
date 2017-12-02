//
//  ViewController.swift
//  Star Wars
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController,UITableViewDataSource {
   

    
    @IBOutlet weak var characterTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var searchTerm: String = "" {
        didSet {
            loadData()
        }
    }
    
    var allCharacterInfo = [SWCharacterInfo]() {
        didSet {
            self.characterTableView.reloadData()
        }
    }
    
    func loadData() {
        if searchTerm == "" {
            self.allCharacterInfo = []
            self.characterTableView.reloadData()
            return
        }
        let urlStr = "https://swapi.co/api/people/?search=\(searchTerm)"
        SWCharacterAPIClient.shared.getThings(from: urlStr, completionHandler: {self.allCharacterInfo = $0}, errorHandler: {print($0)})
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCharacterInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = self.characterTableView.dequeueReusableCell(withIdentifier: "Character Cell", for: indexPath)
        let thisCharacter = allCharacterInfo[indexPath.row]
        cell.textLabel?.text = thisCharacter.name
        cell.detailTextLabel?.text = thisCharacter.gender
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.dataSource = self
        self.searchBar.delegate = self 
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationDVC = segue.destination as? CharacterDetailViewController {
            let selectedRow = characterTableView.indexPathForSelectedRow?.row
            let selectedCharacter = allCharacterInfo[selectedRow!]
            destinationDVC.myCharacter = selectedCharacter
        }
    }

}

extension CharacterViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text ?? ""
        searchBar.resignFirstResponder()
    }
}






