//
//  NetworkService.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

internal class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    internal func request<T: Decodable>(constructor: HomeConstructor, completion: @escaping (Result<T, Error>) -> Void) {
        var urlComponents = URLComponents(string: "https://api.tvmaze.com")!
        urlComponents.path = constructor.path
        
        if constructor.encoding == .urlEncoding {
            urlComponents.queryItems = constructor.parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            let error = NSError(domain: "InvalidURL", code: 400, userInfo: [NSLocalizedDescriptionKey: "URL is invalid"])
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = constructor.method.rawValue
        request.allHTTPHeaderFields = constructor.headers
        
        if constructor.encoding == .json {
            request.httpBody = try? JSONSerialization.data(withJSONObject: constructor.parameters, options: [])
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "NoData", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data returned from server"])
                completion(.failure(error))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
