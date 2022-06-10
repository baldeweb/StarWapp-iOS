//
//  MainMenuViewController+UITableViewDataSource.swift
//  StarWapp
//
//  Created by Trabalho on 10/06/22.
//

import Foundation
import UIKit
import SnapKit

class TableListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.backgroundColor = UIColor.init(named: GlobalColor.dark)
        view.axis = .vertical
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: GlobalColor.dark)
        tv.separatorStyle = .none
        tv.indicatorStyle = .default
        tv.delegate = self
        tv.dataSource = self
        tv.register(ListItemMenuCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private var listItemsMenu = Array<ItemMenu>()
    private let cellId = "cellId"
    
    init(listItemsMenu: Array<ItemMenu>) {
        self.listItemsMenu = listItemsMenu
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        addViewComponents()
        setupConstraints()
    }
    
    private func addViewComponents() {
        container.addSubview(tableView)
        view.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top)
            make.bottom.equalTo(container.snp.bottom)
            make.leading.equalTo(container.snp.leading)
            make.trailing.equalTo(container.snp.trailing)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 75))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = MenuStrings.menuTitle
        label.font = UIFont.Krungthep(size: 24)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = hexStringToUIColor(hex: GlobalColor.neon_green)
        headerView.addSubview(label)
        
        headerView.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension + 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listItemsMenu[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListItemMenuCell
        cell.container.backgroundColor = hexStringToUIColor(hex: item.bgColor)
        cell.icon.image = item.image
        cell.titleItem.text = item.title
        cell.titleItem.textColor = hexStringToUIColor(hex: GlobalColor.dark)
        cell.backgroundColor = UIColor.init(named: GlobalColor.dark)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        let option = listItemsMenu[item.row]
        print("LOG >> Item: \(String(describing: listItemsMenu[item.row].title))")
        
        switch(option.title) {
        case MenuStrings.settings,
            MenuStrings.playSong:
            navigateTo(option.controller!)
            break
        default:
            openMenuItem(option.controller!)
            break
        }
        
        //openMenuItem(listItemsMenu[item.row].controller!)
    }
    
    private func openMenuItem(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: true)
    }
    
    private func navigateTo(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .pageSheet
        self.present(screen, animated: true)
    }
}
