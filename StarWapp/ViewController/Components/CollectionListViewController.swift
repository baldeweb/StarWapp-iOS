//
//  CollectionListViewController.swift
//  StarWapp
//
//  Created by Trabalho on 10/06/22.
//

import Foundation
import UIKit
import SnapKit

class CollectionListViewController: BaseViewController, UICollectionViewDataSource {
    private var listItemsMenu: Array<ItemMenu> = Array<ItemMenu>()
    
    init(listItemsMenu: Array<ItemMenu>) {
        self.listItemsMenu = listItemsMenu
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Return elements count that must be displayed in table
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItemsMenu.count
    }
    
    // Instantiate or reused (depend on position and cell type in table view), configure cell element and return it for displaying on table
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = listItemsMenu[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridItemMenuCell
        cell.container.backgroundColor = hexStringToUIColor(hex: item.bgColor)
        cell.icon.image = item.image
        cell.titleItem.text = item.title
        cell.titleItem.textColor = hexStringToUIColor(hex: GlobalColor.dark)
        cell.backgroundColor = UIColor.init(named: GlobalColor.dark)
        let tapped = GridItemTapGesture.init(target: self, action: #selector(tap))
        tapped.item = item
        cell.addGestureRecognizer(tapped)
        return cell
    }
    
    @objc func tap(_ sender: GridItemTapGesture) {
        guard let item = sender.item else { return }
        print("LOG >> Item: \(String(describing: item.title))")
        
        switch(item.title) {
        case MenuStrings.settings,
            MenuStrings.playSong:
            navigateTo(item.controller!)
            break
        default:
            openMenuItem(item.controller!)
            break
        }
        
        openMenuItem(item.controller!)
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
