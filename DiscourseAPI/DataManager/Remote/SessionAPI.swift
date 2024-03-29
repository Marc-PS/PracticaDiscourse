//
//  SessionAPI.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 17/1/21.
//

import Foundation
import UIKit

enum SessionAPIError: Error {
    case apiError(ApiError)
    case httpError(Int)
}

final class SessionAPI {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func send<T: APIRequest>(request: T, completion: @escaping(Result<T.Response?, Error>) -> ()) {
        let request = request.requestWithBaseURL()
        
        let task = session.dataTask(with: request) { data, response, error in
            // Early exit si la respuesta tiene código de error
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(ApiError.self, from: data)
                        DispatchQueue.main.async {
                            completion(.failure(SessionAPIError.apiError(model)))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(SessionAPIError.httpError(httpResponse.statusCode)))
                    }
                }
                return
            }

            // Si vuelven datos, los intentamos decodificar
            if let data = data, data.count > 0 {
                do {
                    let model = try JSONDecoder().decode(T.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                // Retornamos en el caso success
                DispatchQueue.main.async {
                    completion(.success(nil))
                }
            }
        }
        task.resume()
        
    }
    
    func fetchImage(imageURL: URL, completion: @escaping (_ image: UIImage)-> ()) {
        
        DispatchQueue.global(qos: .utility).async {
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                   
                }
            }
        }
        
    }
}

struct ApiError: Codable {
    let action: String?
    let errors: [String]?
}


