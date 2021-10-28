//
//  MovieListViewController.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/25.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON


class MovieListViewController: UIViewController, UITableViewDataSourcePrefetching{
    
    var queryString = "" {
        didSet {
            
        }
    }
    //셀이 화면에 보이기 전에 필요한 리소스를 미리 다운 받는 기능
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if movieData.count - 1 == indexPath.row{
                startpage += 10
                fetchMovieData(query: movieSearchBar.text ?? "")
                
            }
        }
    }
    
    //취소
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancel \(indexPaths)")
    }
    
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var startpage:Int = 1
    var totalCount = 0
    
    var request:DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    var movieData:[MovieModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        movieSearchBar.delegate = self
        
        //fetchMovieData(query: <#T##String#>)
    }
    
    func fetchMovieData(query:String){
        
        if let query = //movieSearchBar.text?"
            query.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed){
            
            
            //url 변경
            let url = "https://openapi.naver.com/v1/search/movie.json?query=\(query)&display=15&start=\(startpage)"
            let header:HTTPHeaders = [
                "X-Naver-Client-Id":"g94PsX8GNeMahxTdTYNI",
                "X-Naver-Client-Secret":"lAv20Ejpph"
            ]
            
            AF.request(url, method: .get, headers: header).validate().responseJSON() { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    self.totalCount = json["total"].intValue
                    
                    for item in json["items"].arrayValue {
                        let value = item["title"].stringValue.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                        let image = item["image"].stringValue
                        let link = item["link"].stringValue
                        let userRating = item["userRating"].stringValue
                        let sub = item["subtitle"].stringValue
                        
                        let data = MovieModel(titleData: value, image: image, link: link, userRating: userRating, subtitle:     sub)
                        self.movieData.append(data)
                    }
                    //반복문 밖에서 갱신
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @objc func search(){
        
    }
    
}
extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieData.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        let row = movieData[indexPath.row]
        let url = URL(string: row.image)
        
        cell.titleLabel.text = row.titleData
        cell.userRating.text = row.userRating
        cell.subtitle.text = row.subtitle
        cell.poster.kf.setImage(with:url)
        
        return cell
    }
    
    
    
    
    
}

extension MovieListViewController:UISearchBarDelegate {
    
    //취소 버튼눌럿을 때 실행
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieData.removeAll()
        tableView.reloadData()
        searchBar.setShowsCancelButton(false, animated: true)
        
    }
    //검색 버튼(키보드 리턴키)를 눌렀을 때
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            
            //초기화
            movieData.removeAll()
            startpage = 1
            fetchMovieData(query: text)
        }
    }
    //커서가 까마ㅃㄱ
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    
}
