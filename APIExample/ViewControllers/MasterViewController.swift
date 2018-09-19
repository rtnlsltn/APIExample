//
//  MasterViewController.swift
//  APIExample
//
//  Created by Justin on 9/17/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import Foundation
import UIKit
import AWSAppSync

class NodeCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    func updateValues(title: String?) {
        lblTitle.text = title
    }
}

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var tableView: UITableView!
    var selectedCar: AllNodesQuery.Data.ListCar.Item?
    var nodeList: [AllNodesQuery.Data.ListCar.Item?]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "Car Specifications"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            self.loadAllNodes()
        }
    }
    
    func loadAllNodes() {
        //hardcoded AWS database name, typically I pull my database subset from a single database then build the rest of my objects outward.
        let databaseURL = URL(fileURLWithPath:NSTemporaryDirectory()).appendingPathComponent(database_name)
        do {
            // Initialize the AWS AppSync configuration
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncClientInfo: AWSAppSyncClientInfo(), databaseURL: databaseURL)
            // Initialize the AWS AppSync client
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
        } catch {
            print("Error initializing appsync client. \(error)")
        }
        //Fetch all cars
        appSyncClient?.fetch(query: AllNodesQuery(), cachePolicy: .returnCacheDataAndFetch)  { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            self.nodeList = result?.data?.listCars?.items
        }
    }

    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NodeCell
        let node = nodeList![indexPath.row]!
        let rowString: String = node.modelYear + " " + node.manufacturer + " " + node.model + " " + node.trim
        cell.updateValues(title: rowString)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //Didn't add a method in the API to remove the assets
        return false
    }
    
     // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let node = nodeList![indexPath.row]!
                if let detailViewController = segue.destination as? DetailViewController {
                            //Sending car object to Details. I would have typically utilized a protocol/delegate approach but this method suited the task scope.
                            detailViewController.detailItem = node
                        }
                    }
            //relabel back button
            let btnBack = UIBarButtonItem()
            btnBack.title = "Back"
            navigationItem.backBarButtonItem = btnBack
            }
    }
    
}

