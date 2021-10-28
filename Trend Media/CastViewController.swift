//
//  CastViewController.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/26.
//

import UIKit

class CastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    



}

extension CastViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell") else {
            return UITableViewCell()
        }
        
        return cell
      
    }
    
    
}
