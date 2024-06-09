//
//  DispatchQueueProtocol.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void)
    func asyncAfter(deadline: DispatchTime, execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void) {}
    
    func asyncAfter(deadline: DispatchTime, execute work: @escaping () -> Void) {}
}
