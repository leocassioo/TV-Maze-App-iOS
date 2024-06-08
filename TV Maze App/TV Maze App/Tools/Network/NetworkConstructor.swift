//
//  NetworkMethod.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias NetworkHeader = [String: String]

public struct NetworkMethod: RawRepresentable, Equatable, Hashable {

    public static let get = NetworkMethod(rawValue: "GET")
    public static let post = NetworkMethod(rawValue: "POST")
    public static let put = NetworkMethod(rawValue: "PUT")
    public static let delete = NetworkMethod(rawValue: "DELETE")
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public enum NetworkEncoder {
    case json
    case urlEncoding
}

public protocol NetworkConstructor {
    
    var path: String {get}
    
    var method: NetworkMethod {get}
    
    var headers: NetworkHeader {get}
    
    var encoding: NetworkEncoder {get}
    
    var parameters: Parameters {get}
}
