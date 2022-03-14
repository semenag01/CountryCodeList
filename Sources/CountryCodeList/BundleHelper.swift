import Foundation

#if !SPM

private class BundleExtractor { }

extension Bundle {
  static var module: Bundle { Bundle(for: BundleExtractor.self) }
}

#endif

