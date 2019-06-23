//
//  ListModuleProtocols.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

protocol ListModuleModuleInput {
	var moduleOutput: ListModuleModuleOutput? { get }
}

protocol ListModuleModuleOutput: class {
}

protocol ListModuleViewInput: class {
    func set(viewModels: [CityViewModel])
}

protocol ListModuleViewOutput: class {
    func viewDidLoad()
    func didTapAddCityButton()
}

protocol ListModuleInteractorInput: class {
    func fetchCities()
    func add(cityName: String)
}

protocol ListModuleInteractorOutput: class {
    func didLoad(cities: [City])
}

protocol ListModuleRouterInput: class {
    func showAddCity(completion: @escaping (String) -> Void)
}
