//
//  NewsViewController.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/24.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet private weak var tablview: UITableView!
    private var news: [Metadata] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNewsData()
    }
    
    private func getNewsData() {
//        let timeInterval = TimeInterval(999)
//
//        // create NSDate from Double (NSTimeInterval)
//        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        self.view.isLoading = true
        HTTPClient.getRequest(endpoint: "\(Bundle.InfoPlistKeys.BaseURLs.Development.value)/\(Bundle.InfoPlistKeys.NewsURLPath.value)") { (_ result: Result<RequestResponse, Error>) in
            switch result {
            case .success(let data):
                self.news.removeAll()
                for item in data.metadata {
                    self.news.append(item)
                }
                DispatchQueue.main.async {
                    self.view.isLoading = false
                    self.tablview.reloadData()
                }
            case .failure(let error):
                debugPrint(error)
                self.getNewsData()
            }
        }
    }
}



// MARK: - UITableViewDataSource & UITableViewDelegate -

extension NewsViewController: UITableViewDataSource & UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.typeName) as? NewsTableViewCell else { return UITableViewCell() }
        cell.setData(news[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = UIViewController.App.details.asViewController(DetailsViewController.self)
        detailsViewController.metaData = news[indexPath.row]
        self.push(detailsViewController)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
