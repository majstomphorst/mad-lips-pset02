//
//  02-ViewController-UserInput.swift
//  mad lips - pset02
//
//  Created by Maxim Stomphorst on 11/04/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class _2_ViewController_userinput: UIViewController, UITextFieldDelegate {
    
    // MARK: propertys
    @IBOutlet weak var instructLabel: UILabel!
    @IBOutlet weak var UserInput: UITextField!
    
    // creating global variable
    var story = Story(stream: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("+++++++++++02-view+++++++++++")
        // opening the story form file on machine
        let path = "/Users/maj/Desktop/test.txt"
        var text = ""
        
        // opening the file and putting the string in text
        do {
            text = try String(contentsOfFile: path)
            print(text)
        } catch {
            print("error")
        }
        
        story = Story(stream: text)
        
        // creatign first instructLabel input
        instructLabel.text = "give me a \(story.getNextPlaceholder()). (\(story.getPlaceholderRemainingCount()) remaing)"
        
        }
    
    // MARK: actions
    @IBAction func submite(_ sender: UIButton) {
        
        let word = UserInput.text
        
        story.fillInPlaceholder(word: word!)
        
        if story.isFilledIn(){
            print("go to next page")
            print(story.toString())
            
            }
        
        // update instructLabel
        instructLabel.text = "give me a \(story.getNextPlaceholder()). (\(story.getPlaceholderRemainingCount()) remaing)"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let thirdVC = segue.destination as? ThirdViewController {
            
            thirdVC.story = story.toString()
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
