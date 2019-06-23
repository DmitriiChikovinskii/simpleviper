//
//  ListModuleViewController.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import UIKit
import PinLayout

final class ListModuleViewController: UIViewController {
	private let output: ListModuleViewOutput
    private let tableView = UITableView()
    private let addCityButton = UIButton(type: .system)

    private var viewModels = [CityViewModel]()

    init(output: ListModuleViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
        view.addSubview(self.tableView)
        view.addSubview(self.addCityButton)
        setupTableView()
        setupAddCityButton()
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.pin.all()
        self.addCityButton.pin.bottom().marginBottom(100).horizontally().sizeToFit(.width)
    }

    override func viewDidLoad() {
		super.viewDidLoad()
        self.output.viewDidLoad()
	}
}

extension ListModuleViewController: ListModuleViewInput {
    func set(viewModels: [CityViewModel]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }
}

extension ListModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueCell(cellType: CityTableViewCell.self, for: indexPath)
        cell.textLabel?.text = self.viewModels[indexPath.row].name
        return cell
    }
}

extension ListModuleViewController: UITableViewDelegate {

}

private extension ListModuleViewController {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.reuseIdentifier)
    }

    func setupAddCityButton() {
        self.addCityButton.addTarget(self, action: #selector(didTapAddCityButton), for: .touchUpInside)
        self.addCityButton.setTitle("Добавить город", for: .normal)
    }

    @objc
    func didTapAddCityButton() {
        self.output.didTapAddCityButton()
    }
}