//
//  ViewController.swift
//  MyTrafficLight
//
//  Created by Vadim Shinkarenko on 02.07.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var switchButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        switchButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
        
        print("Размер стороны доступный из viewDidLoad: ", redLightView.frame.height)
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = 90
        yellowLightView.layer.cornerRadius = 90
        greenLightView.layer.cornerRadius = 90
    }
    
    @IBAction func switchLightButton() {
        switchButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            redLightView.alpha = lightIsOn
            currentLight = .yellow
            greenLightView.alpha = lightIsOff
        case .yellow:
            yellowLightView.alpha = lightIsOn
            redLightView.alpha = lightIsOff
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
        }
    }
}

