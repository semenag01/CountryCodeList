import Foundation

public class CountryCodeList {
  public enum CountryCodeError: Error {
    case countryFileNotFound
  }
  
  public private (set) var countries: [Country]
  
  public init(locale: Locale = .autoupdatingCurrent, preorderCountries: [String] = []) throws {
    let decoder = JSONDecoder()
    let bundle: Bundle = Bundle.module
    guard let url = bundle.url(forResource: "countries", withExtension: "json") else {
      throw CountryCodeError.countryFileNotFound
    }
    let data = try Data(contentsOf: url)
    let list = try decoder.decode([String: String].self, from: data)
    let countries = list
      .map { Country(phoneCode: $1,
                     code: $0,
                     name: locale.localizedString(forRegionCode: $0)!) }
      .sorted { $0.name.compare($1.name, locale: locale) == .orderedAscending }
    let preodred = preorderCountries.compactMap { (code) in
      countries.first {$0.code == code }
    }
    self.countries = preodred
    self.countries.append(contentsOf: countries.filter { !preorderCountries.contains($0.code) })
  }
  
  public convenience init(countryCode: String) throws {
    try self.init(locale: Locale(identifier: countryCode))
  }
}
