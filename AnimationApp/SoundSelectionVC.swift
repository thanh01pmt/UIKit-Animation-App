//
//  SoundSelectionVC.swift
//  AnimationApp
//
//  Created by Tony Pham on 2/9/24.
//

import UIKit

class SoundSelectionVC: UIViewController {
    
    @IBAction func selectCurrentSound(_ sender: Any) {
        //sendData()
    }
    
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
    
    func sendData() {
        performSegue(withIdentifier: "unwindToAnimation", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

extension SoundSelectionVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = soundNames[indexPath.row]
        // cell.detailTextLabel?.text = "This is the detail of \(soundNames[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSound = soundNames[indexPath.row]
        print("You selected \(selectedSound ?? "nothing!")")
        // sendData()
    }
}
