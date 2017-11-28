//
//  ViewController.swift
//  testApp
//
//  Created by Владислав on 23.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var articles : [Article] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()

        fectchInfo()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.articles.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath) as! ArticleTableViewCell
        
        cell.titleCell.text = self.articles[indexPath.item].headline
        cell.textViewCell.text = self.articles[indexPath.item].dectNews
        cell.author.text = self.articles[indexPath.item].authorNews
        cell.imageViewCell.dowloadImage(from: self.articles[indexPath.item].imgUrlNews!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        webVC.url = self.articles[indexPath.item].urlNews
        self.present(webVC, animated: true, completion: nil)
    }
    func fectchInfo () {
        
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?sources=techcrunch&apiKey=4d390d32bf174acc883ef1ec77d77f73")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if  let acrticlessFromJson = json["articles"] as? [[String : AnyObject]] {
                    for acrticlessfromJson  in acrticlessFromJson {
                        let article = Article()
                        if let title = acrticlessfromJson["title"] as? String, let author = acrticlessfromJson["author"] as? String,let dect = acrticlessfromJson["description"] as? String , let url = acrticlessfromJson["url"] as? String? , let image = acrticlessfromJson["urlToImage"] as? String {
                            
                            article.authorNews = author
                            article.headline = title
                            article.dectNews = dect
                            article.imgUrlNews = image
                            article.urlNews = url
                        }
                        self.articles.append(article)
                        
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
                
            }catch let error {
                print(error)
            }
            
            
        }
        task.resume()
        
        
    }

}

extension UIImageView {
    func dowloadImage (from url : String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                }
        }
        task.resume()
        
    }
    
}
