//
//  GetPeopleResponse.swift
//  LNSideMenu_Example
//
//  Created by apple on 29/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct GetPeopleResponse {
    
    let people: [Person]
    
    init(json: JSON) throws  {
        guard let results = json["results"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        
        let people = results.map{ Person(json: $0) }.flatMap{ $0 }
        
        self.people = people
        
    }
}
