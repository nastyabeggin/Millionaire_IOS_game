import UIKit

class LevelListViewController: UIViewController {
    
    var easyQuestions = Question.easyQuestions
    var mediumQuestions = Question.mediumQuestions
    var hardQuestions = Question.hardQuestions
    
    override func loadView() {
        let view = LevelListView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension LevelListViewController {
    func setup() {
        
    }
}

extension LevelListViewController: LevelListViewDelegate {
    func cellTapped(_ indexPath: IndexPath) {
        let data = easyQuestions + mediumQuestions + hardQuestions
        print(data.reversed()[indexPath.row])
    }
    
    func getNumberOfQuestions() -> Int {
        let data = easyQuestions + mediumQuestions + hardQuestions
        return data.count
    }
    
    func getQuestion(_ indexPath: IndexPath) -> Question {
        let data = easyQuestions + mediumQuestions + hardQuestions
        return data.reversed()[indexPath.row]
    }
}
