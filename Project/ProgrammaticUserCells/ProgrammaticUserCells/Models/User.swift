import Foundation

struct ResultsWrapper: Codable {
  let results: [User]
}

struct User: Codable {
  let gender: String
  let name: Name
  let location: Location
  let email: String
  let dob: BirthdayInfo
  let phone: String
  let cell: String
  let picture: UserImageInfo
  
  static func getUsers(from jsonData: Data) -> [User] {
    do {
      let resultsWrapper = try JSONDecoder().decode(ResultsWrapper.self, from: jsonData)
      return resultsWrapper.results
    } catch {
      print(error)
      return []
    }
  }
}

struct Name: Codable {
  let title: String
  let first: String
  let last: String
 // let fullName = "\(title) \(first) \(last)"
  func fullname() -> String {
    return "\(title) \(first) \(last)"
  }
}

struct Location: Codable {
  let street: Street
  let city: String
  let state: String
  let postcode: String
  
  enum CodingKeys: String, CodingKey {
    case street, city, state, postcode
  }
  
  //https://stackoverflow.com/questions/47935705/using-codable-with-key-that-is-sometimes-an-int-and-other-times-a-string
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    street = try container.decode(Street.self, forKey: .street)
    city = try container.decode(String.self, forKey: .city)
    state = try container.decode(String.self, forKey: .state)
    if let postCodeInt = try? container.decode(Int.self, forKey: .postcode) {
      postcode = String(postCodeInt)
    } else {
      postcode = try container.decode(String.self, forKey: .postcode)
    }
  }
}

struct Street: Codable {
  let number: Int
  let name: String
}

struct BirthdayInfo: Codable {
  let date: String
  let age: Int
  
  func removeTimeStamp() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    dateFormatter.timeStyle = .none
    let dateFromString : Date = dateFormatter.date(from: date) ?? Date()
    let newDate = dateFormatter.string(from: dateFromString)
    
    return newDate
  }
  
  
//  let date = "2016-02-10 00:00:00"
//   let dateFormatter = NSDateFormatter()
//
//   dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
//   let dateFromString : NSDate = dateFormatter.dateFromString(date)!
//   dateFormatter.dateFormat = "dd-MM-yyyy"
//   let datenew= dateFormatter.stringFromDate(dateFromString)
//
//     print(datenew)
}

struct UserImageInfo: Codable {
  let large: String
  let medium: String
  let thumbnail: String
}
