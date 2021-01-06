//
//  UserTableViewCell.swift
//  NetworkingTutorial
//
//  Created by Fernando Martín Ortiz on 06/01/2021.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(for user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
