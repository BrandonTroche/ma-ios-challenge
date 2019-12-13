//
//  Networking.swift
//  sd-ios-test
//
//  Created by Brandon on 12/12/19.
//  Copyright © 2019 Slickdeals, LLC. All rights reserved.
//

import Foundation

class Networking {
    static let shared = Networking()

    private init() {}

    func getSlickDeals(completion: @escaping ([Deal]) -> Void) {
        let jsonUrlString = "https://slickdeas-api-test.s3-us-west-2.amazonaws.com/get_deals_frontpage.json"

        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            if err != nil {
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {

                guard let data = data else { return }

                do {
                    completion(try JSONDecoder().decode([Deal].self, from: data))

                } catch let respErr {
                    fatalError("There was a problem loading content, please try again. \(respErr.localizedDescription)")
                }

            }
        }.resume()

    }
}
