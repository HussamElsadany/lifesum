//
//  Network.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//

import Foundation

// Simple Network Class to avoid using pods like Alamofire.

enum ServiceError: Error {
    case noData
}

public class NetworkClient {

    public static var shared = NetworkClient()

    // MARK: Network requests
    public func get(_ url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        executeRequest(url, method: "GET", payload: nil, completionHandler: completionHandler)
    }

    public func post(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        executeRequest(url, method: "POSt", payload: payload, completionHandler: completionHandler)
    }

    public func put(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        executeRequest(url, method: "PUT", payload: payload, completionHandler: completionHandler)
    }

    public func delete(_ url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        executeRequest(url, method: "DELETE", payload: nil, completionHandler: completionHandler)
    }

    func executeRequest(_ url: URL, method: String, payload: Data?, completionHandler:@escaping (Result<Data, Error>) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = payload
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            guard let data = data else {
                completionHandler(.failure(ServiceError.noData))
                return
            }
            completionHandler(.success(data))
        }.resume()
    }
}
