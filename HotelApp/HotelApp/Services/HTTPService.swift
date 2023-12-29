//
//  HTTPService.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation
import Combine

class HTTPService: HTTPServiceProtocol {

  private var cancellables = Set<AnyCancellable>()
  private let decoder = JSONDecoder()

  init() {
    decoder.keyDecodingStrategy = .convertFromSnakeCase
  }

  func loadData<T: Decodable>(from urlString: String, decodeType: T.Type) -> AnyPublisher<T, Error> {
    guard let url = URL(string: urlString) else {
      return Fail(error: NSError(domain: "HTTPService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Некорректный URL"]))
        .eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: T.self, decoder: decoder)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

}
