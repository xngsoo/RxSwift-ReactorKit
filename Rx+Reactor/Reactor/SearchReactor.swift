//
//  SearchReactor.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import ReactorKit
import RxCocoa

//final class SearchReactor: Reactor {
//    
//    enum Action {
//        case updateQuery(String)
//        case search(String)
//    }
//    
//    enum Mutation {
//        case setImageURLs([String])
//        case setQuery(String)
//        case setLoading(Bool)
//        case setError(Error?)
//    }
//    
//    struct State {
//        var imageURLs: [String] = []
//        var query: String = ""
//        var isLoading = false
//        var error: Error?
//    }
//    
//    let initialState: State = State()
//    
//    func mutate(action: Action) -> Observable<Mutation> {
//        switch action {
//        case .updateQuery(let query):
//            return Observable.concat([
//                Observable.just(.setQuery(query)),
//                Observable.just(.setLoading(true)),
//                KakaoAPI.searchImagesObservable(query: query)
//                    .do(onNext: { url in
//                        print("URL 배열: \(url)")
//                    })
//                    .map {.setImageURLs($0)}
//                    .catch { Observable.just(.setError($0))},
//                Observable.just(.setLoading(false))
//            ])
//        case .search(let query):
//            return Observable.concat([
//                Observable.just(.setLoading(true)),
//                KakaoAPI.searchImagesObservable(query: query)
//                    .map { .setImageURLs($0)}
//                    .catch { Observable.just(.setError($0))},
//                Observable.just(.setLoading(false))
//            ])
//        }
//        
//        func reduce(state: State, mutation: Mutation) -> State {
//            var newState = state
//            switch mutation {
//            case .setImageURLs(let urls):
//                newState.imageURLs = urls
//                newState.error = nil
//            case .setQuery(let query):
//                newState.query = query
//            case .setLoading(let isLoading):
//                newState.isLoading = isLoading
//            case .setError(let error):
//                newState.error = error
//                newState.imageURLs = []
//            }
//            return newState
//        }
//    }
//}
