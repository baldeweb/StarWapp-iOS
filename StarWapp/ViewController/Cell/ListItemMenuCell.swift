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
    private lazy var container: UIView = {
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
    
    private lazy var contentItem: UIView = {
        let view = UIView()
        return view
    }()
    
    open lazy var retangle: UIView = {
        let view = UIView()
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
        makeContentItem()
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor.init(named: GlobalColor.dark)
    }
    
    private func makeContentItem() {
        makeRetangle()
    }
    
    private func makeRetangle() {
        retangle.layer.cornerRadius = 5
        retangle.layer.masksToBounds = true
    }
    
    private func addViewComponents() {
        retangle.addSubview(titleItem)
        contentItem.addSubview(retangle)
        container.addSubview(contentItem)
        contentView.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentItem.snp.makeConstraints { make in
            make.top.equalTo(container).offset(5)
            make.bottom.equalTo(container).inset(5)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container).inset(20)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
        
        retangle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(70)
        }
        
        titleItem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
    }
}
