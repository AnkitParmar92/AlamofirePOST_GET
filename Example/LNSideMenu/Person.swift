//
//  Person.swift
//  LNSideMenu_Example
//
//  Created by apple on 29/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct Person {
    
    private let homeWorldLink: String
    
    let birthYear:      String
    let eyeColor:       String
    let gender:         String
    let haircolor:      String
    let height:         String
    let mass:           String
    let name:           String
    let skinColor:      String
    
    
    
    init?(json: JSON)
    {
        guard let birthYear =     json["birth_year"] as? String,
        let eyeColor =            json["eye_color"] as? String,
        let gender =              json["gender"] as? String,
        let haircolor =           json["hair_color"] as? String,
        let height =              json["height"] as? String,
        let homeWorldLink =       json["homeworld"] as? String,
        let mass =                json["mass"] as? String,
        let name =                json["name"] as? String,
        let skinColor =           json["skin_color"] as? String
            else { return nil }
        
        self.homeWorldLink =   homeWorldLink
        self.birthYear =       birthYear
        self.eyeColor =        eyeColor
        self.gender =          gender
        self.haircolor =       haircolor
        self.height =          height
        self.mass =            mass
        self.name =            name
        self.skinColor =       skinColor
        
        
    }
}
