//
//  KakaoAPI.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import Alamofire
import RxSwift
import ReactorKit
import RxCocoa

struct KakaoAPI {
    static let apiKey = Secret.kakaoAPIKey
    static let baseURL = "https://dapi.kakao.com/v2/search/image"
    
    static func searchImages(query: String, page: Int = 1, completion: @escaping (Result<ImageSearchResult, Error>) -> Void) {
        let url = baseURL
        let params: [String: Any] = [
            "query": query,
            "page": page,
            "size": 80
        ]
        let headers: [String: String] = [
            "Authorization": apiKey
        ]
        
        APIService.shared.request(url: url,
                                  params: params,
                                  headers: HTTPHeaders(headers),
                                  completion: completion)
    }
}
extension KakaoAPI {
    
    static func searchImagesObservable(query: String, page: Int = 1) -> Observable<[String]> {
        return Observable.create { observer in
            KakaoAPI.searchImages(query: query, page: page) { result in
                switch result {
                case .success(let searchResult):
                    let urls = searchResult.documents.compactMap { $0.image_url }
                    observer.onNext(urls)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

