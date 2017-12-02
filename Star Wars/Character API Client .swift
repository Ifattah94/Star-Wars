//
//  Character API Client .swift
//  Star Wars
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
struct SWCharacterAPIClient {
    private init(){}
    static let shared = SWCharacterAPIClient()
    func getThings(from urlStr: String,
                   completionHandler: @escaping ([SWCharacterInfo]) -> Void,
                   errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let character = try JSONDecoder().decode(SWCharacterSearch.self, from: data)
                completionHandler(character.results)
            }
            catch {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
