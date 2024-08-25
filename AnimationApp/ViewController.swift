//
//  ViewController.swift
//  AnimationApp
//
//  Created by Tony Pham on 25/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    var imgIndex: Int = 1
    var timer: Timer!
    var isAnimating = false
    
    @IBOutlet weak var imgGoodnight: UIImageView!
    @IBOutlet weak var btnToggleAnimation: UIButton!
    @IBOutlet weak var btnResetAnimation: UIButton!
    
    func updateImage() {
        print("goodnight-images/goodnight\(imgIndex)")
        imgGoodnight.image = UIImage(named: "goodnight-images/goodnight\(imgIndex)")
    }
    
    @IBAction func changeToNextImage(_ sender: UIButton) {
        if (imgIndex >= 37) {
            imgIndex = 1
        } else {
            imgIndex += 1
        }
        updateImage()
    }
    
    @IBAction func toggleAnimating(_ sender: UIButton) {
        if (isAnimating) {
            isAnimating = false
            btnToggleAnimation.tintColor = .systemBlue
            btnToggleAnimation.setTitle("Animate", for: .normal)
            pauseAnimation()
            btnResetAnimation.isHidden = true
        } else {
            isAnimating = true
            btnToggleAnimation.tintColor = .systemRed
            btnToggleAnimation.setTitle("Pause", for: .normal)
            startAnimation()
            btnResetAnimation.isHidden = false
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeToNextImage(_:)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func startAnimation() {
        startTimer()
    }
    
    func pauseAnimation() {
        stopTimer()
    }
    
    @IBAction func resetAnimation() {
        pauseAnimation()
        imgIndex = 1
        updateImage()
        toggleAnimating(btnToggleAnimation)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgIndex = 1
        updateImage()
    }

}

