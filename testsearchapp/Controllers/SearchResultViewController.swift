//
//  SearchResultViewController.swift
//  testsearchapp
//
//  Created by Николай Войтович on 6/18/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  var nameForSearch: String = ""
  
  var isLoadingNow = false
  
  var foundAccounts: [RepositoryModel] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
    makeNetworkRequest(errorHandler: nil)
    }
  
  func makeNetworkRequest(errorHandler: (() -> Void)?) {
    if !isLoadingNow {
      isLoadingNow = true
      
      NetworkLayer.searchRepositories(name: nameForSearch) { (repositories) in
        self.isLoadingNow = false
        if let repositories = repositories {
          self.foundAccounts += repositories
        } else {
          errorHandler?()
        }
      }
    }
  }


}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foundAccounts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell") as? RepositoryTableViewCell
    cell?.setup(with: foundAccounts[indexPath.row])
    return cell!
  }
}
