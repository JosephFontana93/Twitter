//
//  TweetViewController.swift
//  Twitter
//
//  Created by Joseph Fontana on 10/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
            
        dismiss(animated: true, completion: nil)
    
    }
    
    
    @IBAction func tweet(_ sender: Any) {
    
        if(!tweetTextView.text.isEmpty){
            
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet")
                self.dismiss(animated: true, completion: nil)
            })
            
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.becomeFirstResponder()
        
        var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        tweetTextView.layer.borderWidth = 0.5
        tweetTextView.layer.borderColor = borderColor.cgColor
        tweetTextView.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
