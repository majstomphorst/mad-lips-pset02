//
//  ViewController.swift
//  mad lips - pset02
//
//  Created by Maxim Stomphorst on 11/04/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var PickerView: UIPickerView!
    
    // creating a counter for the pickerview
    var SelectedStoryCount = 0
    
    // creating options for the pickerview (i wanted to read the contents of the folder but struggles)
    var array = ["clothes","dance","simple","tarzan","university"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PickerView.delegate = self
        PickerView.dataSource = self
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SelectedStoryCount = row
    }
    
    // sending selected story to the next screen (picker view)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? _2_ViewController_userinput {
            secondVC.SelectedStory = array[SelectedStoryCount]
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let thirdVC = segue.destination as? ThirdViewController {
//            thirdVC.story = story.toString()
//        }
//    }


}

