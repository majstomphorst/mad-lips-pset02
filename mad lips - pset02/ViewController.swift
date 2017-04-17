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
    
    var SelectedStoryCount = 0
    var array = ["clothes","dance","simple","tarzan","university"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PickerView.delegate = self
        PickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
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

