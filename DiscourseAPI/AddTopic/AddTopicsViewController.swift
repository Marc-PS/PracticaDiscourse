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
    @IBOutlet weak var topicRawText: UITextView!
    
    init(viewModel: AddTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "AddTopicView", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
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
    
    private func setupTextView(){
        
        topicRawText.text = "Enter you topic description..."
        topicRawText.textColor = .systemGray
        topicRawText.delegate = self
    }
    
    fileprivate func showErrorAddingTopicAlert() {
        let message = NSLocalizedString("Error adding topic\nPlease try again later", comment: "")
        showAlert(message)
    }
}

extension AddTopicViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
}

extension AddTopicViewController: AddTopicViewDelegate {
    func didCreateNewTopic() {
        self.showAlert("New topic created successfully", "New Topic", "OK")
        self.viewModel.coordinatorDelegate?.topicSuccessfullyAdded()
    }
    
    func didFailToCreateTopic(error: String) {
        self.showAlert(error, "Error creating Topic", "OK")
    }
}
