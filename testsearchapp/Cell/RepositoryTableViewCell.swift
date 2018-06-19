//
//  RepositoryTableViewCell.swift
//  testsearchapp
//
//  Created by Николай Войтович on 6/18/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var descriptionLabel: UILabel!
  @IBOutlet private var ratingLabel: UILabel!
  
  func setup(with model:RepositoryModel) {
    nameLabel.text = model.name
    descriptionLabel.text = model.description
    ratingLabel.text = String(model.stargazers_count)
  }
    
}
