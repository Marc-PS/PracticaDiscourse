//
//  AddTopicsViewController.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import UIKit

class AddTopicViewController: UIViewController {
   
    let viewModel: AddTopicViewModel
    
    @IBOutlet weak var addTopicText: UITextField!
    
    init(viewModel: AddTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "AddTopicView", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
    }
    
    
    override func loadView() {
        super.loadView()
        
        
        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButtonTapped))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc fileprivate func cancelButtonTapped() {
        viewModel.cancelButtonTapped()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton){
        guard let title = addTopicText.text else { return }
        guard let raw = addTopicText.text else { return }
        
        if !title.isEmpty && !raw.isEmpty {
            viewModel.submitNewTopic(title: title, raw: raw)
        }
    }
    
    
    fileprivate func showErrorAddingTopicAlert() {
        let message = NSLocalizedString("Error adding topic\nPlease try again later", comment: "")
        showAlert(message)
    }
}

extension AddTopicViewController: AddTopicViewDelegate {
    func errorAddingTopic() {
        showErrorAddingTopicAlert()
    }
}
