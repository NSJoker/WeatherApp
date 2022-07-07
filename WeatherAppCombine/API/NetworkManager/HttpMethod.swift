import Foundation

/// Valid HTTP methods, we are no using all of these
public enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete  
    case custom(String)
    
    public var rawValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        case .custom(let method):
            return method
        }
    }
}
