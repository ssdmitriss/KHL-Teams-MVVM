//
//  TeamListViewModelProtocol.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 27.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamListViewModelProtocol {
    var teams: [Team] { get }
    func fetchTeams(completion: @escaping() -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> TeamTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> TeamsDetailsViewModelProtocol?
}


