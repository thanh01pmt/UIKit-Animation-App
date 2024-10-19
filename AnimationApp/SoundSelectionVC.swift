//
//  SoundSelectionVC.swift
//  AnimationApp
//
//  Created by Tony Pham on 2/9/24.
//

import UIKit

class SoundSelectionVC: UIViewController {
        
    @IBOutlet weak var tableSound: UITableView!
    
    var soundNames: [String] = [
        "catch-my-breath-ambient-boy", "goodnight-moon-sensho",
        "goodnight-sound", "imple-mornings-lloom", 
        "in-stillness-tranquilium", "into-the-night-peter-lainson",
        "lapping-water-soft-volo", "night-in-venice-kevin-macleod",
        "meadow-ambience-with-stream-and-birds-tomas-herudek",
        "night-spirit-dope-cat", "night-swim-lloom",
        "our-goodnight-philip-g-anderson-waterway-music",
        "rain-on-roof-with-birdsong-volo", "sanguine-night-drift",
        "rain-pouring-hitting-window-weary-pines",
        "silent-fields-escape-by-night",
        "to-you-peter-lainson", "wanderlust-justin-lee"
    ]
    
    var selectedSound: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// Challenge 1: Hiệu chỉnh để khi người dùng click vào nút "Select This Sound" thì sẽ được quay về (unwind back) AnimationVC.

// Challenge 2: Tạo extension cho SoundSelectionVC để SoundSelectionVC có thể conform với UITableView.

// Challenge 3: Hiệu chỉnh bổ sung thêm chức năng khi người dùng click chọn một item trong table thì biến selectedSound sẽ được cập nhật tương ứng.

