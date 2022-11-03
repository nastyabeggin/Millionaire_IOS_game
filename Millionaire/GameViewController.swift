//
//  TwoViewController.swift
//  Millionaire
//
//  Created by Sergio on 31.10.22.
//

import UIKit

class GameViewController: UIViewController {

//    var buttonStackView = UIStackView()
//    var helpButtonStackView = UIStackView()
    var aButton = CustomButton()
    var bButton = CustomButton()
    var cButton = CustomButton()
    var dButton = CustomButton()

    //MARK: - UIElements

    //    private let backgroundImageView: UIImageView = {
    //        let image = UIImage(named: "")
    //        let imageView = UIImageView(image: image)
    //        imageView.translatesAutoresizingMaskIntoConstraints = false
    //        return imageView
    //    }()
    //
    //    private let scrollView: UIScrollView = {
    //        let scrollView = UIScrollView()
    //        scrollView.translatesAutoresizingMaskIntoConstraints = false
    //        return scrollView
    //    }()

    //    private let backgroundView: UIView = {
    //        let view = UIView()
    //        view.backgroundColor = .clear
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()

    func helpButton(text: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private lazy var fiftyButton = helpButton(text: "fff", action: #selector(fiftyButtonAction))
    private lazy var callButton = helpButton(text: "fff", action: #selector(callButtonAction))
    private lazy var hallHelpButton = helpButton(text: "fff", action: #selector(hallHelpButtonAction))

    private let questionsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "textaaaaaaaanljknkljblkjsnlkjn;gsljkngl;skng'lskgnpuihipuyp98y898uyoiuhpoiuhdgpoidhgpihd[gijdpohijdphipdhijpdhij'"
        label.numberOfLines = 4
        label.font = label.font.withSize(22)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //    func makeButton(text: String, action: Selector) -> UIButton {
    //        let button = UIButton()
    //        button.layer.cornerRadius = 10
    //        button.backgroundColor = .yellow
    //        button.setTitle(text, for: .normal)
    //        button.setTitleColor(.black, for: .normal)
    //        button.addTarget(self, action: action, for: .touchUpInside)
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //}

    //    private lazy var aButton = makeButton(text: "fff", action: #selector(aButtonAction))
    //    private lazy var bButton = makeButton(text: "fff", action: #selector(aButtonAction))
    //    private lazy var cButton = makeButton(text: "fff", action: #selector(aButtonAction))
    //    private lazy var dButton = makeButton(text: "fff", action: #selector(aButtonAction))



    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        answerButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        fiftyButton.layer.cornerRadius = fiftyButton.frame.width / 2
        callButton.layer.cornerRadius = fiftyButton.frame.width / 2
        hallHelpButton.layer.cornerRadius = fiftyButton.frame.width / 2
    }

    func answerButton() {
        aButtonTapped()
        bButtonTapped()
        cButtonTapped()
        dButtonTapped()
    }

    private func aButtonTapped() {
        aButton.setTitle("new button", for: .normal)
        aButton.addTarget(self, action: #selector(aButtonAction), for: .touchUpInside)
    }

    func bButtonTapped() {
        bButton.setTitle("new button", for: .normal)
        bButton.addTarget(self, action: #selector(bButtonAction), for: .touchUpInside)
    }

    func cButtonTapped() {
        cButton.setTitle("new button", for: .normal)
        cButton.addTarget(self, action: #selector(cButtonAction), for: .touchUpInside)
    }

    func dButtonTapped() {
        dButton.setTitle("new button", for: .normal)
        dButton.addTarget(self, action: #selector(dButtonAction), for: .touchUpInside)
    }

    //MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(questionsLabel)
        view.addSubview(fiftyButton)
        view.addSubview(hallHelpButton)
        view.addSubview(callButton)
        view.addSubview(aButton)
        view.addSubview(bButton)
        view.addSubview(cButton)
        view.addSubview(dButton)

//        buttonStackView = UIStackView(arrangedSubviews: [aButton, bButton, cButton, dButton],
//                                      axis: .vertical,
//                                      spacing: 25,
//                                      distribution: .fillProportionally)
//        view.addSubview(buttonStackView)
    }

    //MARK: - Button Action

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

    private func setupLayout() {
        NSLayoutConstraint.activate([
            fiftyButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -110),
            fiftyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            fiftyButton.widthAnchor.constraint(equalToConstant: 60),
            fiftyButton.heightAnchor.constraint(equalToConstant: 60),

            hallHelpButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -110),
            hallHelpButton.leadingAnchor.constraint(equalTo: fiftyButton.trailingAnchor, constant: 40),
            hallHelpButton.widthAnchor.constraint(equalToConstant: 60),
            hallHelpButton.heightAnchor.constraint(equalToConstant: 60),

            callButton.bottomAnchor.constraint(equalTo: questionsLabel.topAnchor, constant: -110),
            callButton.leadingAnchor.constraint(equalTo: hallHelpButton.trailingAnchor, constant: 40),
            callButton.widthAnchor.constraint(equalToConstant: 60),
            callButton.heightAnchor.constraint(equalToConstant: 60),

            questionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
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

//            newButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            newButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
//            newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true


//            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            buttonStackView.topAnchor.constraint(equalTo: questionsLabel.bottomAnchor, constant: 50),
//            buttonStackView.widthAnchor.constraint(equalToConstant: 350),
//            buttonStackView.heightAnchor.constraint(equalToConstant: 210)
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
