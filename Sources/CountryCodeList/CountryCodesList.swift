import Foundation

public class CountryCodeList {
  public enum CountryCodeError: Error {
    case countryFileNotFound
  }
  
//  private var list: [String: String]
  public private (set) var countries: [Country]
  
  public init(locale: Locale = .autoupdatingCurrent) throws {
    let decoder = JSONDecoder()
    let bundle: Bundle = Bundle.module
    guard let url = bundle.url(forResource: "countries", withExtension: "json") else {
      throw CountryCodeError.countryFileNotFound
    }
    let data = try Data(contentsOf: url)
    let list = try decoder.decode([String: String].self, from: data)
    countries = list
      .map { Country(phoneCode: $1,
                     code: $0,
                     name: locale.localizedString(forRegionCode: $0)!) }
      .sorted { $0.name > $1.name }
  }
  
  public convenience init(countryCode: String) throws {
    try self.init(locale: Locale(identifier: countryCode))
  }
}
