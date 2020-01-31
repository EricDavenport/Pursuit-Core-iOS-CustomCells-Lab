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
  
  public lazy var emailLabel: UILabel = {
    let label = UILabel()
    label.text = "email"
    label.backgroundColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  public lazy var locationLabel: UILabel = {
    let label = UILabel()
    label.text = "location"
    label.backgroundColor = .brown
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  public lazy var genderLabel: UILabel = {
    let label = UILabel()
    label.text = "gender"
    label.backgroundColor = .purple
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  public lazy var dobLabel: UILabel = {
    let label = UILabel()
    label.text = "dob"
    label.backgroundColor = .orange
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  public lazy var phoneLabel: UILabel = {
    let label = UILabel()
    label.text = "phone"
    label.backgroundColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  public lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor = .orange
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
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
    stackViewSetup()
  }
  
  
  private func imageViewSetup() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
     // imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -160),
     // imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
    
    imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
//    imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
  }
  
  private func stackViewSetup() {
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.spacing = 15
    stackView.addArrangedSubview(emailLabel)
    stackView.addArrangedSubview(locationLabel)
    stackView.addArrangedSubview(genderLabel)
    stackView.addArrangedSubview(dobLabel)
    stackView.addArrangedSubview(phoneLabel)
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
      stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
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
