//
//  ImageCell.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout
import Kingfisher

class ImageCell: UICollectionViewCell {
    
    public let identifier = "ImageCell"
    let rootContainer = UIView()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(rootContainer)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        rootContainer.flex.define { flex in
            flex.addItem(imageView)
                .width(100%).height(100%)
        }
    }
    
    func configure(with urlString: String) {
        //네트워크 이미지 로드: Kingfisher 사용
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url,
                                  placeholder: UIImage(named: "placeholder"),
                                  options: [.transition(.fade(0.2))]
            )
        } else {
            imageView.image = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootContainer.pin.all()
        rootContainer.flex.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
