//
//  SlickDeals.swift
//  sd-ios-test
//
//  Created by Brandon on 12/12/19.
//  Copyright © 2019 Slickdeals, LLC. All rights reserved.
//

struct Deal: Decodable {
    let id: Int?
    let title: String?
    let price: String?
    let extra: String?
    let up_votes: Int?
    let comments: Int?
    let image: String?
    let store_name: String?
    let show_flag: Bool?
    let flag_text: String?
    let flag_text_color: String?
    let flag_background_color: String?

    func getScore() -> Int { return ( (up_votes ?? 0) + (comments ?? 0) * 8 )}

    func parsePrice() -> Float? {
        guard let price = price else { return nil }

        var returnPrice: Float?

        if price == "FREE" {
            return 0
        }

        let numericPrice = price.replacingOccurrences(of: "$", with: "")

        returnPrice = Float(numericPrice)

        return returnPrice
    }

}
