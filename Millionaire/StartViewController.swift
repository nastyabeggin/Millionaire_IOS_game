//
//  ViewController.swift
//  Millionaire
//
//  Created by Valery Keplin on 31.10.22.
//

import UIKit

class StartViewController: UIViewController {

    //MARK: - UIElements
    
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
        setupView()
        setupStartButton()
        setupRuleButton()
        playSound(resource: "startApp")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setups
    
    override public var shouldAutorotate: Bool {
      return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
      return .portrait
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
      return .portrait
    }
    
    private func setupView() {
        view.backgroundColor = .blue
    }

    private func setupStartButton() {
        self.view.addSubview(self.startButton)
        self.startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -180).isActive = true
            self.startButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
            self.startButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
            self.startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
    
    private func setupRuleButton() {
            self.view.addSubview(self.ruleButton)
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
        
        playSound(resource: "waitForResponse")
    }
    
    @objc private func ruleButtonAction() {
        let ruleViewController = RuleViewController()
        self.navigationController?.pushViewController(ruleViewController, animated: true)
       }

}
