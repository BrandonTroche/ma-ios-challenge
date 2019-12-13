//
//  ViewController.swift
//  sd-ios-test
//
//  Created by Fritz Ammon on 9/25/19.
//  Copyright © 2019 Slickdeals, LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var dealsArray: [DealSummary] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealsArray.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DealCell", for: indexPath) as? DealCell
        else { return UITableViewCell() }
        cell.dealImage.image = nil
        cell.configure(dealSummary: dealsArray[indexPath.row])
        return cell
    }

    func loadUI() {
        tableView.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "DealCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

        fetchData()
    }

    func fetchData() {
        Networking.shared.getSlickDeals { deals in

            DispatchQueue.main.async {
                for deal in deals {

                    self.dealsArray.append(
                        DealSummary(price: deal.price ?? "",
                                    title: deal.title ?? "N/A",
                                    extra: deal.extra ?? "",
                                    voteCount: deal.up_votes ?? 0,
                                    commentCount: deal.comments ?? 0,
                                    image: URL(string: deal.image ?? "")!)
                    )

                }

                self.tableView.reloadData()
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadUI()
    }
}
