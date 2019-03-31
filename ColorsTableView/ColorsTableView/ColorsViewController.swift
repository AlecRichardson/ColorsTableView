//
//  ColorsViewController.swift
//  ColorsTableView
//
//  Created by Alec Richardson on 3/5/19.
//  Copyright © 2019 Alec Richardson. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    var colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    var colors = [Color(name: "red", uiColor: UIColor.red), Color(name: "orange", uiColor: UIColor.orange), Color(name: "yellow", uiColor: UIColor.yellow), Color(name: "green", uiColor: UIColor.green), Color(name: "blue", uiColor: UIColor.blue), Color(name: "purple", uiColor: UIColor.purple), Color(name: "brown", uiColor: UIColor.brown)]
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Colors"
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        cell.backgroundColor = color.uiColor
        cell.selectionStyle = .none
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorsTableView.indexPathForSelectedRow?.row {
            destination.color = colors[row]
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
