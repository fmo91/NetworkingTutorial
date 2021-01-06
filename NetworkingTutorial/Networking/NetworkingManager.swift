//
//  NetworkingManager.swift
//  NetworkingTutorial
//
//  Created by Fernando Martín Ortiz on 06/01/2021.
//

import Foundation
import Alamofire

enum NetworkingManager {
    enum NetworkingError: Error {
        case parsingError
    }
    
    static func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let request = AF.request(
            "https://jsonplaceholder.typicode.com/users",
            method: HTTPMethod.get
        )
        
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                completion(.failure(NetworkingError.parsingError))
                return
            }
            
            let decoder = JSONDecoder()
            let users = try? decoder.decode([User].self, from: data)
            completion(.success(users ?? []))
        }
    }
}
