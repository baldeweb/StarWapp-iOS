//
//  ItemMenuCell.swift
//  StarWapp
//
//  Created by Trabalho on 08/06/22.
//

import Foundation
import UIKit
import SnapKit

class ListItemMenuCell: UITableViewCell {
    open lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    open lazy var titleItem: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Krungthep(size: 16)
        label.textColor = hexStringToUIColor(hex: GlobalColor.dark)
        label.sizeToFit()
        return label
    }()
    
    open lazy var icon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        addViewComponents()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor.init(named: GlobalColor.dark)
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
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(80)
        }
        
        icon.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(10)
            make.bottom.equalTo(container.snp.bottom).inset(10)
            make.leading.equalTo(container.snp.leading).offset(16)
            make.width.lessThanOrEqualTo(60)
            make.height.lessThanOrEqualTo(60)
        }
        
        titleItem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalTo(icon.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.width.greaterThanOrEqualTo(0)
        }
    }
}
