//
//  NetworkServiceSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import Foundation
@testable import TV_Maze_App

final class NetworkServiceSpy: NetworkServiceProtocol {
    
    enum Method: Equatable {
        case request
    }
    
    private(set) var calledMethods: [Method] = []
    var resultToReturn: Result<[ShowResponse], Error>?
    
    func request<T: Decodable>(constructor: NetworkConstructor, completion: @escaping (Result<T, Error>) -> Void) {
        calledMethods.append(.request)
        if let result = resultToReturn as? Result<T, Error> {
            completion(result)
        }
    }
}
