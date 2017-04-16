//
//  ThirdViewController.swift
//  mad lips - pset02
//
//  Created by Maxim Stomphorst on 15/04/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    // MARK: propertys
    @IBOutlet weak var StoryView: UITextView!
    
    var story = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.hidesBackButton = true
        
        StoryView.text = story
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    @IBAction func Home(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
