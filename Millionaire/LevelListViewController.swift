import UIKit

class LevelListViewController: UIViewController {
    
    var questions = Question.questions
    
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
        print(questions.reversed()[indexPath.row])
    }
    
    func getNumberOfQuestions() -> Int {
        return questions.count
    }
    
    func getQuestion(_ indexPath: IndexPath) -> Question {
        return questions.reversed()[indexPath.row]
    }
}
