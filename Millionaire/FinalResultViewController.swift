//
//  FourViewController.swift
//  Millionaire
//
//  Created by Sergio on 31.10.22.
//

import UIKit


class FinalResultViewController: UIViewController{
    var result: String = ""
    
    //MARK: - UIElements
    
    private let backgroundView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var resultHeading: UILabel = {
        let heading = UILabel()
        heading.text = result
        heading.textColor = .white
        heading.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    private lazy var resultContent: UILabel = {
        let content = UILabel()
        content.text = ""
        content.backgroundColor = .clear
        content.numberOfLines = 0
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
        setupResultHeading()
        setupResultContent()
        setupBackToMainScreenButton()
        setupBackgroundView()
    }
    
    //MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(resultHeading)
        view.addSubview(resultContent)
        view.addSubview(backToMainScreenButton)
    }
    
    private func setupResultHeading(){
        self.resultHeading.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.resultHeading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.resultHeading.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupResultContent(){
        self.resultContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.resultContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.resultContent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        self.resultContent.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupBackToMainScreenButton() {
        self.backToMainScreenButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        self.backToMainScreenButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.backToMainScreenButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.backToMainScreenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupBackgroundView() {
        self.backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //MARK: - Actions
    
    @objc private func backToMainScreenButtonAction() {
        self.navigationController?.popViewController(animated: true)
   }
}
