//
//  SWFilm.swift
//  Star Wars
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct SWFilm: Codable {
    let title: String
    let episode_id: Int
    let director: String
    let release_date: String 
}

struct SWFilmAPICLient {
    private init() {}
    static let shared = SWFilmAPICLient()
    func getFilms (from urlStr: String, completionHandler: @escaping ([SWFilm]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let film = try JSONDecoder().decode(SWFilm.self, from: data)
                completionHandler([film])
            }
            catch {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
