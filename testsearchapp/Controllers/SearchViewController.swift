//
//  SearchViewController.swift
//  testsearchapp
//
//  Created by Николай Войтович on 6/18/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

  @IBOutlet var nameFieldOutlet: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    nameFieldOutlet.delegate = self
    }
  
  @IBAction func searchButtonACtion() {
    performSegue(withIdentifier: "segue", sender: nil)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segue"{
      let destination = segue.destination as? SearchResultViewController
      
      destination?.nameForSearch = nameFieldOutlet.text ?? ""
      }
  }
  

}

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchButtonACtion()
    return true
  }
}
