//
//  ControllerWithProtocolOnly.swift
//  ListKit_Example
//
//  Created by Dmitrii Grebenshchikov on 04.05.20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyListKit

final class ControllerWithProtocolOnly: UIViewController, AnimatedTableListProtocol {

    var tableView: UITableView!
    var dataSource: TableViewDataSourceAnimated<TableListSection>!
    var syncDelegate: SyncDelegate<TableListSection>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.setup(withTableStyle: .plain)
        reloadViewModels()
    }

    private func reloadViewModels() {
        self.update(with: [getSectionWithRandomViewModels()])
    }

    // MARK: - Generate random rows/headers

    private func getSectionWithRandomViewModels() -> TableListSection {
        var rowViewModels: [TableItemViewModel] = []

        for _ in 0 ..< Int.random(in: 0...100) {
            let oneLineDataModel = TextDataModel(text: .randomString())
            let cellViewModel = TableItemViewModel(data: oneLineDataModel,
                                                  map: OneTitleTableViewCell.map1,
                                                  style: .default)
            rowViewModels.append(cellViewModel)
        }

        let section = TableListSection(rows: rowViewModels)
        return section
    }

}
