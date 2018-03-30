//
//  NetworkingService.swift
//  LNSideMenu_Example
//
//  Created by apple on 29/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]
class NetworkingService {
    
    static let Shared = NetworkingService()
    
    private init() {}
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void){
        
        Alamofire.request("http://swapi.co/api/people/").responseJSON { response in
            
            guard let json = response.result.value as? JSON else { return }
            
            do {
                let getPeopleResponse = try GetPeopleResponse(json: json)
                successBlock(getPeopleResponse)
            }
            catch{}
        }
    }
    
}
