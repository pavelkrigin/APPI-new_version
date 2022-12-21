//
//  GetStartViewController.swift
//  APPI
//
//  Created by Илья on 09.09.2022.
//

import UIKit

final class GetStartViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var getStartCatImage: UIImageView!
    @IBOutlet var startTestButton: UIButton!
    
    // MARK: - Properties
    var startCat: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

         getStartCatImage.image = UIImage(named: startCat ?? "getStartCat")
        
        startTestButton.layer.cornerRadius = 15
    }
    
    // MARK: - IBActions
    @IBAction func toStartPageSegue(_ segue: UIStoryboardSegue) {
    }
}
