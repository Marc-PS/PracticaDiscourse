//
//  CategoriesViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

protocol CategoriesCoordinatorDelegate: AnyObject {
    func didSelect(category: Category)
}

protocol CategoriesViewDelegate: AnyObject {
    func categoriesFetched()
    func errorFetchingCategories()
}

class CategoriesViewModel {
    weak var coordinatorDelegate: CategoriesCoordinatorDelegate?
    weak var categoryViewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    
    var categories: [Category] = []{
        didSet{
            self.categoryViewDelegate?.categoriesFetched()
        }
    }
    
    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }
    
    func viewWasLoaded() {
        categoriesDataManager.fetchCategories { result in
            switch result {
                case .success(let categoriesResponse):
                    guard let fetchedCategories = categoriesResponse?.categoryList?.categories else { return }
                    self.categories = fetchedCategories
                case .failure:
                    self.categoryViewDelegate?.errorFetchingCategories()
                }
        }
    }
    
    func numberOfRows() -> Int {
        return categories.count
    }
    

    
}
