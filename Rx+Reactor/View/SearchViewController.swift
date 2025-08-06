//
//  ViewController.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import UIKit
import FlexLayout
import PinLayout
import ReactorKit
import RxCocoa

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let rootContainer = UIView()
    private let searchBar = UISearchBar()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    var imageURLs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSearchBar()
        setupCollectionView()
        setupFlexLayout()
        
        view.addSubview(rootContainer)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.searchBarStyle = .minimal
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.keyboardDismissMode = .onDrag
        
        // Cell 행, 열의 간격 및 크기
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let numberOfColumns: CGFloat = 3 // 한줄 당 cell 개수
            let spacing: CGFloat = 2 // cell 간격
            let totalSpacing = spacing * (numberOfColumns - 1)
            let inset: CGFloat = 10 // collectionview 좌우 inset
            let availableWidth = view.bounds.width - inset * 2 - totalSpacing
            let itemWidth = floor(availableWidth / numberOfColumns)
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        }
        
    }
    
    func setupFlexLayout() {
        rootContainer.flex.direction(.column)
            .define { flex in
                flex.addItem(searchBar)
                    .width(100%).height(80)
                flex.addItem(collectionView)
                    .width(100%)
                    .grow(1)
            }
    }
    
    //ReactorKit 적용으로 직접 호출하는 코드
    func search(query: String) {
        KakaoAPI.searchImages(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResult):
                    // documents 배열에서 imageURL만 추출
                    self?.imageURLs = searchResult.documents.map { $0.image_url ?? "" }
                    self?.collectionView.reloadData()
                    print("배열개수: \(self?.imageURLs.count)")
                case .failure(let error):
                    print("API Error: \(error)")
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rootContainer.pin.all(view.safeAreaInsets)
        rootContainer.flex.layout()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
