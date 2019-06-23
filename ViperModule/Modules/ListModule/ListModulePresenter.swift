//
//  ListModulePresenter.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

final class ListModulePresenter {
    weak var view: ListModuleViewInput?
    weak var moduleOutput: ListModuleModuleOutput?

    private let router: ListModuleRouterInput
    private let interactor: ListModuleInteractorInput

    init(router: ListModuleRouterInput, interactor: ListModuleInteractorInput) {
        self.router = router
        self.interactor = interactor
    }


}

extension ListModulePresenter: ListModuleModuleInput {
}

extension ListModulePresenter: ListModuleViewOutput {
    func viewDidLoad() {
        self.interactor.fetchCities()
    }

    func didTapAddCityButton() {
        self.router.showAddCity { [weak self] cityName in
            self?.interactor.add(cityName: cityName)
        }
    }
}

extension ListModulePresenter: ListModuleInteractorOutput {
    func didLoad(cities: [City]) {
        let viewModels = self.makeViewModels(cities: cities)
        self.view?.set(viewModels: viewModels)
    }
}

private extension ListModulePresenter {
    func makeViewModels(cities: [City]) -> [CityViewModel] {
        return cities.map {
            CityViewModel(name: $0.name)
        }
    }
}