//
//  NetworkManager.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import Foundation
import Combine

class NetworkManager {

    // using localized error, we can give it custom localized descriptions.
    enum NetworkError: LocalizedError {
        case badURLResponse
        case unknown

        var errorDescription: String? {
            switch self {
            case .badURLResponse: return "[🔥] Bad response from URL"
            case .unknown: return "[‼️] Unknown error occured"
            }
        }
    }

    // why static? if it was not static, we would have to initialize an instance if the class NetworkManager, in order to access this download function. By static, we will not need to initialize the class, we can directly use NetworkManager.download()
    static func download(url: URL) -> AnyPublisher<Data, Error> {

        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default)) // it is default by default, but still just to be sure
            .tryMap({ try handleURLResponse(output: $0)})
            .receive(on: DispatchQueue.main) // return to main thread
            .eraseToAnyPublisher()
    }

    // Now, you can reuse this function for situations like if we needed to create a separate download function for a different task
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
//            throw URLError(.badServerResponse)
            throw NetworkError.badURLResponse
        }

        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }

}
