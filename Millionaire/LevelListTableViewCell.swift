//
//  LevelListTableViewCell.swift
//  Millionaire
//
//  Created by Даниил Симахин on 01.11.2022.
//

import UIKit

class LevelListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: LevelListTableViewCell.self)
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "?"
        view.font = .systemFont(ofSize: 17)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var question: Question! {
        didSet {
            titleLabel.text = question.text
            titleLabel.backgroundColor = question.isAnswered ? .systemGreen : .white
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension LevelListTableViewCell {
    func setup() {
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
