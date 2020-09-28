//
//  ViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class TeamsDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var logoTeam: ImageManager!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var conference: UILabel!
    
    var viewModel: TeamsDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTeam.text = viewModel.nameTeam
        city.text = viewModel.city
        conference.text = viewModel.conferens
        logoTeam.fetchImage(with: viewModel.teamLogo)
    }
}

