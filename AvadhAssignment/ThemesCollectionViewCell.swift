//
//  ThemesCollectionViewCell.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell : UICollectionViewCell {
    
    let coverView : UIView = {
        let view = UIView()
        view.setCustomCornerRadius(radius: 8, borderColor: .lightGray, borderWidth: 1)
        return view
    }()
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .regularSmallFont
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    let imgView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(coverView)
        coverView.addSubview(imgView)
        coverView.addSubview(titleLabel)
        
        coverView.fullFillOnSuperView(padding: .init(top: 15, left: 15, bottom: -15, right: -15))
        imgView.anchors(top: coverView.topAnchor, left: coverView.leftAnchor, right: coverView.rightAnchor, bottom: nil, padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        titleLabel.anchors(top: imgView.bottomAnchor, left: coverView.leftAnchor, right: coverView.rightAnchor, bottom: coverView.bottomAnchor)
    }
    
}
