//
//  ResultsViewController.swift
//  APPI
//
//  Created by Илья on 09.09.2022.
//

import UIKit

final class ResultsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var catLabel: UILabel!
    @IBOutlet var catDescription: UILabel!
    
    @IBOutlet var resultsImageView: UIImageView!
    @IBOutlet var startTestAgainButton: UIButton!
    
    // MARK: - Properties
    var answers: [Answer]!
    
    var resultImage: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTestAgainButton.layer.cornerRadius = 15
        updateRsult()
    }
}

extension ResultsViewController {
    private func updateRsult() {
        var frequencyOfCat: [CatType: Int] = [:]
        
        let cats = answers.map { $0.cat }
        
        for cat in cats {
            if let catTypeCount = frequencyOfCat[cat] {
                frequencyOfCat.updateValue(catTypeCount + 1, forKey: cat)
            } else {
                frequencyOfCat[cat] = 1
            }
        }
        
        let sortedFrequencyOfCats = frequencyOfCat.sorted { $0.value > $1.value }
        guard let mostFrequencyCat = sortedFrequencyOfCats.first?.key else { return }
        
        updateUserInterface(cat: mostFrequencyCat)
    }
    
    // MARK: - Private methods
    private func updateUserInterface(cat: CatType) {
        catLabel.text = "You are a cat - \(cat.rawValue)!"
        resultsImageView.image = UIImage(named: resultImage ?? cat.rawValue)
        catDescription.text = cat.descriptionCat
    }
}
