import UIKit

protocol LevelListViewDelegate: AnyObject {
    func cellTapped(_ indexPath: IndexPath)
    
    func getNumberOfQuestions() -> Int
    func getQuestion(_ indexPath: IndexPath) -> Question
}

class LevelListView: UIView {
    
    weak var delegate: LevelListViewDelegate!
    
    private lazy var tableView: LevelListTableView = {
        let tableView = LevelListTableView(frame: .zero, style: .plain)
        tableView.actionDelegate = self
        tableView.dataSourceDelegate = self
        return tableView
    }()
    private lazy var nextLevelButton: UIButton = {
        let view = UIButton()
        view.setTitle("Следующий вопрос", for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.cornerCurve = .continuous
        view.addTarget(self, action: #selector(nextQuestionTapped(sender: )), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func nextQuestionTapped(sender: UIButton!) {
        print("Next question")
    }
}

private extension LevelListView {
    func setup() {
        backgroundColor = .systemPurple
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        addSubview(nextLevelButton)
        NSLayoutConstraint.activate([
            nextLevelButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 5),
            nextLevelButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nextLevelButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nextLevelButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LevelListView: LevelListTableViewActionDelegate {
    func didSelectRowAt(_ indexPath: IndexPath) {
        delegate.cellTapped(indexPath)
    }
}

extension LevelListView: LevelListTableViewDataSourceDelegate {
    func numberOfRowsInSection() -> Int {
        delegate.getNumberOfQuestions()
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> Question {
        return delegate.getQuestion(indexPath)
    }
}
