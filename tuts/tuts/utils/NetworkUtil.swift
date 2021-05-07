//
//  NetworkUtil.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI
import Combine

class NetworkUtil {
    let API_KEY: String = "806d00dde3ec9558678e665b189f60de"
    
    static func getData<T: Codable>(urlString: String) -> AnyPublisher<T, Error> {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let data = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        return data
    }
    
    static func getDataImage(urlString: String) -> AnyPublisher<UIImage?, Error> {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let data = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> UIImage? in
                return UIImage(data: data)
            }
            .eraseToAnyPublisher()
        return data
    }
}
