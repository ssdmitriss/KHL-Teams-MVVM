//
//  MainTableViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class TeamListTableViewController: UITableViewController {
    
    private var viewModel: TeamListViewModelProtocol! {
        didSet {
            viewModel.fetchTeams {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.separatorStyle = .singleLine
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TeamListViewModel()
        configureNavigationBar(largeTitelColor: UIColor.white,
                               backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                               tintColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                               title: "Команды КХЛ",
                               prefferedLargeTitle: true)
        
        if viewModel.teams.isEmpty == true {
            tableView.separatorStyle = .none
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! TeamsDetailsViewController
            viewModel.selectedRow(for: indexPath)
            detailVC.viewModel = viewModel.viewModelForSelectedRow()
        }
    }
    
}


extension UITableViewController{
    func configureNavigationBar(largeTitelColor: UIColor,
                                backgroundColor: UIColor,
                                tintColor: UIColor,
                                title: String,
                                prefferedLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.backgroundColor = backgroundColor
            
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.compactAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.superview?.backgroundColor = .white
            navigationItem.title = title
            
        } else {
            // fallback on earlier virsion
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            navigationController?.view.backgroundColor = backgroundColor
        }
        
    }
}

