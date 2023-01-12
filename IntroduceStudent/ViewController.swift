//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by David Pegg on 1/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var bgState : Int = 0
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        ageLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func toggleBackgroundDidTapped(_ sender: UIButton) {
        bgState = (bgState == 0) ? 1 : 0
        switch bgState {
        case 0:
            self.view.backgroundColor = UIColor.systemGray6
        case 1:
            self.view.backgroundColor = UIColor.systemBackground
        default:
            self.view.backgroundColor = UIColor.systemBackground
        }
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // Lets us choose the title we have selected from the segmented control
        // In our example that is whether it is first, second, third or fourth
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)!.lowercased()
                
        // Creating a constant of type string that holds an introduction. The introduction receives the values from the outlet connections.
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!), " +
        "I am \(ageLabel.text!) year\(Int(ageLabel.text!) == 1 ? "" : "s") old, " +
        "and I attend \(schoolNameTextField.text!). " +
        "I am currently in my \(year) year and I own \(numberOfPetsLabel.text!) dog" +
        "\(Int(numberOfPetsLabel.text!) == 1 ? "" : "s"). " +
        "It is \(morePetsSwitch.isOn) that I want more pets."
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

