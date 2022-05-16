import UIKit

enum NetworkError: Error {
    case badUrl
    case noData
    case badData
    case generalError(message: String)
}

enum Endpoint: String {
    case tags = "/api/tags"
    case cats = "/api/cats"
    case cat = "/cat"
}

enum QueryItem: String {
    case tags
}

final class NetworkManager {
    let baseUrlString = "https://cataas.com"

    func getAllTags() {

    }

    func getCats() {
    }

    func getCatImage() {
        
    }
}
