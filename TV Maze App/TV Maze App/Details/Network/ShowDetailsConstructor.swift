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
    
    internal var path: String {
        switch self {
        case .showDetails(let id):
            return "/shows/\(id)"
        case .aliases(let id):
            return "/shows/\(id)/akas"
        }
    }
    
    internal var method: NetworkMethod {
        switch self {
        case .showDetails, .aliases:
            return .get
        }
    }
    
    internal var headers: NetworkHeader {
        switch self {
        case .showDetails, .aliases:
            return [:]
        }
    }
    
    internal var encoding: NetworkEncoder {
        switch self {
        case .showDetails, .aliases:
            return .urlEncoding
        }
        
    }
    
    internal var parameters: Parameters? {
        return nil
    }
}
