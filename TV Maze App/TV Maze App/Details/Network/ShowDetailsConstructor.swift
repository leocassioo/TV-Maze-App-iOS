//
//  ShowDetailsConstructor.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import Foundation


internal enum ShowDetailsConstructor: NetworkConstructor {
    case showDetails(id: Int)
    case aliases(id: Int)
    case cast(id: Int)
    
    internal var path: String {
        switch self {
        case .showDetails(let id):
            return "/shows/\(id)"
        case .aliases(let id):
            return "/shows/\(id)/akas"
        case .cast(let id):
            return "/shows/\(id)/cast"
        }
    }
    
    internal var method: NetworkMethod {
        switch self {
        case .showDetails, .aliases, .cast:
            return .get
        }
    }
    
    internal var headers: NetworkHeader {
        switch self {
        case .showDetails, .aliases, .cast:
            return [:]
        }
    }
    
    internal var encoding: NetworkEncoder {
        switch self {
        case .showDetails, .aliases, .cast:
            return .urlEncoding
        }
        
    }
    
    internal var parameters: Parameters? {
        return nil
    }
}
