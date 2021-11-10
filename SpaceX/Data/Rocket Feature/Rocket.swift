//
//  Rocket.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

struct Rocket: Decodable {
    
    let id: String
    let name: String
    let type: String
    
    init(id: String,
         name: String,
         type: String) {
        self.id = id
        self.name = name
        self.type = type
    }
}
