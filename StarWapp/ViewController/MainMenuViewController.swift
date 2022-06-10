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
    
    private var tableList: TableListViewController!
    
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
                                                        controller: nil),
                                                    ItemMenu(
                                                        title: MenuStrings.findCharacters,
                                                        image: UIImage(named: "ic_characters")!,
                                                        bgColor: GlobalColor.white,
                                                        controller: nil),
                                                    ItemMenu(
                                                        title: MenuStrings.findRandom,
                                                        image: UIImage(named: "ic_darthvader")!,
                                                        bgColor: GlobalColor.yellow,
                                                        controller: nil),
                                                    ItemMenu(
                                                        title: MenuStrings.settings,
                                                        image: UIImage(named: "ic_settings")!,
                                                        bgColor: GlobalColor.white,
                                                        controller: nil),
                                                    ItemMenu(
                                                        title: MenuStrings.playSong,
                                                        image: UIImage(named: "ic_music")!,
                                                        bgColor: GlobalColor.white,
                                                        controller: nil)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewComponents()
        setupConstraints()
    }
    
    private func addViewComponents() {
        addTableList()
        view.addSubview(container)
    }
    
    private func addTableList() {
        tableList = TableListViewController(listItemsMenu: listItemsMenu)
        container.addSubview(tableList.view)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        tableList.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func openMenuItem(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: true)
    }
}
