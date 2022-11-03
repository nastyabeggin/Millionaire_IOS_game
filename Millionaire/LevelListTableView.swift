import UIKit

protocol LevelListTableViewActionDelegate: AnyObject {
    func didSelectRowAt(_ indexPath: IndexPath)
}

protocol LevelListTableViewDataSourceDelegate: AnyObject {
    func numberOfRowsInSection() -> Int
    func cellForRowAt(_ indexPath: IndexPath) -> Question
    
}

class LevelListTableView: UITableView {
    
    weak var actionDelegate: LevelListTableViewActionDelegate!
    weak var dataSourceDelegate: LevelListTableViewDataSourceDelegate!
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension LevelListTableView {
    func setup() {
        delegate = self
        dataSource = self
        register(LevelListTableViewCell.self, forCellReuseIdentifier: LevelListTableViewCell.reuseIdentifier)
        backgroundColor = .clear
        allowsSelection = false
        contentInset = UIEdgeInsets(top: -35, left: 0, bottom: -35, right: 0)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension LevelListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionDelegate.didSelectRowAt(indexPath)
    }
}

extension LevelListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourceDelegate.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: LevelListTableViewCell.reuseIdentifier, for: indexPath) as? LevelListTableViewCell else {
            fatalError("Error with casting type = \(LevelListTableViewCell.self)")
        }
        let content = dataSourceDelegate.cellForRowAt(indexPath)
        cell.question = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
