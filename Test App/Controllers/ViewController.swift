//
//  ViewController.swift
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/23/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let delay = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()

        helloLabel.performSelector("setText:", withObject: "Hello, world!", afterDelay: delay)
    }

    @IBAction func stopSpinner() {
        activityIndicator .performSelector("stopAnimating", withObject: nil, afterDelay: delay)
    }
}
