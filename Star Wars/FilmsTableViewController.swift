//
//  FilmsTableViewController.swift
//  Star Wars
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    var films = [SWFilm]() {
        didSet {
            films.forEach{
                print($0.title)
            }
            tableView.reloadData()
        }
    }
    
    var thisCharacter: SWCharacterInfo! {
        didSet {
            //getFilmInfo()
        }
    }
    
    var filmURLS = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        getFilmInfo()
    }
    
    
    func getFilmInfo() {
        for url in filmURLS {
            let urlStr = url
            SWFilmAPICLient.shared.getFilms(from: urlStr, completionHandler: {self.films += $0}, errorHandler: {print($0)})
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = films[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Film Cell", for: indexPath)
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = film.release_date
        return cell
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as? FilmViewController
        let selectedRow = tableView.indexPathForSelectedRow?.row
        let selectedFilm = films[selectedRow!]
        dvc?.thisFilm = selectedFilm
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(films.count)
        return films.count
       
    }

}
