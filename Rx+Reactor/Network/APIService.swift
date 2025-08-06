//
//  APIService.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    private init() {}
    
    @discardableResult
    func request<T: Decodable>(url: URLConvertible,
                               method: HTTPMethod = .get,
                               params: Parameters? = nil,
                               encoding: ParameterEncoding = URLEncoding.default,
                               headers: HTTPHeaders,
                               completion: @escaping ( Result<T, Error> ) -> Void ) -> DataRequest {
        return AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                    case .success(let value):
                        completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
