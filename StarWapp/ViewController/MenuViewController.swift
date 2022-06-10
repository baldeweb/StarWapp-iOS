//
//  MainMenuViewController.swift
//  StarWapp
//
//  Created by Trabalho on 08/06/22.
//

import Foundation
import UIKit
import SnapKit

class MenuViewController: BaseViewController {
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: GlobalColor.dark)
        return view
    }()
    
    private lazy var toolbar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: GlobalColor.black)
        return view
    }()
    
    open lazy var toolbarImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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
        populateData()
    }
    
    private func addViewComponents() {
        addTableList()
        addToolbar()
        view.addSubview(container)
    }
    
    private func addToolbar() {
        toolbarImage.image = UIImage(named: "logo_starwars")
        toolbar.addSubview(toolbarImage)
        container.addSubview(toolbar)
    }
    
    private func addTableList() {
        tableList = TableListViewController(listItemsMenu: listItemsMenu)
        container.addSubview(tableList.view)
    }
    
    private func setupConstraints() {
        toolbar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(60)
        }
        
        toolbarImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(55)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        tableList.view.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottomMargin).offset(48)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    private func populateData() {
    }
    
    private func openMenuItem(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: true)
    }
}
