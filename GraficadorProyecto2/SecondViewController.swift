//
//  SecondViewController.swift
//  GraficadorProyecto2
//
//  Created by user130165 on 9/25/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var FigView: FigurasView!
    {
        didSet
        {
            let handler = #selector(FigurasView.changeScale(byReactingto:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: FigView, action: handler)
            FigView.addGestureRecognizer(pinchRecognizer)
            
            let handler2 = #selector(FigurasView.tapOneFinger(byReactingto:))
            let singleFingerTapRecognizer = UITapGestureRecognizer(target: FigView, action: handler2)
            singleFingerTapRecognizer.numberOfTapsRequired = 1
            singleFingerTapRecognizer.numberOfTouchesRequired = 1
            FigView.addGestureRecognizer(singleFingerTapRecognizer)
            
            let handler3 = #selector(FigurasView.tapTwoFinger(byReactingto:))
            let doubleFingerTapRecognizer = UITapGestureRecognizer(target: FigView, action: handler3)
            doubleFingerTapRecognizer.numberOfTapsRequired = 1
            doubleFingerTapRecognizer.numberOfTouchesRequired = 2
            FigView.addGestureRecognizer(doubleFingerTapRecognizer)
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector (goPrevious(swipe:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right
            FigView.addGestureRecognizer(swipeRight)
        }
    }
    
    
    func goPrevious (swipe: UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goBack", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
