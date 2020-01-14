//
//  FilterPopupViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class FilterPopupViewController: BaseViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectCountryButton: UIButton!
    @IBOutlet weak var selectSourceButton: UIButton!
    @IBOutlet weak var countryRadioButton: UIButton!
    @IBOutlet weak var sourceRadioButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    //MARK:- Properties
    var viewModel: FilterPopupViewModel!
    private let searchNotificationName = Notification.Name(searchDataNotificationKey)
    var recievedLookup: Lookup? {
        didSet {
            switch recievedLookup!.type! {
            case .country:
                self.countryLabel.text = recievedLookup!.name
            case .Source:
                self.sourceLabel.text = recievedLookup!.name
            }
        }
    }
    
    //MARK:- Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.makeRoundedCorners(with: 20)
        viewsInititalState()
        createObserver()
    }
    
    func viewsInititalState() {
        countryRadioButton.isSelected = true
        selectCountryButton.isEnabled = true
        selectSourceButton.isEnabled = false
    }
    
    //MARK:- IBAction
    @IBAction func cancel_Tapped(_ sende: UIButton) {
        viewModel.dismiss()
    }
    
    @IBAction func selectCountryDidTapped(_ sender: Any) {
        viewModel.selectCountryDidTapped()
    }
    
    @IBAction func selectSourceDidTapped(_ sender: Any) {
        viewModel.selectSourceDidTapped()
    }
    
    @IBAction func filterDidTapped(_ sender: Any) {
        guard let lookup = recievedLookup else { return }
        viewModel.filterDidTapped(with: lookup)
    }
    
    @IBAction func countryRadioDidTapped(_ sender: UIButton) {
        togglInRadio(firstButton: sender, secondButton: sourceRadioButton)
        selectCountryButton.isEnabled = sender.isSelected
        selectSourceButton.isEnabled = !sender.isSelected
    }
    
    @IBAction func sourceRadioDidTapped(_ sender: UIButton) {
        togglInRadio(firstButton: sender, secondButton: countryRadioButton)
        selectSourceButton.isEnabled = sender.isSelected
        selectCountryButton.isEnabled = !sender.isSelected
    }
    
    //MARK:- Methods
   
    private func togglInRadio(firstButton: UIButton, secondButton: UIButton) {
        if firstButton.isSelected {
            firstButton.isSelected = false
            secondButton.isSelected = false
        }else {
            firstButton.isSelected = true
            secondButton.isSelected = false
        }
    }
    
    @objc func updateScreen(_ notification: NSNotification) {
        recievedLookup = notification.object as? Lookup
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: searchNotificationName , object: nil)
    }
    
    //MARK: - Deinitilization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
