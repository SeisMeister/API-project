//
//  RepInfo.swift
//  API Project
//
//  Created by Cesar Fernandez on 5/9/24.
//

import Foundation

struct RepInfo: Codable {
    var name: String
    var party: String
    var state: String
    var district: String
    var phone: String
    var office: String
    var link: URL
}

struct RepInfoResults: Codable {
    let results: [RepInfo]
}
