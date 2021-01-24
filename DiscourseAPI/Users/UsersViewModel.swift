//
//  UsersViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

protocol UsersCoordinatorDelegate: class {
    func didSelect(user: User)
}

protocol UsersViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

class UsersViewModel {
    weak var coordinatorDelegate: UsersCoordinatorDelegate?
    weak var viewDelegate: UsersViewDelegate?
    let usersDataManager: UsersDataManager
    var userViewModels: [UserCellViewModel] = []
    
    init(usersDataManager: UsersDataManager) {
        self.usersDataManager = usersDataManager
    }
    
    func viewWasLoaded() {
        usersDataManager.fetchUsers { (result) in
            switch result {
                case .success(let response):
                    
                    let fetchedUsers: [User] = response!.directoryItems.map({ directoryItem in
                        return directoryItem.user
                    })
                    
                    for user in fetchedUsers{
                        self.userViewModels.append(UserCellViewModel(user: user, userAvatar: user.avatarTemplate, userUsername: user.username, userName: user.name))
                    }
                    
                    self.viewDelegate?.usersFetched()
                    
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
    
    func viewModel(index: Int) -> UserCellViewModel? {
        guard index < userViewModels.count else { return nil }
        return userViewModels[index]
    }
    
    func didSelectUser(index: Int){
        let user = self.userViewModels[index].user
        self.coordinatorDelegate?.didSelect(user: user)
    }

}
