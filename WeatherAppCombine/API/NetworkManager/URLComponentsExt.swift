import Foundation
import Combine


//Source: https://medium.com/swift2go/simplest-networking-layer-in-ios-58193fe562c8

public extension URLComponents {
    init(scheme: String = "https",//This will be same for most of the apps we work on
         host: String,//This we need to change with respect to the client
         path: String,//custom path unique for every request
         queryItems: [URLQueryItem]? = nil) {//this is where you provide the request body
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}
