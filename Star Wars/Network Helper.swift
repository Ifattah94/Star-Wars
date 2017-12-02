//
//  Network Helper.swift
//  Star Wars
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    private let urlSession = URLSession(configuration: .default)
    func performDataTask(
        with url: URL,
        completionHandler: @escaping (Data) -> Void,
        errorHandler: @escaping (Error) -> Void) {
        urlSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    errorHandler(error)
                    return
                }
                
                if let data = data {
                    completionHandler(data)
                }
                
            }
            }.resume()
    }
}
