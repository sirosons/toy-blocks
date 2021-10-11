//
//  ViewController.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

struct Root : Codable {
    let data : [BlockData]
}

struct BlockData : Codable {
    let id : String
    let type: String
    let attributes : AttributeData
}

struct AttributeData : Codable {
    let index : Int
    let timestamp: Int
    let data : String
    let hash: String
}

class TableViewViewController: UITableViewController {
    var tableViewData = [Node]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Toy Blocks";
        
        let node1 = Node(url: "https://thawing-springs-53971.herokuapp.com", name: "Thawing Springs")
        let node2 = Node(url: "https://secret-lowlands-62331.herokuapp.com", name: "Secret Lowlands")
        let node3 = Node(url: "https://calm-anchorage-82141.herokuapp.com", name: "Calm Anchorage")
        let node4 = Node(url: "http://localhost:3002", name: "Node 4")

        tableViewData = [node1, node2, node3, node4]
    }

}

// MARK: - Helpers

extension TableViewViewController {
    
    private func reload(section: Int) {
        DispatchQueue.main.async {
            self.tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        }
    }
    
    func getNumberOfRows(section: Int) -> Int {
        let node = tableViewData[section]
        return node.open ? node.blocks.count + 1 : 1
    }
}

// MARK: - Table view data source

extension TableViewViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumberOfRows(section: section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let node = tableViewData[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NodeTableViewCell") as! NodeTableViewCell
            cell.selectionStyle = .none
            cell.nameLabel.text = node.name
            cell.urlLabel.text = node.url
            return cell
        } else {
            let index = indexPath.row - 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlockTableViewCell") as! BlockTableViewCell
            cell.selectionStyle = .none
            cell.indexLabel.text = node.blocks[index].id
            cell.contentLabel.text = node.blocks[index].data
            return cell
        }
    }
}

// MARK: - Table view delegate

extension TableViewViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 0 else { return }
        let node = tableViewData[indexPath.section]
        node.open = !node.open
        
        if node.blocks.isEmpty {
            LoaderView.show()
            NetworkingManager().getData(url: node.url) { result in
                LoaderView.hide()
                switch result {
                case .success(let root):
                    print(root.data.count)
                    node.blocks = root.data.compactMap({ Block(id: $0.id, data: $0.attributes.data) })
                    self.reload(section: indexPath.section)
                case .failure(let error):
                    self.showAlert(message: error.localizedDescription)
                }
            }
        } else {
            self.reload(section: indexPath.section)
        }
    }
}


// MARK: - Alert

extension UIViewController {
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
