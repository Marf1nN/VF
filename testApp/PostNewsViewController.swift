
import UIKit
import Alamofire
import SwiftyJSON



class PostNewsViewController: UIViewController  {

    @IBOutlet weak var menuButtonTabBar : UIBarButtonItem!
    var menuVC : MenuViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsOne()
    menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuViewController
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
}

    func newsOne () {
        Alamofire.request("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=4d390d32bf174acc883ef1ec77d77f73").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar["articles"])
            }
        }
    }
    
    @IBAction func menuBarButtonItem (_ sender: UIBarButtonItem!) {
        if AppDelegate.isMenuVC {
             showMenu()
        } else {
            hideMenu()
        }
        
    }
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            showMenu()
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            hideMenu()
        default: break
        }
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuVC.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC  = false
        }
        
    }
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }
    
}
