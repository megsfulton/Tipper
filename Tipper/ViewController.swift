 //
//  ViewController.swift
//  Tipper2
//
//  Created by Megs Fulton on 11/20/16.
//  Copyright © 2016 Megs Fulton. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    // Gradient
    
    @IBOutlet weak var gradientDark: UIImageView!
    @IBOutlet weak var gradientLight: UIImageView!
    @IBOutlet weak var keyboardDark: UIImageView!
    @IBOutlet weak var keyboardLight: UIImageView!
    
    @IBOutlet weak var lineTop: UIImageView!
    @IBOutlet weak var lineMiddle: UIImageView!
    @IBOutlet weak var lineBottom: UIImageView!
    
    // Labels
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipControlButton: UIButton!
    @IBOutlet weak var SplitControlButton: UIButton!
   
    @IBOutlet weak var BillTitle: UILabel!
    @IBOutlet weak var TotalTitle: UILabel!
    @IBOutlet weak var TipTitle: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    var BillInput: String = ""
    var BillCalc: String = ""
    
    // Tip Control
    
    @IBOutlet weak var EighteenButton: UIButton!
    @IBOutlet weak var TwentyButton: UIButton!
    @IBOutlet weak var TwentyFiveButton: UIButton!
    @IBOutlet weak var TipControlLabel: UILabel!
    var TipPercentage = 0.2
    
    // Split Control

    @IBOutlet weak var SplitControlLabel: UILabel!
    @IBOutlet weak var SplitIcon: UIImageView!
    @IBOutlet weak var SplitIconDark: UIImageView!
    @IBOutlet weak var OneButton: UIButton!
    @IBOutlet weak var TwoButton: UIButton!
    @IBOutlet weak var ThreeButton: UIButton!
    @IBOutlet weak var FourButton: UIButton!
    var billSplit = 1
    
    // Keyboard
    
    
    @IBOutlet weak var keyOne: UIButton!
    @IBOutlet weak var keyTwo: UIButton!
    @IBOutlet weak var keyThree: UIButton!
    @IBOutlet weak var keyFour: UIButton!
    @IBOutlet weak var keyFive: UIButton!
    @IBOutlet weak var keySix: UIButton!
    @IBOutlet weak var keySeven: UIButton!
    @IBOutlet weak var keyEight: UIButton!
    @IBOutlet weak var keyNine: UIButton!
    @IBOutlet weak var keyZero: UIButton!
    
    @IBOutlet weak var keyDecimal: UIButton!
    @IBOutlet weak var keyBack: UIButton!
    
    let brightnessNotif = Notification.Name.UIScreenBrightnessDidChange

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //NotificationCenter.default.post(Notification(name:.UIScreenBrightnessDidChange))
        
        let nc = NotificationCenter.default
        nc.addObserver(forName:brightnessNotif, object:nil, queue:nil, using:catchNotification)
        
        
        // Disable Bill Field
        
        billField.isUserInteractionEnabled = false

        
        // Round Buttons
        
        TipControlButton.layer.cornerRadius = 4
        TipControlButton.layer.borderWidth = 1
        EighteenButton.layer.cornerRadius = 4
        EighteenButton.layer.borderWidth = 1
        EighteenButton.alpha = 0

        TwentyButton.layer.cornerRadius = 4
        TwentyButton.layer.borderWidth = 1
        TwentyButton.alpha = 0

        TwentyFiveButton.layer.cornerRadius = 4
        TwentyFiveButton.layer.borderWidth = 1
        TwentyFiveButton.alpha = 0

        SplitControlButton.layer.cornerRadius = 4
        SplitControlButton.layer.borderWidth = 1
        
        OneButton.layer.cornerRadius = 4
        OneButton.layer.borderWidth = 1
        OneButton.alpha = 0
        
        TwoButton.layer.cornerRadius = 4
        TwoButton.layer.borderWidth = 1
        TwoButton.alpha = 0
        
        ThreeButton.layer.cornerRadius = 4
        ThreeButton.layer.borderWidth = 1
        ThreeButton.alpha = 0
        
        FourButton.layer.cornerRadius = 4
        FourButton.layer.borderWidth = 1
        FourButton.alpha = 0
        
        // Add Gestures
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        swipeUp.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        swipeDown.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeDown)
        

        // Determine Brightness
        print(UIScreen.main.brightness);

        
        // Dark
        
        if (UIScreen.main.brightness) < 0.5 {
            print("Less than",[UIScreen.main.brightness]);

            darkRoom()


        }
            
        // Light

        else  {
            print("Greater Than",[UIScreen.main.brightness]);
            
            lightRoom()

        }
    
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func catchNotification(notification:Notification) -> Void {
        print("Screen Change")
        
        // Dark
        
        if (UIScreen.main.brightness) < 0.5 {
            print("Less than",[UIScreen.main.brightness]);
            
            darkRoom()
            
            
        }
            
            // Light
            
        else  {
            print("Greater Than",[UIScreen.main.brightness]);
            
            lightRoom()
            
        }

        
        
    }
    
 //----------------------CUSTOM KEYBOARD----------------------//
    

    @IBAction func keyTapped(sender: UIButton) {
        
        
        if (BillInput.characters.count) < 1 {
            // billField.text = billField.text.insert("$", atIndex: 0)
        
            let zeroCount = sender.titleLabel!.text!
            var zeroChar = false
            var decChar = false

            if zeroCount == "0" {
                zeroChar = true
                print("zeroCharTrue")

            }
            if zeroCount == "." {
                decChar = true
                print("decCharTrue")
            }
            
            if decChar == false && zeroChar == false {
                billField.text = "$" + (billField.text?.appending(sender.titleLabel!.text!))!

                BillInput = billField.text!
                calculateTipFunction()
            
            }
            
        }
        
        else if (BillInput.characters.count) >= 1 {
            billField.text = (billField.text?.appending(sender.titleLabel!.text!))!
            // billField.text = billField.text.insert("$", atIndex: 0)
        
            BillInput = billField.text!
            
            calculateTipFunction()
        }

    }
    
    @IBAction func backspace(sender: UIButton) {
        
        if (BillInput.characters.count) > 0 {
          BillInput.remove(at: BillInput.index(before: BillInput.endIndex))
        
          billField.text = BillInput
        
          calculateTipFunction()
            
        }
        
        if (BillInput.characters.count) == 1 {
            BillInput.remove(at: BillInput.index(before: BillInput.endIndex))
            
            billField.text = BillInput
            
            calculateTipFunction()
            
        }
        
    }


 //----------------------CALCULATE TIP----------------------//
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    
    @IBAction func calculateTip(_ sender: Any) {
         calculateTipFunction()
       
    }
    
    func calculateTipFunction() {
        
        
        if (billField.text?.characters.count)! > 1 {
            BillCalc = BillInput
            BillCalc.remove(at: BillCalc.startIndex)
            
        }
        else {
            BillCalc = BillInput
        }
        
        let bill = Double(BillCalc) ?? 0
        let tip = bill * TipPercentage
        let subtotal = bill + tip
        let split = Double(billSplit)
        
        let total = subtotal / split
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
        
    }
    

 //----------------------CHANGE TIP %----------------------//
    
    @IBAction func ChangeTipPercent(_ sender: UIButton) {
        // Fade out to set the text
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.tipLabel.alpha = 0.0
            self.TipControlButton.alpha = 0.0
            self.TipControlLabel.alpha = 0.0

            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.EighteenButton.alpha = 1.0
            self.TwentyButton.alpha = 1.0
            self.TwentyFiveButton.alpha = 1.0
            
            
        }, completion: nil)
        
    }
    
    

    func FadeBackIn() {
        
        calculateTipFunction()
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
        
            self.EighteenButton.alpha = 0.0
            self.TwentyButton.alpha = 0.0
            self.TwentyFiveButton.alpha = 0.0
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.tipLabel.alpha = 1.0
            self.TipControlButton.alpha = 1.0
            self.TipControlLabel.alpha = 1.0

        }, completion: nil)
    }
    
    @IBAction func EighteenPercent(_ sender: UIButton) {
        
        TipControlLabel.text = String("18%")
        TipPercentage = 0.18
        FadeBackIn()
    }
    
    @IBAction func TwentyPercent(_ sender: UIButton) {
       
        TipControlLabel.text = String("20%")
        TipPercentage = 0.2
        FadeBackIn()
    }
    
    @IBAction func TwentyFivePercent(_ sender: UIButton) {
        
        TipControlLabel.text = String("25%")
        TipPercentage = 0.25
        FadeBackIn()
    }
    
    
//----------------------BILL SPLIT----------------------//
    @IBAction func ChangeBillSplit(_ sender: UIButton) {
        // Fade out to set the text
       
        BillTitle.text = String("BILL SPLIT")
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.SplitControlLabel.alpha = 0.0
            self.SplitControlButton.alpha = 0.0
            self.SplitIcon.alpha = 0.0
            self.billField.alpha = 0.0
            //self.BillTitle.alpha = 0.0
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.OneButton.alpha = 1.0
            self.TwoButton.alpha = 1.0
            self.ThreeButton.alpha = 1.0
            self.FourButton.alpha = 1.0
            //self.SplitTitle.alpha = 0.5

            
        }, completion: nil)
        
    }
    
    func FadeBillBackIn() {
        
        calculateTipFunction()
        
        BillTitle.text = String("BILL")

        
        if billSplit > 1 {
            
            TotalTitle.text = String("EACH")

        }
        
        else {
            
            TotalTitle.text = String("TOTAL")
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.OneButton.alpha = 0.0
            self.TwoButton.alpha = 0.0
            self.ThreeButton.alpha = 0.0
            self.FourButton.alpha = 0.0
            //self.SplitTitle.alpha = 0.0
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.SplitControlLabel.alpha = 1.0
            self.SplitControlButton.alpha = 1.0
            self.SplitIcon.alpha = 1.0
            self.billField.alpha = 1.0
            //self.BillTitle.alpha = 0.5
            
        }, completion: nil)
    }
    
    @IBAction func splitOne(_ sender: UIButton) {
        
        SplitControlLabel.text = String("1")
        billSplit = 1
        FadeBillBackIn()
    }
    
    @IBAction func splitTwo(_ sender: UIButton) {
        
        SplitControlLabel.text = String("2")
        billSplit = 2
        FadeBillBackIn()
    }
    
    @IBAction func splitThree(_ sender: UIButton) {
        
        SplitControlLabel.text = String("3")
        billSplit = 3
        FadeBillBackIn()
    }

    @IBAction func splitFour(_ sender: UIButton) {
        
        SplitControlLabel.text = String("4")
        billSplit = 4
        FadeBillBackIn()
    }
    
    
    
    //----------------------CONTROL COLORS----------------------//
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {

            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                darkRoom()
            
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                lightRoom()

            default:
                break
            }
        }
    }
    
    func darkRoom() {
        // Gradients
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.gradientDark.alpha = 1
            self.gradientLight.alpha = 0
            
            self.keyboardDark.alpha = 1
            self.keyboardLight.alpha = 0
            
            // Titles
            
            self.BillTitle.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
            self.TipTitle.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
            self.TotalTitle.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
            
            // Lables
            self.tipLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            self.totalLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            self.billField.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            
        }, completion: nil)
        
        
        
        
        lineTop.image = UIImage(named: "line")
        lineMiddle.image = UIImage(named: "line")
        lineBottom.image = UIImage(named: "line")
        
        
        
        
        
        // Tip % Buttons
        
        TipControlLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.6)
        
        TipControlButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.20).cgColor
        TipControlButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        
        EighteenButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        EighteenButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        EighteenButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        TwentyButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        TwentyButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        TwentyButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        TwentyFiveButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        TwentyFiveButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        TwentyFiveButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        // Split Buttons
        
        SplitIcon.image = UIImage(named: "personicon")
        
        SplitControlLabel.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.6)
        
        SplitControlButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.20).cgColor
        SplitControlButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        
        OneButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        OneButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        OneButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        TwoButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        TwoButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        TwoButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        ThreeButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        ThreeButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        ThreeButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        FourButton.layer.borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.50).cgColor
        FourButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05).cgColor
        FourButton.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        billField.attributedPlaceholder = NSAttributedString(string: "$0.00",
                                                             attributes: [NSForegroundColorAttributeName: UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.2)
            ])
        
        // Keyboard
        
        keyOne.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyTwo.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyThree.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyFour.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyFive.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keySix.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keySeven.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyEight.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyNine.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyZero.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        keyDecimal.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        keyBack.setImage(UIImage(named: "delete"), for: .normal)
    }
    
    
    func lightRoom() {
       
        // Gradients
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.gradientDark.alpha = 0
            self.gradientLight.alpha = 1
            
            self.keyboardDark.alpha = 0
            self.keyboardLight.alpha = 1
            
            // Titles
            
            self.BillTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
            self.TipTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
            self.TotalTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
            
            // Lables
            self.tipLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
            self.totalLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
            self.billField.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
            
        }, completion: nil)
        
       
        
        lineTop.image = UIImage(named: "linedark")
        lineMiddle.image = UIImage(named: "linedark")
        lineBottom.image = UIImage(named: "linedark")
        
        // Lables
        tipLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        totalLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        billField.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        
        // Titles
        
        BillTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
        TipTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
        TotalTitle.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.5)
        
        // Tip % Buttons
        
        TipControlLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.6)
        
        TipControlButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        TipControlButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        
        EighteenButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        EighteenButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        EighteenButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        TwentyButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        TwentyButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        TwentyButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        TwentyFiveButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        TwentyFiveButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        TwentyFiveButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        // Split Buttons
        
        SplitIcon.image = UIImage(named: "personicon_dark")
        
        
        SplitControlLabel.textColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.6)
        
        SplitControlButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        SplitControlButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        
        OneButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        OneButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        OneButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        TwoButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        TwoButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        TwoButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        ThreeButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        ThreeButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        ThreeButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        FourButton.layer.borderColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.25).cgColor
        FourButton.layer.backgroundColor = UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.05).cgColor
        FourButton.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        billField.attributedPlaceholder = NSAttributedString(string: "$0.00",
                                                             attributes: [NSForegroundColorAttributeName: UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 0.2)
            ])
        
        // Keyboard
        
        keyOne.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyTwo.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyThree.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyFour.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyFive.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keySix.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keySeven.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyEight.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyNine.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyZero.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        keyDecimal.setTitleColor(UIColor(red: 46.0/255.0, green: 22.0/255.0, blue: 68.0/255.0, alpha: 1.0), for: .normal)
        
        keyBack.setImage(UIImage(named: "DeleteDark"), for: .normal)
        
    }
}
