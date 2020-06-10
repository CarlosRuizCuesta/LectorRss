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

class ViewController: UIViewController {
    
    @IBOutlet var tblNews : UITableView!
    @IBOutlet var searchBar : UISearchBar!
    
    var newsList : NewsList = NewsList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
            print("Documents directory \(documentPath)")
        }
        
        Webservice(delegate: self).start() // Start the Webservice
    }
}

extension ViewController {
    
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
        DispatchQueue.main.async {
            self.newsList.saveNews(delegate : self) // Save the news into database
        }
    }
}

extension ViewController : NewsApiProtocols {
    
    // Successful ApiNews response
    func newsApiResult(newsList: NewsList) {
        self.setNewsList(newsList: newsList)
        self.saveNewsDataBase()
        self.makeToast(text: "Obtein from ApiNews")
    }
    
    // Error ApiNews response
    func newsApiError(error: NewsApiErrorsEnum) {
            switch error {
            case NewsApiErrorsEnum.networking:
                let realmUsage = RealmUsage(delegate: self)
                realmUsage.getNewsList() // Start searching news into database
                break
            case NewsApiErrorsEnum.http,
                 NewsApiErrorsEnum.data,
                 NewsApiErrorsEnum.zero:
                self.makeToast(text: error.rawValue)
                break
            }
    }
}

extension ViewController : RealmProtocols {

    // Successful database response
    func realmResult(newsList: NewsList) {
        self.setNewsList(newsList: newsList)
        self.makeToast(text: "Obtein from Database")
    }
    
    // Error database response
    func realmError(error: RealmErrorsEnum) {
        self.makeToast(text: error.rawValue)
    }
}

extension ViewController : UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellNews", for: indexPath) as! TableCellNews
        let news = newsList.get(pos : indexPath.row)
        
        cell.lblTitle.text = news.title
        cell.lblDescription.text = news.desc
        cell.imgImage!.pin_setImage(from: URL(string: news.urlToImg)!)
        
        return cell
    }
}

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
