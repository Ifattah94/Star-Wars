//
//  Character.swift
//  Star Wars
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct SWCharacterSearch: Codable {
    let results: [SWCharacterInfo]
}

struct SWCharacterInfo: Codable {
    let name: String
    let height: String
    let mass: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    
}
