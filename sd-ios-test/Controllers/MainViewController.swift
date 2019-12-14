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
    @IBOutlet weak var priceSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var scoreSegmentOutlet: UISegmentedControl!

    var totalLabel: UILabel = {
        let totalLabel = UILabel(
            frame: CGRect(x: 0,
                          y: 0,
                          width: 80,
                          height: 20)
        )
        totalLabel.text = ""
        totalLabel.font = UIFont(name: "System", size: 10)
        return totalLabel
    }()

    let defaults = UserDefaults.standard

    var dealsArrayOriginal: [DealSummary] = []
    var dealsArrayWorking: [DealSummary] = [] {
        didSet {
            totalLabel.text = "\(String(dealsArrayWorking.count)) deals"
        }
    }

    @IBAction func priceSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
           case 0:
                sortList(by: "None")
           case 1:
                sortList(by: "PHL")
                reset(segment: scoreSegmentOutlet)
           case 2:
                sortList(by: "PLH")
                reset(segment: scoreSegmentOutlet)
           default:
                break
        }
    }

    @IBAction func scoreSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                sortList(by: "None")
            case 1:
                sortList(by: "SHL")
                reset(segment: priceSegmentOutlet)
            case 2:
                sortList(by: "SLH")
                reset(segment: priceSegmentOutlet)
            default:
                break
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealsArrayWorking.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DealCell", for: indexPath) as? DealCell
        else { return UITableViewCell() }
        cell.dealImage.image = nil
        cell.configure(dealSummary: dealsArrayWorking[indexPath.row])
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadUI()
    }
}

extension MainViewController {

    func loadUI() {
        tableView.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "DealCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

        self.view.addSubview(totalLabel)

        totalLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIScreen.main.bounds.width - 75),
            totalLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])

        fetchData()

    }

   func checkDefaults() {
       guard let filterSetting = self.defaults.string(forKey: "filter") else { return }
       self.sortList(by: filterSetting)
       switch filterSetting {
           case "SHL":
               self.scoreSegmentOutlet.selectedSegmentIndex = 1
           case "SLH":
               self.scoreSegmentOutlet.selectedSegmentIndex = 2
           case "PHL":
               self.priceSegmentOutlet.selectedSegmentIndex = 1
           case "PLH":
               self.priceSegmentOutlet.selectedSegmentIndex = 2
       default:
           break
       }
   }

   func fetchData() {
       Networking.shared.getSlickDeals { deals in

           DispatchQueue.main.async {
               for deal in deals {

                   let currentDeal = DealSummary(
                       priceTag: deal.price ?? "",
                       associatedPrice: deal.parsePrice(),
                       title: deal.title ?? "N/A",
                       extra: deal.extra ?? "",
                       voteCount: deal.up_votes ?? 0,
                       commentCount: deal.comments ?? 0,
                       image: URL(string: deal.image ?? "")!,
                       score: deal.getScore()
                   )

                   self.dealsArrayWorking.append(currentDeal)

                   self.dealsArrayOriginal.append(currentDeal)

                   self.checkDefaults()

               }

               self.tableView.reloadData()
           }

       }
   }

    func sortList(by sortKind: String) {
        defaults.set(sortKind, forKey: "filter")
        switch sortKind {
        case "SHL":
            dealsArrayWorking = dealsArrayOriginal.sorted { $0.score > $1.score }
            tableView.reloadData()
        case "SLH":
            dealsArrayWorking = dealsArrayOriginal.sorted { $0.score < $1.score }
            tableView.reloadData()
        case "PHL":
            dealsArrayWorking = dealsArrayOriginal.filter { $0.associatedPrice != nil }
            dealsArrayWorking = dealsArrayWorking.sorted { $0.associatedPrice! > $1.associatedPrice! }
            tableView.reloadData()
        case "PLH":
            dealsArrayWorking = dealsArrayOriginal.filter { $0.associatedPrice != nil }
            dealsArrayWorking = dealsArrayWorking.sorted { $0.associatedPrice! < $1.associatedPrice! }
            tableView.reloadData()
        case "None":
            dealsArrayWorking = dealsArrayOriginal
            tableView.reloadData()
        default:
            break
        }
    }

    func reset(segment Segment: UISegmentedControl) {
        Segment.selectedSegmentIndex = 0
    }
}
