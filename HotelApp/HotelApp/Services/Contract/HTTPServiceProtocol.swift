//
//  HTTPServiceProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Combine

protocol HTTPServiceProtocol {
  func loadData<T: Decodable>(from urlString: String, decodeType: T.Type) -> AnyPublisher<T, Error>
}
