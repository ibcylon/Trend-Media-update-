//
//  MainViewController.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/25.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet weak var buttonContainerView: UIView! {
        didSet {
            buttonContainerView.layer.cornerRadius = 10
            buttonContainerView.layer.shadowOffset = .zero
            buttonContainerView.layer.shadowRadius = 10
            buttonContainerView.layer.shadowOpacity = 0.7
            buttonContainerView.layer.masksToBounds = false
        }
    }

    @IBOutlet weak var tableView: UITableView!
    let tvShowList = TvShowList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // XIB
        let nibName = UINib(nibName: MovieInfoTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: MovieInfoTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 갯수 만큼
        return tvShowList.tvShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //assign Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath) as? MovieInfoTableViewCell else {
            return UITableViewCell()
        }
        
        //set Cell
        let row = tvShowList.tvShow[indexPath.row]
        
        cell.setCellByRow(row)
        
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        
        //스토리보드
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        //캐스트 뷰
        let vc = sb.instantiateViewController(withIdentifier: "CastViewController") as! CastViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
