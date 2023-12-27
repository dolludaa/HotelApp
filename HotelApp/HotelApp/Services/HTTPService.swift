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

  func loadData<T: Decodable>(from urlString: String, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(.failure(NSError(domain: "HTTPService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Некорректный URL"])))
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: T.self, decoder: decoder)
      .receive(on: DispatchQueue.main)
      .sink { completionResult in
        if case let .failure(error) = completionResult {
          completion(.failure(error))
        }
      } receiveValue: { decodedData in
        completion(.success(decodedData))
      }
      .store(in: &cancellables)
  }
}
