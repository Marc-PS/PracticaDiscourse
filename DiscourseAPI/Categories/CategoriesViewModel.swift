//
//  CategoriesViewModel.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

protocol CategoriesCoordinatorDelegate: class {
    func didSelect(category: Category)
}

protocol CategoriesViewDelegate: class {
    func categoriesFetched()
    func errorFetchingCategories()
}

class CategoriesViewModel {
    weak var coordinatorDelegate: CategoriesCoordinatorDelegate?
    weak var categoryViewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoryViewModels: [CategoryCellViewModel] = []
    
    var categories: [Category] = []{
        didSet{
            self.categoryViewDelegate?.categoriesFetched()
        }
    }
    
    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }
    
    func viewWasLoaded() {
        categoriesDataManager.fetchCategories { [weak self] result in
            switch result {
                case .success(let categoriesResponse):
                    guard let fetchedCategories = categoriesResponse?.categoryList?.categories else { return }
                    self?.categories = fetchedCategories
                case .failure:
                    self?.categoryViewDelegate?.errorFetchingCategories()
                }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return categoryViewModels.count
    }
    
    func viewCategoryModel(index: Int) -> CategoryCellViewModel? {
        guard index < categoryViewModels.count else { return nil }
        return categoryViewModels[index]
    }
    
    func didSelectACategory(at index: Int){
        guard index < categoryViewModels.count else { return }
        let category = categoryViewModels[index].category
        coordinatorDelegate?.didSelect(category: category)
    }
    
}
