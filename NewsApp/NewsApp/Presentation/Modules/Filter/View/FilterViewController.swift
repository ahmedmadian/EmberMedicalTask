//
//  FilterViewController.swift
//  NewsApp
//
//  Created by Ahmed Madian on 1/9/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilterViewController: BaseViewController {
    
    
    //MARK:- IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectCountryButton: UIButton!
    @IBOutlet weak var selectSourceButton: UIButton!
    @IBOutlet weak var countryRadioButton: UIButton!
    @IBOutlet weak var sourceRadioButton: UIButton!
    
    //MARK:- Properties
    var viewModel: FilterViewModel!
    
    //MARK:- Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.makeRoundedCorners(with: 20)
        viewsInititalState()
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
        print("Country")
    }
    
    @IBAction func selectSourceDidTapped(_ sender: Any) {
        print("Source")
    }
    
    @IBAction func filterDidTapped(_ sender: Any) {
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
    
}
