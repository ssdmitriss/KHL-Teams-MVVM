//
//  TeamTableViewCellViewModelProtocol.swift
//  KHL Teams MVVM
//
//  Created by Дмитрий Селезнев on 28.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamTableViewCellViewModelProtocol {
    var nameTeam: String? { get }
    var cityTeam: String? { get }
    var divisionTeam: String? { get }
    var logoTeam: String? { get }
    
    init(team: Team) 
    
}
