//
//  TeamTableViewCellViewModel.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 28.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

class TeamTableViewCellViewModel: TeamTableViewCellViewModelProtocol {
    var nameTeam: String? {
        return team.team?.name
    }
    
    var cityTeam: String? {
        return team.team?.location
    }
    
    var divisionTeam: String? {
        return team.team?.division
    }
    
    var logoTeam: String? {
        return team.team?.image
    }
    
    private var team: Team
    
    required init(team: Team) {
        self.team = team
    }
    
    
}
