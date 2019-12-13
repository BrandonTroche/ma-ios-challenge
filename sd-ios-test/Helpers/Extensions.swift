//
//  Extensions.swift
//  sd-ios-test
//
//  Created by Brandon on 12/12/19.
//  Copyright © 2019 Slickdeals, LLC. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
