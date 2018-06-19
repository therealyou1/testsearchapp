//
//  NetworkLayer.swift
//  testsearchapp
//
//  Created by Николай Войтович on 6/18/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

final class NetworkLayer {
  
  
  
  
  static let searchApi = "https://api.github.com/search/repositories?"
  
  static func searchRepositories(name: String, completion: @escaping ([RepositoryModel]?) -> Void) {
    
    let parameters: [String: String] = ["q": name]
    
    
    Alamofire.request(NetworkLayer.searchApi, method: .get, parameters: parameters).responseJSON { (jsonResponce) in
      
      if let jsonValue = jsonResponce.result.value as? JSON,
        let jsonItems = jsonValue["items"] {
        
        let decoder = JSONDecoder()
        
        if let itemsData = try? JSONSerialization.data(withJSONObject: jsonItems, options: []) {
          let itemsArray = try? decoder.decode([RepositoryModel].self, from: itemsData)
          completion(itemsArray)
        }
        
      }else {
        completion(nil)
      }
        
    }
    
  }
  
}
