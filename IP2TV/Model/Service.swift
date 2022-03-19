//
//  Service.swift
//  IP2TV
//
//  Created by Vinicius on 17/03/22.
//

import Foundation

struct Service {

    struct Success {
        var data: Data
    }

    enum Result {
        case success(Success)
        case failure(Error)
    }

    var session: URLSession!

    init() {
        session = URLSession(configuration: URLSessionConfiguration.default)
    }

    func loadData(from url: URL,
                  completionHandler: @escaping (Result) -> Void) {

        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            let chandit = Success(
                data: data)
            completionHandler(.success(chandit))
        }

        task.resume()
    }

    func loadVideoData(from url: URL) -> URLSessionTask {
        return session.downloadTask(with: url)
    }
}
