//
//  UsersViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

protocol UsersViewModelCoordinatorDelegate: AnyObject {
    func didSelect(username: String)
}

protocol UsersViewModelViewDelegate: AnyObject {
    func usersWereFetched()
    func errorFetchingUsers()
}

class UsersViewModel {
    weak var coordinatorDelegate: UsersViewModelCoordinatorDelegate?
    weak var viewDelegate: UsersViewModelViewDelegate?
    var usersDataManager: UsersDataManager
    var userViewModels: [UserCellViewModel] = []
    
    init(usersDataManager: UsersDataManager) {
        self.usersDataManager = usersDataManager
    }
    
    func numberOfUsers() -> Int {
        return userViewModels.count
    }
    
    func fetchUsers() {
        usersDataManager.fetchAllUsers { (result) in
            switch result {
                case .success(let response):
                    
                    let fetchedUsers: [User] = response!.directoryItems.map({ directoryItem in
                        return directoryItem.user
                    })
                    
                    for user in fetchedUsers{
                        self.userViewModels.append(UserCellViewModel(user: user))
                    }
                    
                    self.viewDelegate?.usersWereFetched()
                    
                case .failure:
                    self.viewDelegate?.errorFetchingUsers()
            }
        }
    }
    
    
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return userViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userViewModels.count else { return nil }
        return userViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        coordinatorDelegate?.didSelect(username: userViewModels[indexPath.row].user.username)
    }

}
