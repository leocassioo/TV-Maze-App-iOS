//
//  HomeConstructor.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation


internal enum HomeConstructor: NetworkConstructor{
    case search(query: String?)
    
    internal var path: String {
        switch self {
        case .search:
            return "/search/shows"
        }
    }
    
    internal var method: NetworkMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    internal var headers: NetworkHeader {
        switch self {
        case .search:
            return [:]
        }
    }
    
    internal var encoding: NetworkEncoder {
        switch self {
        case .search:
            return .urlEncoding
        }
    }
    
    internal var parameters: Parameters {
        switch self {
        case .search(let query):
            return ["q": query ?? String()]
        }
    }
}
