//
//  SeconViewController.swift
//  Millionaire
//
//  Created by Nastyabeggin on 31.10.22.
//

import UIKit

class RuleViewController: UIViewController{
    
    //MARK: - UIElements
    
    private let backgroundView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rulesHeading: UILabel = {
        let heading = UILabel()
        heading.text = "Правила"
        heading.textColor = .white
        heading.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    private lazy var rulesContent: UILabel = {
        let content = UILabel()
        content.text = "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        content.numberOfLines = 0
        content.textColor = .white
        content.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.minimumScaleFactor = 0.1
        content.adjustsFontSizeToFitWidth = true
        content.lineBreakMode = .byClipping
        return content
    }()
    
    private lazy var backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 15
        button.setTitle("НА ГЛАВНЫЙ ЭКРАН", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(backToMainScreenButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        setupHierarchy()
        setupRulesHeading()
        setupRulesContent()
        setupBackToMainScreenButton()
    }
    
    //MARK: - Setups
 
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(rulesHeading)
        view.addSubview(rulesContent)
        view.addSubview(backToMainScreenButton)
    }
    
    private func setupRulesHeading(){
        self.rulesHeading.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.rulesHeading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.rulesHeading.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupRulesContent(){
        self.rulesContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.rulesContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.rulesContent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        self.rulesContent.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupBackToMainScreenButton() {
        self.backToMainScreenButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        self.backToMainScreenButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.backToMainScreenButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.backToMainScreenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    //MARK: - Actions
    
    @objc private func backToMainScreenButtonAction() {
        self.navigationController?.popViewController(animated: true)
   }
}
