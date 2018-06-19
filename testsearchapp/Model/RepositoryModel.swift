//
//  RepositoryModel.swift
//  testsearchapp
//
//  Created by Николай Войтович on 6/18/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

struct RepositoryModel: Codable {
  
  let name: String
  let description: String
  let url: String
  let stargazers_count: Int
  
  
}
