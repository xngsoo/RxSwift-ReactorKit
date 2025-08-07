//
//  SearchBar+Extension.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import UIKit

extension SearchViewController {
    
    /// 검색어를 입력할 때마다 실행
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    /// 검색 버튼을 클릭했을 때 실행
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        //search(query: searchBar.text ?? "")
        searchBar.text = ""
        
        collectionView.setContentOffset(.zero, animated: true)
    }
    
    /// 취소 버튼을 클릭했을 때 실행
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    /// 검색어 입력이 시작될 때 실행
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    /// 검새거 입력이 끝났을 때 실행
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
}
