//
//  DispatchQueueProtocol.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import Foundation

internal protocol DispatchQueueProtocol {
    
    func async(group: DispatchGroup?,
               qos: DispatchQoS,
               flags: DispatchWorkItemFlags,
               execute work: @escaping @convention(block) () -> Void)
    
    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS,
                    flags: DispatchWorkItemFlags,
                    execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueueProtocol {
    
    internal func async(group: DispatchGroup? = nil,
                        qos: DispatchQoS = .unspecified,
                        flags: DispatchWorkItemFlags = [],
                        execute work: @escaping @convention(block) () -> Void) {
        async(group: group, qos: qos, flags: flags, execute: work)
    }
    
    internal func asyncAfter(deadline: DispatchTime,
                             qos: DispatchQoS = .unspecified,
                             flags: DispatchWorkItemFlags = [],
                             execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: deadline, qos: qos, flags: flags, execute: work)
    }
}

extension DispatchQueue: DispatchQueueProtocol { }
