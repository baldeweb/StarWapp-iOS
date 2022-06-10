//
//  HomeViewModel.swift
//  StarWapp
//
//  Created by Wallace Baldenebre on 06/06/22.
//

import Foundation

class MenuViewModel: BaseViewModel {
    var peopleResult: (PeopleResponse) -> Void = {_ in }
    
    func getPeople(itemNumber: Int) {
        let endpoint = EndpointsStrings.people + String(describing: itemNumber)
        service.getData(endpoint: endpoint, resultType: PeopleResponse.self) { (response) in
            guard let data = response else { return }
            self.peopleResult(data)
        }
    }
}
