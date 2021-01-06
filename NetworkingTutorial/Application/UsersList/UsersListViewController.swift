//
//  UsersListViewController.swift
//  NetworkingTutorial
//
//  Created by Fernando Martín Ortiz on 06/01/2021.
//

import UIKit

final class UsersListViewController: ViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: .main), forCellReuseIdentifier: "UserTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkingManager.getUsers { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users
                self.tableView.reloadData()
            case .failure:
                break
            }
        }
    }

}

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        cell.configure(for: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
