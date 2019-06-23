//
//  ListModuleInteractor.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

final class ListModuleInteractor {
    weak var output: ListModuleInteractorOutput?

    private var cities: [City] = [
        City(name: "Moscow"),
        City(name: "Paris"),
        City(name: "Novosibirsk"),
        City(name: "New-York")
    ]
}

extension ListModuleInteractor: ListModuleInteractorInput {
    func fetchCities() {
        self.output?.didLoad(cities: self.cities)
    }

    func add(cityName: String) {
        self.cities.append(City(name: cityName))
        self.output?.didLoad(cities: self.cities)
    }
}
