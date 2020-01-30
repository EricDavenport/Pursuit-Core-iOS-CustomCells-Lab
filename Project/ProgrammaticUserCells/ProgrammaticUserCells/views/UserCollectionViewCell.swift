//
//  UserCollectionViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Eric Davenport on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UserCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var birthdayLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  
  public func configureCell(_ user: User) {
    imageView.getImage(with: (user.picture.thumbnail)) { [weak self] (result) in
      DispatchQueue.main.async {
        self?.birthdayLabel.text = "Age: \(user.dob.age)"
        self?.nameLabel.text = user.name.fullname()
        self?.locationLabel.text = "\(user.location.city), \(user.location.state)"
        switch result {
        case .failure:
          self?.imageView.image = UIImage(named: "gear")
        case .success(let image):
          self?.imageView.image = image
        }
      }
      
    }
  }
  
}
