//
//  NetworkingManager.swift
//  toy-blocks
//
//  Created by Siroson on 2021-10-10.
//  Copyright © 2021 James Rhodes. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case noData
    case invalidData
    case cannotParseJSON
    case unknownError(Error)
}

class NetworkingManager {
    
    private var urlSession: URLSession!
    typealias RootCompletion = ((Result<Root, NetworkError>) -> Void)
    
    init(session: URLSession = URLSession.shared) {
        self.urlSession = session
    }
    
    func getData(url: String, completion: @escaping RootCompletion) {
      let endpoint = URL(string: "\(url)\(kBlocksApiPath)")!
      let request = URLRequest(url: endpoint)

      let task = urlSession.dataTask(with: request) { (data, response, error) in
          guard let data = data else {
            completion(.failure(.noData))
            return
          }
        
          do {
            let json = try JSONDecoder().decode(Root.self, from: data)
            completion(.success(json))
          } catch {
            print("didnt work \(error).")
            completion(.failure(.unknownError(error)))
          }
      }
      task.resume()
    }
}
