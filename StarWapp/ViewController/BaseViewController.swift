//
//  ViewController.swift
//  StarWapp
//
//  Created by Wallace Baldenebre on 06/06/22.
//

import UIKit

class BaseViewController: UIViewController {
    private let viewModel = MenuViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPeople(itemNumber: 1)
        initObservers()
    }

    private func initObservers() {
        viewModel.peopleResult = { (response: PeopleResponse) -> Void in
            print("Eye Color: \(String(describing: response.eyeColor ?? ""))")
        }
    }
}

