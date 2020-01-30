//
//  DetailView.swift
//  ProgrammaticUserCells
//
//  Created by Eric Davenport on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailView: UIView {

  public lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .black
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    imageViewSetup()
  }
  
  private func imageViewSetup() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
      imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -160)
    ])
  }

}


//struct User: Codable {
//let gender: String
//let name: Name
//let location: Location
//let email: String
//let dob: BirthdayInfo
//let phone: String
//let cell: String
//let picture: UserImageInfo
