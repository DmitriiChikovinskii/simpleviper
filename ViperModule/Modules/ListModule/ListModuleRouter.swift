//
//  ListModuleRouter.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import UIKit

final class ListModuleRouter {
    var viewController: UIViewController?
}

extension ListModuleRouter: ListModuleRouterInput {
    func showAddCity(completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: "Добавить город", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: "Добавить", style: .default) { action in
            guard let text = alertController.textFields?.first?.text else {
                fatalError("фак")
            }
            completion(text)
        })

        viewController?.present(alertController, animated: true)
    }
}
