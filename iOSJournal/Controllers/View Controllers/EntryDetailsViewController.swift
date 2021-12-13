//
//  EntryDetailsViewController.swift
//  iOSJournal
//
//  Created by Anto Rados on 11/30/21.
//

import UIKit

class EntryDetailsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        updateViews()

    }
    
    
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        
        if let entry = entry {
            print("Can't update \(entry.title) just yet.  Adding at a later time")
        } else {
            EntryController.shared.createEntryWith(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
    
}
