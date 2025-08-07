//
//  SearchReactor.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import ReactorKit
import RxCocoa

class SearchReactor: Reactor {
    
    enum Action {
        case updateQuery(String)
    }
    
    enum Mutation {
        case setImageURLs([String])
        case setQuery(String)
        case setLoading(Bool)
        case setError(Error?)
    }
    
    struct State {
        var imageURLs: [String] = []
        var query: String = ""
        var isLoading = false
        var error: Error?
    }
    
    let initialState: State = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateQuery(let query):
            print("🔵 [Reactor] updateQuery 액션: \(query)")
            guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                print("⚪️ [Reactor] 빈 쿼리 입력됨, 이미지 비움")
                return Observable.just(.setImageURLs([]))
            }
            return Observable.concat([
                Observable.just(.setQuery(query)),
                Observable.just(.setLoading(true)),
                KakaoAPI.searchImagesObservable(query: query)
                    .do(onNext: { urls in
                        print("🟢 [Reactor] API 응답 URL 배열:", urls)
                    }, onError: { error in
                        print("🔴 [Reactor] API 에러:", error)
                    })
                    .map {.setImageURLs($0)}
                    .catch { Observable.just(.setError($0))},
                Observable.just(.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImageURLs(let urls):
            print("🟡 [Reactor] setImageURLs state 변경, 개수:", urls.count)
            newState.imageURLs = urls
            newState.error = nil
        case .setQuery(let query):
            print("🟠 [Reactor] setQuery state 변경:", query)
            newState.query = query
        case .setLoading(let isLoading):
            print("⚫️ [Reactor] setLoading state 변경:", isLoading)
            newState.isLoading = isLoading
        case .setError(let error):
            print("🔴 [Reactor] setError state 변경:", error as Any)
            newState.error = error
            newState.imageURLs = []
        }
        return newState
    }
}
