//
//  TeamsDetailsViewModelProtocol.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 25.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamsDetailsViewModelProtocol {
    var nameTeam: String? { get }
    var city: String? { get }
    var conferens: String? { get }
    var teamLogo: String? { get }
    
    init(team: Team)
    
}
