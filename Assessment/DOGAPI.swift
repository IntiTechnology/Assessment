//
//  GW2API.swift
//  Assessment
//
//  Created by Erick Manrique on 9/22/17.
//  Copyright © 2017 Erick Manrique. All rights reserved.
//

import Foundation
import ReactiveJSON

/// A JSON client for the Guild Wars 2 API
struct GW2API: Singleton, ServiceHost {
//    // 'Singleton'
//    private(set) static var shared = Instance()
//    typealias Instance = GW2API
//
//    // 'ServiceHost'
//    static var scheme: String { return "https" }
//    static var host: String { return "api.guildwars2.com" }
//    static var path: String? { return "v2" }
    
    // 'Singleton'
    private(set) static var shared = Instance()
    typealias Instance = GW2API
    
    // 'ServiceHost'
    static var scheme: String { return "https" }
    static var host: String { return "dog.ceo" }
    static var path: String? { return "api" }
}


struct DOGAPI: Singleton, ServiceHost {
    // 'Singleton'
    private(set) static var shared = Instance()
    typealias Instance = GW2API
    
    // 'ServiceHost'
    static var scheme: String { return "https" }
    static var host: String { return "dog.ceo" }
    static var path: String? { return "api" }
}
