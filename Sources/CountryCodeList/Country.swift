import Foundation

public struct Country {
  internal init(phoneCode: String, code: String, name: String) {
    self.phoneCode = phoneCode
    self.code = code
    self.name = name
  }
  
  public let phoneCode: String
  public let code: String
  public let name: String
}

public extension Country {
  var flag: String {
    code
      .unicodeScalars
      .map({ 127397 + $0.value })
      .compactMap(UnicodeScalar.init)
      .map(String.init)
      .joined()
  }
}
