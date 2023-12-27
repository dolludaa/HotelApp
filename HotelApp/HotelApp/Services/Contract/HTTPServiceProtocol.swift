//
//  HTTPServiceProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol HTTPServiceProtocol {
  func loadData<T: Decodable>(from urlString: String, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
