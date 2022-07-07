import Combine
import Foundation

////Source: https://medium.com/swift2go/simplest-networking-layer-in-ios-58193fe562c8
///
public extension URLSession {
    
    func fetch<Response: Decodable>(for request: URLRequest, with type: Response.Type) -> AnyPublisher<Response, Error> {
        dataTaskPublisher(for: request)
            .mapError({ error in
                    return error
            })
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

