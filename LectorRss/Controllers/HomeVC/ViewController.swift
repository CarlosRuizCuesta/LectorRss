//
//  ViewController.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit
import Toast_Swift
import PINRemoteImage
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var tblNews : UITableView!
    @IBOutlet var searchBar : UISearchBar!
    
    var newsList : NewsList = NewsList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Check if the device have internet connection
        if NetworkReachabilityManager()!.isReachable {
            Webservice(delegate: self, type: WebserviceTypeEnum.apinews).start() // Start the Webservice
        } else {
            loadNewsDataBase() // Get news from database
        }
    }
}

// ViewController Methods
extension ViewController {
    
    /**
     Get the news from the database
     */
    func loadNewsDataBase() {
        let realmUsage = RealmUsage(delegate: self)
        realmUsage.getNewsList() // Start searching news into database
    }
    /**
     set the newList and reload the table
     */
    func setNewsList(newsList : NewsList) {
        DispatchQueue.main.async {
            self.newsList = newsList
            self.tblNews.reloadData()
        }
    }
    
    /**
     Make Toast
     */
    func makeToast(text : String) {
        DispatchQueue.main.async {
            self.view.makeToast(text)
        }
    }
    
    /**
     Save the list new into database
     */
    func saveNewsDataBase() {
        self.newsList.saveNews(delegate : self) // Save the news into database
    }
}

// Response webservice and database
extension ViewController : RealmProtocols, WebserviceProtocols {

    // Successful database response
    func realmResult(newsList: NewsList) {
        self.setNewsList(newsList: newsList)
        self.makeToast(text: "Obtein from Database")
    }
    
    // Error database response
    func realmError(error: RealmErrorsEnum) {
        self.makeToast(text: error.rawValue)
    }
    
    // Successful webservice response
    func webserviceResult(newsList: NewsList) {
        self.setNewsList(newsList: newsList)
        self.saveNewsDataBase()
        self.makeToast(text: "Obtein from ApiNews")
    }
    
    // Error webservice response
    func webserviceError(error: WebserviceErrorsEnum) {
            switch error {
            case WebserviceErrorsEnum.networking:
                self.loadNewsDataBase()
                break
            case WebserviceErrorsEnum.http,
                 WebserviceErrorsEnum.data,
                 WebserviceErrorsEnum.zero,
                WebserviceErrorsEnum.typenf:
                self.makeToast(text: error.rawValue)
                break
            }
    }
}

// UISearchBarDelegate UITableViewDelegate Methods
extension ViewController : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList.get(pos : indexPath.row) // Get news from newsList by rowPath
        let newsVC = storyboard?.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        newsVC.modalPresentationStyle = .overCurrentContext
        newsVC.modalTransitionStyle = .crossDissolve
        newsVC.news = news
        self.present(newsVC, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellNews", for: indexPath) as! TableCellNews
        let news = newsList.get(pos : indexPath.row) // Get news from newsList by rowPath
        let urlImage = news.urlToImg ?? TableCellNews.imgImageDefault
        
        cell.lblTitle.text = news.title
        cell.lblDescription.text = news.desc
        cell.imgImage!.pin_setImage(from: URL(string:  urlImage)!)
        
        return cell
    }
}

// UISearchBarDelegate Methods
extension ViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            //  Look for the news in the backup list that have in the title the string passed by the Searchbar
            newsList.newsList = newsList.newsListBackup.filter({ (news : News) -> Bool in
                return news.title.lowercased().contains(searchText.lowercased())
            })
        } else {
            // Initialize the news list with the backup list
            newsList.newsList = newsList.newsListBackup
        }
        
        tblNews.reloadData()
    }
}
