//
//  GridItemMenuCell.swift
//  StarWapp
//
//  Created by Trabalho on 10/06/22.
//

import Foundation
import UIKit
import SnapKit

class GridItemMenuCell: UICollectionViewCell {
    open lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    open lazy var titleItem: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Krungthep(size: 12)
        label.textColor = hexStringToUIColor(hex: GlobalColor.dark)
        label.sizeToFit()
        return label
    }()
    
    open lazy var icon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
        self.addViewComponents()
        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor.init(named: GlobalColor.white)
    }
    
    private func addViewComponents() {
        container.addSubview(icon)
        container.addSubview(titleItem)
        contentView.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().inset(6)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(80)
        }
        
        icon.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(10)
            make.leading.equalTo(container.snp.leading).offset(8)
            make.trailing.equalTo(container.snp.trailing).inset(8)
            make.width.lessThanOrEqualTo(40)
            make.height.lessThanOrEqualTo(40)
        }
        
        titleItem.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalTo(icon.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.width.greaterThanOrEqualTo(0)
        }
    }
}
