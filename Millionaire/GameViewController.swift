//
//  TwoViewController.swift
//  Millionaire
//
//  Created by Sergio on 31.10.22.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: - Properties
    
    var gameBrain: GameBrain?
    private let aButton = CustomButton()
    private let bButton = CustomButton()
    private let cButton = CustomButton()
    private let dButton = CustomButton()
    var myTimer = Timer()
    var durationTimer = 30

    //MARK: - UIElements

    private let backgroundView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func helpButton(text: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private lazy var fiftyButton = helpButton(text: "50/50", action: #selector(fiftyButtonAction))
    private lazy var callButton = helpButton(text: "звонок", action: #selector(callButtonAction))
    private lazy var hallHelpButton = helpButton(text: "зал", action: #selector(hallHelpButtonAction))

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.font = .systemFont(ofSize: 45)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var questionsLabel: UILabel = {
        let label = UILabel()
        label.text = gameBrain?.currentQuestion
        label.numberOfLines = 4
        label.font = label.font.withSize(30)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        setupHierarchy()
        setupLayout()
        answerButton()
        setNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        fiftyButton.layer.cornerRadius = fiftyButton.frame.width / 2
        callButton.layer.cornerRadius = fiftyButton.frame.width / 2
        hallHelpButton.layer.cornerRadius = fiftyButton.frame.width / 2
    }

    private func answerButton() {
        aButtonTapped()
        bButtonTapped()
        cButtonTapped()
        dButtonTapped()
    }

    private func aButtonTapped() {
        aButton.setTitle(gameBrain?.currentAnswerA, for: .normal)
        aButton.addTarget(self, action: #selector(aButtonAction), for: .touchUpInside)
    }

    private func bButtonTapped() {
        bButton.setTitle(gameBrain?.currentAnswerB, for: .normal)
        bButton.addTarget(self, action: #selector(bButtonAction), for: .touchUpInside)
    }

    private func cButtonTapped() {
        cButton.setTitle(gameBrain?.currentAnswerC, for: .normal)
        cButton.addTarget(self, action: #selector(cButtonAction), for: .touchUpInside)
    }

    private func dButtonTapped() {
        dButton.setTitle(gameBrain?.currentAnswerD, for: .normal)
        dButton.addTarget(self, action: #selector(dButtonAction), for: .touchUpInside)
    }

    //MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(questionsLabel)
        view.addSubview(fiftyButton)
        view.addSubview(hallHelpButton)
        view.addSubview(callButton)
        view.addSubview(timeLabel)
        view.addSubview(aButton)
        view.addSubview(bButton)
        view.addSubview(cButton)
        view.addSubview(dButton)
    }

    private func startTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                    target: self,
                                    selector: (#selector(updateTimer)),
                                    userInfo: nil,
                                    repeats: true)
    }

    private func setNavigationBar() { // кастомная кнопка для навигейшенбара
        navigationController?.navigationBar.tintColor = .black
        let userInfoButton = createCustomButton(selector: #selector(tachMoneyButton))
        navigationItem.rightBarButtonItem = userInfoButton

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "xmark.circle"),
            style: .done,
            target: self,
            action: #selector(gameOver))
    }

    //MARK: - Button Action

    @objc func updateTimer() {
        durationTimer -= 1
        timeLabel.text = "\(durationTimer)"

        if durationTimer == 0 {
            myTimer.invalidate()
            timeLabel.text = ""
            showAlert()
        }
    }

    @objc func fiftyButtonAction() {
        print("Pressed")
    }

    @objc func callButtonAction() {
        print("Pressed")
    }

    @objc func hallHelpButtonAction() {
        print("Pressed")
    }

    @objc func aButtonAction() {
        aButton.shake()
        print("Pressed")
    }

    @objc func bButtonAction() {
        bButton.shake()
        print("Pressed")
    }

    @objc func cButtonAction() {
        cButton.shake()
        print("Pressed")
    }

    @objc func dButtonAction() {
        dButton.shake()
        print("Pressed")
    }

    @objc func tachMoneyButton() {

    }

    @objc func gameOver() {
        if let navigator = navigationController {
            navigator.popViewController(animated: true)
        }
        player.stop()
    }

    func showAlert() {
        let alert = UIAlertController(
            title: "Время вышло!",
            message: gameBrain?.wonAmount(),
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "В ГЛАВНОЕ МЕНЮ", style: .cancel, handler: { event in
            if let navigator = self.navigationController {
                navigator.popViewController(animated: true)
            }
        }))
        self.present(alert, animated: true)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.widthAnchor.constraint(equalToConstant: 0),
            backgroundView.heightAnchor.constraint(equalToConstant: 0),
            
            fiftyButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -100),
            fiftyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            fiftyButton.widthAnchor.constraint(equalToConstant: 60),
            fiftyButton.heightAnchor.constraint(equalToConstant: 60),

            hallHelpButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -100),
            hallHelpButton.leadingAnchor.constraint(equalTo: fiftyButton.trailingAnchor, constant: 40),
            hallHelpButton.widthAnchor.constraint(equalToConstant: 60),
            hallHelpButton.heightAnchor.constraint(equalToConstant: 60),

            callButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -100),
            callButton.leadingAnchor.constraint(equalTo: hallHelpButton.trailingAnchor, constant: 40),
            callButton.widthAnchor.constraint(equalToConstant: 60),
            callButton.heightAnchor.constraint(equalToConstant: 60),

            timeLabel.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: 10),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 70),
            timeLabel.heightAnchor.constraint(equalToConstant: 70),

            questionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            questionsLabel.widthAnchor.constraint(equalToConstant: 330),
            questionsLabel.heightAnchor.constraint(equalToConstant: 170),

            aButton.topAnchor.constraint(equalTo: questionsLabel.bottomAnchor, constant: 80),
            aButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            aButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            aButton.heightAnchor.constraint(equalToConstant: 50),

            bButton.topAnchor.constraint(equalTo: aButton.bottomAnchor, constant: 20),
            bButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bButton.heightAnchor.constraint(equalToConstant: 50),

            cButton.topAnchor.constraint(equalTo: bButton.bottomAnchor, constant: 20),
            cButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cButton.heightAnchor.constraint(equalToConstant: 50),

            dButton.topAnchor.constraint(equalTo: cButton.bottomAnchor, constant: 20),
            dButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            dButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
