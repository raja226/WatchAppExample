//
//  InterfaceController.swift
//  TrialApp WatchKit Extension
//
//  Created by MAC on 21/06/21.
//

import WatchKit
import Foundation

import WatchConnectivity

class InterfaceController: WKInterfaceController ,WCSessionDelegate {
 
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationState")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        print("raja:::\(message["message"] ?? "")")
        
        lbl.setText("\(message["message"] ?? "")")
        
    }
    @IBOutlet var lbl:WKInterfaceLabel!
    var wcSession:WCSession!

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
      
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
      //  super.willActivate()
//        let defaults = UserDefaults.init(suiteName: "group.com.shoplc.TrialApp")
//
//        print("\(defaults?.value(forKey: "message") ?? "....")")
//        lbl.setText("\(defaults?.value(forKey: "message") ?? "....")")
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        
    }
   
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}

