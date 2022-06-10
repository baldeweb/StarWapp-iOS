//
//  MainMenuViewController.swift
//  StarWapp
//
//  Created by Trabalho on 08/06/22.
//

import Foundation
import UIKit
import SnapKit

class MainMenuViewController: BaseViewController {
    private lazy var scrollView = UIScrollView()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: GlobalColor.dark)
        return view
    }()
    
    private lazy var content: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.backgroundColor = UIColor.init(named: GlobalColor.dark)
        view.axis = .vertical
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: GlobalColor.dark)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.indicatorStyle = .default
        tv.register(ListItemMenuCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private let cellId = "cellId"
    
    private let listItemsMenu = Array<ItemMenu>(arrayLiteral:
                                                    ItemMenu(
                                                        title: MenuStrings.findStarships,
                                                        image: UIImage(named: "ic_starships")!,
                                                        bgColor: GlobalColor.white,
                                                        controller: nil),
                                                ItemMenu(
                                                    title: MenuStrings.findPlanets,
                                                    image: UIImage(named: "ic_planets")!,
                                                    bgColor: GlobalColor.white,
                                                    controller: nil)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        addViewComponents()
        setupConstraints()
    }
    
    private func addViewComponents() {
        view.addSubview(container)
        container.addSubview(content)
        content.addSubview(tableView)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top)
            make.bottom.equalTo(container.snp.bottom)
            make.leading.equalTo(container.snp.leading)
            make.trailing.equalTo(container.snp.trailing)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(content.snp.top)
            make.bottom.equalTo(content.snp.bottom)
            make.leading.equalTo(content.snp.leading)
            make.trailing.equalTo(content.snp.trailing)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    private func openMenuItem(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: true)
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListItemMenuCell
        cell.titleItem.textColor = hexStringToUIColor(hex: GlobalColor.dark)
        cell.titleItem.text = listItemsMenu[indexPath.row].title
        cell.retangle.backgroundColor = hexStringToUIColor(hex: listItemsMenu[indexPath.row].bgColor)
        cell.backgroundColor = UIColor.init(named: GlobalColor.dark)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        print("LOG >> Item: \(String(describing: listItemsMenu[item.row].title))")
        
        //openMenuItem(listItemsMenu[item.row].controller!)
    }
}
