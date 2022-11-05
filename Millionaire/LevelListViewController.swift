import UIKit

protocol LevelListViewControllerDelegate: AnyObject {
    func nextLevel()
}

class LevelListViewController: UIViewController {
    
    var delegate: LevelListViewControllerDelegate!
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
    func nextLevelButtonTapped() {
        delegate.nextLevel()
    }
    
    func getNumberOfQuestions() -> Int {
        return questions.count
    }
    
    func getQuestion(_ indexPath: IndexPath) -> Question {
        return questions.reversed()[indexPath.row]
    }
}
