//
//  ViewController.swift
//  IntroduceYourself
//
//  Created by Lucas Lopez on 8/24/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var petsStepper: UIStepper!
    @IBOutlet weak var schoolImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        petsStepper.minimumValue = 0
        petsStepper.maximumValue = 10
        petsStepper.stepValue = 1
        petsStepper.value = 0
        numberOfPetsLabel.text = "0"
        
        if yearSegmentedControl.numberOfSegments == 0 {
            ["First", "Second", "Third", "Fourth"].enumerated().forEach { index, title in
                yearSegmentedControl.insertSegment(withTitle: title, at: index, animated: false)
            }
            yearSegmentedControl.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex) ?? "First"
        
        let first = (firstNameTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let last  = (lastNameTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let school = (schoolNameTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        
        let petCount = Int(petsStepper.value)
        let petWord = petCount == 1 ? "pet" : "pets"
        let wantsMore = morePetsSwitch.isOn ? "do" : "do not"
        
        let introduction = """
        My name is \(first) \(last) and I attend \(school).
        I am currently in my \(year.lowercased()) year and I own \(petCount) \(petWord).
        I \(wantsMore) want more pets.
        """
        
        print(introduction)
        
        let alert = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nice to meet you!", style: .default))
        present(alert, animated: true)
    }
}
