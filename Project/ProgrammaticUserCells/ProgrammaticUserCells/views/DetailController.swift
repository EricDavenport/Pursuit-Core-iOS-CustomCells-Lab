//
//  DetailController.swift
//  ProgrammaticUserCells
//
//  Created by Eric Davenport on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class DetailController: UIViewController {
  
  private let newView = DetailView()

  var user : User?
  
  override func loadView() {
    view = newView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .cyan
      updateUI()
    }
  
  func updateUI() {
    DispatchQueue.main.async {
      self.newView.imageView.getImage(with: (self.user?.picture.large)!) { [weak self] (result) in
        DispatchQueue.main.async {
          switch result {
          case .failure:
            self?.newView.imageView.image = UIImage(named: "mic.fill")
          case .success(let image):
            self?.newView.imageView.image = image
          }
        }
      }
    }
  }
    


}
