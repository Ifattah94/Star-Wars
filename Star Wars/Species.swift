//
//  Species.swift
//  Star Wars
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct Species: Codable {
    let name: String
    let classification: String
    let language: String
}

struct SpeciesAPIClient {
    private init() {}
    static let shared = SpeciesAPIClient()
    func getSpecies (from urlStr: String, completionHandler: @escaping (Species) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let species = try JSONDecoder().decode(Species.self, from: data)
                completionHandler(species)
            }
            catch {
                print(error)
            }
        }
       NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}







