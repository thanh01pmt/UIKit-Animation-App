//
//  SoundSelectionVC.swift
//  AnimationApp
//
//  Created by Tony Pham on 2/9/24.
//

import UIKit

class SoundSelectionVC: UIViewController {
    
    var soundNames: [String] = [
        "Track1", "Track2", "Track3", "Track4", "Track5",
        "Track6", "Track7", "Track8", "Track9", "Track10"
    ]

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
        cell.detailTextLabel?.text = "This is the detail of \(soundNames[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected \(soundNames[indexPath.row])")
    }
    
}
