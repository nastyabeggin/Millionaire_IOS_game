//
//  ViewController.swift
//  Millionaire
//
//  Created by Valery Keplin on 31.10.22.
//

import UIKit

class StartViewController: UIViewController {

    //MARK: - Properties
    
    var gameBrain = GameBrain()
    
    //MARK: - UIElements
    
    private let backgroundView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let logoView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var startButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .yellow
            button.layer.cornerRadius = 15
            button.setTitle("НАЧАТЬ ИГРУ", for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private lazy var ruleButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .yellow
            button.layer.cornerRadius = 15
            button.setTitle("ПРАВИЛА ИГРЫ", for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            button.addTarget(self, action: #selector(ruleButtonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupStartButton()
        setupRuleButton()
        playSound(resource: "startApp")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(startButton)
        view.addSubview(ruleButton)
    }
    
    private func setupView() {
        view.backgroundColor = .blue
    }

    private func setupStartButton() {
        self.startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -180).isActive = true
            self.startButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
            self.startButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
            self.startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
    
    private func setupRuleButton() {
            self.ruleButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
            self.ruleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
            self.ruleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
            self.ruleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }

    //MARK: - Actions
    
    @objc private func startButtonAction() {
        let viewController = GameViewController()
          if let navigator = navigationController {
            navigator.pushViewController(viewController, animated: true)
          }
        viewController.gameBrain = gameBrain
        gameBrain.getQuestion()
        playSound(resource: "waitForResponse")
    }
    
    @objc private func ruleButtonAction() {
        let ruleViewController = RuleViewController()
        self.navigationController?.pushViewController(ruleViewController, animated: true)
       }

}
