//
//  UserViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 21/8/21.
//

import Foundation

protocol UserViewModelViewDelegate: AnyObject {
    func errorFetchingUser()
    func userDataFetched()
    func successUpdatingUserName()
    func errorUpdatingUserName()
}

class UserViewModel {
    weak var viewDelegate: UserViewModelViewDelegate?
    let username: String
    let userDataManager: UserDataManager

    var userIDLabelText: String?
    var nameLabelText: String?
    var userNameUsingTextFieldStackViewIsHidden = true
    var updateNameButtonIsHidden = true

    init(username: String, userDataManager: UserDataManager) {
        self.userDataManager = userDataManager
        self.username = username
    }

    func viewWasLoaded() {
        userDataManager.fetchUser(username: username) { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                self?.userIDLabelText = "\(response.user.id)"
                self?.nameLabelText = response.user.name
                if response.user.canEditName {
                    self?.userNameUsingTextFieldStackViewIsHidden = false
                    self?.updateNameButtonIsHidden = false
                } else {
                    self?.userNameUsingTextFieldStackViewIsHidden = true
                    self?.updateNameButtonIsHidden = true
                }

                self?.viewDelegate?.userDataFetched()
            case .failure:
                self?.viewDelegate?.errorFetchingUser()
            }
        }
    }

    func updateNameButtonTapped(name: String) {
        userDataManager.updateUserName(username: username, name: name) { [weak self] (result) in
            switch result {
            case .success:
                self?.viewDelegate?.successUpdatingUserName()
            case .failure:
                self?.viewDelegate?.errorUpdatingUserName()
            }
        }
    }
}

