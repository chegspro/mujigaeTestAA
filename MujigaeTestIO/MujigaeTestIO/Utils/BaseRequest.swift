//
//  BaseRequest.swift
//  MujigaeTestIO
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation

public protocol BaseRequest {
    
    associatedtype DataResponse: Codable
    
}

extension BaseRequest {
    
    func request(path: String,
                 method: HTTPMethod,
                 pathParams: [String: String]? = nil,
                 header: [String: String]? = nil,
                 completion: @escaping (BaseResult) -> Void ) {
        
        if !Reachability.isConnectedToNetwork() {
            completion(BaseResult(status: .noConnection, response: nil, message: "No network connection"))
            return
        }
        
        let baseURL = MIOConfiguration.shared.baseURL
        let strURL = baseURL + path
        guard var components = URLComponents(string: strURL) else {
            completion(BaseResult(status: .serverError, response: nil, message: "Invalid path"))
            return
        }
        
        if let params = pathParams {
            components.queryItems = params.map({ URLQueryItem(name: $0, value: $1) })
        }
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.timeoutIntervalForRequest = MIOConfiguration.shared.timeoutRequestInterval
        urlConfig.timeoutIntervalForResource = MIOConfiguration.shared.timeoutResponseInterval
        
        guard let url = components.url else {
            completion(BaseResult(status: .serverError, response: nil, message: "Invalid path"))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        log("Request : \(url)")
        
        let session = URLSession(configuration: urlConfig)
        session.dataTask(with: urlRequest) {
            (data, response, error) in
            if error != nil || response == nil {
                completion(BaseResult(status: .serverError, response: nil, message: "Can't connect to server"))
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                    let data = data,
                    let strResponse = String(data: data, encoding: .utf8)
                    else {
                        completion(BaseResult(status: .serverError, response: nil, message: "Invalid server response"))
                        return
                }
                
                self.log("Response : \(strResponse)")
                
                var baseResponse: BaseResponse?
                do {
                    baseResponse = try JSONDecoder().decode(ObjectResponse<DataResponse>.self, from: data)
                } catch {
                    do {
                        baseResponse = try JSONDecoder().decode(ArrayResponse<DataResponse>.self, from: data)
                    } catch {
                        self.log("\(error)")
                    }
                }
                
                if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 300 && baseResponse?.status == true {
                    completion(BaseResult(status: .success, response: baseResponse, message: baseResponse?.message ?? ""))
                } else if httpResponse.statusCode == 408 {
                    completion(BaseResult(status: .noConnection, response: nil, message: "Connection timeout"))
                } else {
                    completion(BaseResult(status: .serverError, response: nil, message: "Server Error"))
                }
                
            }
        }.resume()
        
    }
    
    private func log(_ string: String) {
        #if DEBUG
        if MIOConfiguration.shared.logEnabled {
            print("debug- \(string)")
        }
        #endif
    }
}

enum HTTPMethod: String {
    case POST, GET
}
