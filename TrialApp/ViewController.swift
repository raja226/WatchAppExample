//
//  ViewController.swift
//  TrialApp
//
//  Created by MAC on 21/06/21.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController {
    var wcSession:WCSession!
    @IBOutlet weak var txtfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        
        // Do any additional setup after loading the view.
    }


    @IBAction func submitButtonTapped(_ sender: Any) {
        print("\(txtfield.text ?? "")")
        
//        let defaults = UserDefaults.init(suiteName: "group.com.shoplc.TrialApp")
//        defaults?.setValue(txtfield.text, forKey: "message")
//        defaults?.synchronize()
        let message = ["message": txtfield.text ?? ""]
        wcSession.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")

    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")

    }
    
    
}
