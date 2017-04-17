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
    @IBOutlet weak var Submite: UIButton!
    @IBOutlet weak var StoryTime: UIButton!
    
    // creating global variable
    var story = Story(stream: "")
    var SelectedStory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide button to next screen until story is completed
        StoryTime.isEnabled = false

        // selecting a story to be read
        let path = Bundle.main.path(forResource: "storys/\(SelectedStory)", ofType: "txt")
        
        // creating empty string to store the story in
        var text = ""
        
        // opening the file and putting the string in text
        do {
            text = try String(contentsOfFile: path!)
        } catch {
            print("error")
        }
        
        // sending story to the story struct
        story = Story(stream: text)
        
        // creatign first instructLabel input
        instructLabel.text = "give me a \(story.getNextPlaceholder().lowercased()). (\(story.getPlaceholderRemainingCount()) remaing)"
        
        }
    
    // MARK: actions
    @IBAction func submite(_ sender: UIButton) {
        
        // getting user input
        let word = UserInput.text
        
        // sending word to story struct
        story.fillInPlaceholder(word: word!)
        
        // update instructLabel
        instructLabel.text = "give me a \(story.getNextPlaceholder()). (\(story.getPlaceholderRemainingCount()) remaing)"
        
        // if the story is completed
        if story.isFilledIn() {
            
            // hiding keyboard
            UserInput.resignFirstResponder()
            
            // tel user story is ready
            instructLabel.text = "Your awesome story is ready!"
            
            // forcing user to go to the story
            StoryTime.isEnabled = true
            UserInput.isEnabled = false
            Submite.isEnabled = false
        }
        
        // empty useer input feelde
        UserInput.text = ""
        
    }
    
    // hide keyboard if user taps anywhere on the screen (fancy!)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.story = story.toString()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press")
        Submite.sendActions(for: .touchUpInside)
        return false
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
