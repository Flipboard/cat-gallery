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
    
    var task: URLSessionDataTask!
    var dlTask: URLSessionDownloadTask!
    var session: URLSession!
    
    init(){
        
        session = URLSession.shared
    }
    
    let baseUrlString = Constants.NetworkManager.BaseUrlString

    func getAllTags(completion:@escaping (Bool, [String]?, String?) -> ()) {

        let url:URL = URL(string: baseUrlString + Endpoint.tags.rawValue)!
        
        print(url)
        
        task = session.dataTask(with:url){ data, response, error in
            
            if (error != nil) {
                
                completion(false, nil, error?.localizedDescription)
            }
            
            if let data = data {
            
                let result = try? JSONSerialization.jsonObject(with: data,
                                                               options: []) as? [String]
            
                completion(true, result!, nil)
            
            } else {
                
                completion(false, nil, Constants.Error.NoDataReturned)
            }
        }
        task.resume()
    }

    func getCats(tag:String, completion:@escaping (Bool, [Cat]?, String?) -> ()) {
        
        //Get url
        let url:URL = URL(string: baseUrlString + Endpoint.cats.rawValue + Constants.NetworkManager.TagQuery + "\(tag)")!
        
            //Start network data transfer task
        task = session.dataTask(with: url) { data, response, error in
            
            if (error != nil) {
                
                completion(false, nil, error?.localizedDescription)
            }
                
            //If we have data parse it
            if let data = data {
                
                do {
                        
                    let decodedData = try JSONDecoder().decode(Cats.self,
                                                               from: data)
                        //return parsed parsed
                        completion(true, decodedData, nil)
                        
                    } catch {
                        //retrun error
                        completion(false, nil, Constants.Error.JSONParse)
                    }
                } else {
                    //return Error
                    completion(false, nil, Constants.Error.NoDataReturned)
                }
        }
        task.resume()
    }

    func getCatImage(id:String, completion: @escaping(Bool, UIImage?, String?) -> ()) {
        
        let urlStr = baseUrlString + Endpoint.cat.rawValue + "/\(id)"
        let url:URL = URL(string: urlStr)!
        
        if let image = ImageCache.shared.object(forKey: urlStr as NSString) {
            
            DispatchQueue.main.async {
            
                completion(true, image, nil)
            }
        } else {
            
            dlTask = session.downloadTask(with: url, completionHandler: { (location, response, error) in
            
                if let data = try? Data(contentsOf: url) {
                
                    if let image = UIImage(data: data){
                    
                        ImageCache.shared.setObject(image, forKey: urlStr as NSString)
                        
                        DispatchQueue.main.async {
                        
                            completion(true, image, nil)
                        }
                    } else {
                        
                        completion(false, nil, Constants.Error.ImageParse)
                    }
                }
            })
            dlTask.resume()
        }
    }
    
    func cancelTask() {
        
        task.cancel()
    }
    
//    func cancelDLTask() {
//        
//        dlTask.cancel()
//    }
}
