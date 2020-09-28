//
//  TeamListViewModel.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 27.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

class TeamListViewModel: TeamListViewModelProtocol {
    
    var teams: [Team] = []
    
    private var indexPath: IndexPath?
    
    func fetchTeams(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { teams in
            self.teams = teams
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return teams.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TeamTableViewCellViewModelProtocol? {
        let team = teams[indexPath.row]
        return TeamTableViewCellViewModel(team: team)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> TeamsDetailsViewModelProtocol? {
        guard let indexPath = indexPath else { return nil }
        let team = teams[indexPath.row]
        return TeamsDetailsViewModel(team: team)
    }
}
