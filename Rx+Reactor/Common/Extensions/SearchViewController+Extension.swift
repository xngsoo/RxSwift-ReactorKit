//
//  SearchViewController+Extension.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import UIKit

extension SearchViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("🟦 [DataSource] imageURLs.count:", imageURLs.count)
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        let imageURL = imageURLs[indexPath.item]
        print("🟪 [DataSource] cellForItemAt imageURL:", imageURL)
        cell.configure(with: imageURL)
        return cell
    }
}
