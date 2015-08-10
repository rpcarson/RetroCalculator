//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Reed Carson on 5/4/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit


let numberFormatter = NSNumberFormatter()


class ViewController: UIViewController {
    
    var firstNumber = ""
    
    var secondNumber = ""
    
    var currentOperation = ""
    
    var calculatedNumber = ""
    
    var currentNumber = ""
    
    var currentNum1 = ""
    
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func Clear(sender: UIButton) {
        
        Label.text = ""
        firstNumber = ""
        secondNumber = ""
        currentOperation = ""
        calculatedNumber = ""
        currentNumber = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backSpace(sender: UIButton) {
        
        if currentNumber.isEmpty || calculatedNumber != "" { return }
        
        if currentOperation.isEmpty {
            
            if firstNumber == "" { return }
            
            currentNumber = dropLast(currentNumber)
            
            if currentNumber == "-" {
                
                currentNumber = ""
            }
            
            firstNumber = currentNumber
                
            Label.text = firstNumber
            
        } else  {
            
            if secondNumber == "" { return }
            
            currentNumber = dropLast(currentNumber)

            if currentNumber == "-" {
                
                currentNumber = ""
                
            }
            
            secondNumber = currentNumber
        
            Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
            
        }
        
    }
    
    
    @IBAction func invertValue(sender: UIButton) {
        
        var currentNum1 = numberFormatter.numberFromString("\(currentNumber)")
        
        if calculatedNumber != "" { return }
        
        if currentNumber == firstNumber && currentOperation == "" {
            
            if currentNum1 != nil {
                
                var numberFloat = currentNum1!.doubleValue
                
                numberFloat = numberFloat * -1
                
                if numberFloat % 1 == 0 {
                    
                    let formattedValue = String(format: "%.0f", numberFloat)
                    
                    firstNumber = "\(formattedValue)"
                    
                    println(numberFloat)
                    
                } else {
                    
                    firstNumber = "\(numberFloat)"
                    
                    println(numberFloat)
                    
                }
                
                if currentOperation.isEmpty { Label.text = firstNumber
                
                } else { Label.text = "\(firstNumber) \(currentOperation)" }
                
                currentNumber = firstNumber
                
            }
            
        }
        
        if currentNumber == secondNumber {
            
            if currentNum1 != nil {
                
                var numberFloat = currentNum1!.doubleValue
                
                numberFloat = numberFloat * -1
                
                if numberFloat % 1 == 0 {
                    
                    let formattedValue = String(format: "%.0f", numberFloat)
                    
                    secondNumber = "\(formattedValue)"
                    
                } else {
                    
                    secondNumber = "\(numberFloat)"
                    
                }
                
                Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
                
                currentNumber = secondNumber
                
            }
        }
        
    }
    
    @IBAction func ButtonPress(sender: UIButton) {
        
        println(" current number is \(currentNumber)")
        
        let number = sender.currentTitle!
        
        if sender.currentTitle == "." && (currentNumber.rangeOfString(".") != nil) { return }
        
        if calculatedNumber != "" {
            
            calculatedNumber = ""
            firstNumber = ""
            secondNumber = ""
            currentOperation = ""
            
        }
        
        if currentOperation.isEmpty {
            
            
            if sender.currentTitle == "." && (currentNumber == "") {
                
                firstNumber = "0"
                
            }
            
            firstNumber += number
            
            currentNumber = firstNumber

            Label.text = currentNumber
            
        }
            
        else
            
        {
            
            if sender.currentTitle == "." && (currentNumber == "") {
                
                secondNumber = "0"
                
            }
            
            secondNumber += number
            
            currentNumber = secondNumber
            
            Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
            
            println(currentNumber)
            
        }
        
        
        println("second number = \(secondNumber)")
        println("first number = \(firstNumber)")
        println("current = \(currentNumber)")
        
        
    }
    
    @IBAction func Operation(sender: UIButton) {

        
        if firstNumber.hasSuffix(".") {
            
            firstNumber = firstNumber + "0"
            
        }
        
        
        currentNumber = ""
        
        let number1 = numberFormatter.numberFromString("\(firstNumber)")
        let number2 = numberFormatter.numberFromString("\(secondNumber)")
        
        let operation = sender.currentTitle!
        
        println(sender.currentTitle!)
        
        if operation != "=" {
            
            if calculatedNumber != "" {
                
                firstNumber = calculatedNumber
            
                secondNumber = ""
                
                calculatedNumber = ""
            }
            
            
            if firstNumber != "" {
                
                currentOperation = operation
                
                Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
                
                
            }
            
        }
            
        else
            
        {
            switch currentOperation
                
            {
                
            case "%":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = (numberFloat1 * numberFloat2)/100
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        calculatedNumber = "\(formattedValue)"
                        firstNumber = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        calculatedNumber = "\(val3)"
                        firstNumber = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
                    secondNumber = ""
                    currentOperation = ""
                    
                }
                
            case "+":
                
//                if calculatedNumber != "" {
//                    
//                    firstNumber = calculatedNumber
//                }
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 + numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        calculatedNumber = "\(formattedValue)"
                        firstNumber = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        calculatedNumber = "\(val3)"
                        firstNumber = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
//                    secondNumber = ""
//                    currentOperation = ""
                    
                }
                
            case "-":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 - numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        calculatedNumber = "\(formattedValue)"
                        firstNumber = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        firstNumber = "\(val3)"
                        calculatedNumber = "\(val3)"
                        
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
//                    secondNumber = ""
//                    currentOperation = ""
                    
                }
                
            case "X":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 * numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        calculatedNumber = "\(formattedValue)"
                        firstNumber = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        calculatedNumber = "\(val3)"
                        firstNumber = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
//                    secondNumber = ""
//                    currentOperation = ""
                    
                }
                
            case "÷":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 / numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        calculatedNumber = "\(formattedValue)"
                        firstNumber = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        calculatedNumber = "\(val3)"
                        firstNumber = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
//                    secondNumber = ""
//                    currentOperation = ""
                    
                }
                
                
            default :
                
                println("no case")
                
            }
            
        }
        
    }
    
}

