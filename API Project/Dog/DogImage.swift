//
//  DogImage.swift
//  API Project
//
//  Created by Cesar Fernandez on 5/9/24.
//

import Foundation

struct DogImage: Codable {
    var url: URL? {
        URL(string: message)
    }
    private let message: String
}
