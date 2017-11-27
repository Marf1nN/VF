

import UIKit
import Firebase
import FirebaseAuth
class MenuViewController: UIViewController  , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView : UITableView!
    let mytitle = ["Home", "News", "Log Out"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
     //   cell.labelText.text = mytitle[indexPath.row]
        return cell
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        menuTableView.delegate = self

     
    }

 

}
