//
//  ViewController.swift
//  AnimationApp
//
//  Created by Tony Pham on 25/8/24.
//  sound from: uppbeat.io

import UIKit
import AVFoundation

class AnimationVC: UIViewController {
    
    // MARK: - Properties
    var imgIndex: Int = 1
    var timer: Timer!
    var isAnimating: Bool = false
    var audioPlayer: AVAudioPlayer!
    var isSoundOn: Bool = false
    var soundName: String = "goodnight-sound"
    
    // MARK: - Outlets
    @IBOutlet weak var imgGoodnight: UIImageView!
    @IBOutlet weak var btnToggleAnimation: UIButton!
    @IBOutlet weak var btnResetAnimation: UIButton!
    @IBOutlet weak var swToggleSound: UISwitch!
    @IBOutlet weak var lblSoundName: UILabel!
    
    // MARK: - Actions
    @IBAction func changeToNextImage(_ sender: UIButton) {
        if (imgIndex >= 37) {
            imgIndex = 1
        } else {
            imgIndex += 1
        }
        updateImage()
    }
    
    @IBAction func toggleAnimation(_ sender: UIButton) {
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
    
    @IBAction func resetAnimation() {
        lblSoundName.text = soundName
        pauseAnimation()
        imgIndex = 1
        updateImage()
        isAnimating = true
        toggleAnimation(btnToggleAnimation)
        isSoundOn = true
        swToggleSound.isOn = isSoundOn
        prepareAudioPlayer()
    }
    
    @IBAction func toggleSound(_ sender: UISwitch) {
        if (isSoundOn) {
            isSoundOn = false
            audioPlayer.stop()
        } else {
            isSoundOn = true
            audioPlayer.play()
        }
        swToggleSound.isOn = isSoundOn
    }
    
    // MARK: - Helper Methods
    func updateImage() {
        print("goodnight-images/goodnight\(imgIndex)")
        imgGoodnight.image = UIImage(named: "goodnight-images/goodnight\(imgIndex)")
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeToNextImage(_:)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if (timer != nil) {
            timer.invalidate()
        }
    }
    
    func startAnimation() {
        startTimer()
        if (isSoundOn) {
            audioPlayer?.play()
        }
        updateImage()
    }
    
    func pauseAnimation() {
        stopTimer()
        audioPlayer?.stop()
    }
    
    func prepareAudioPlayer() {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        else {
            print("Music file is not found!")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            print("\(soundName) will be played!")
        } catch {
            print("Error initializing AVAudioPlayer: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Unwind Segue
    
    // Challenge 1: Hiệu chỉnh để khi người dùng click vào nút "Select This Sound" thì sẽ được quay về (unwind back) AnimationVC.
    // Challenge 4: Xử lý thông tin trong IBAction unwind... tương ứng để có thể đọc được giá trị của biến selectedSound trong SoundSelectionVC và hiển thị ra màn hình giá trị tương ứng.
    // Challenge 5: Cập nhật và play file âm thanh tương ứng.
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgIndex = 1
        isSoundOn = true
        swToggleSound?.isOn = isSoundOn
        updateImage()
        lblSoundName.text = soundName
        prepareAudioPlayer()
    }
}


