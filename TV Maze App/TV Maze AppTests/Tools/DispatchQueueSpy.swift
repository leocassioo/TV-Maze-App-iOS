//
//  DispatchQueueSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import Foundation
@testable import TV_Maze_App

final class DispatchQueueSpy: DispatchQueueProtocol {
    
    enum Method: Equatable {
        case async
        case asyncAfter
    }
    
    private(set) var calledMethods: [Method] = []
    
    func async(group: DispatchGroup? = nil,
               qos: DispatchQoS = .unspecified,
               flags: DispatchWorkItemFlags = [],
               execute work: @escaping @convention(block) () -> Void) {
        calledMethods.append(.async)
        work()
    }
    
    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS = .unspecified,
                    flags: DispatchWorkItemFlags = [],
                    execute work: @escaping @convention(block) () -> Void) {
        calledMethods.append(.asyncAfter)
        work()
    }
}
