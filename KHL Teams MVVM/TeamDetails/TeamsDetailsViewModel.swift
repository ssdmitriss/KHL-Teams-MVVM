//
//  TeamsDetailsViewModel.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 25.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

class TeamsDetailsViewModel: TeamsDetailsViewModelProtocol {
    var nameTeam: String? {
        return team.team?.name
    }
    var city: String? {
        return team.team?.location
    }
    var conferens: String? {
        return team.team?.conference
    }
    var teamLogo: String? {
        return team.team?.image
    }
    
    private var team: Team!
    
    required init(team: Team) {
        self.team = team
    }
    
    
}
