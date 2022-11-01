//
//  ViewController.swift
//  assignment_4
//
//  Created by user227341 on 10/31/22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var calOutput: UILabel!
    var currOuput : Double = 0
    var valTemp : Double = 0
    var currOp = "+"
    var nextInput : Bool = true
    var decimal : Bool = false
    var shift : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calOutput.text = String(currOuput)
    }
    func reset(){
        valTemp = 0
        currOuput = 0
        shift = 0
        decimal = false
        equlAgain = false
        firstInput = true
    }
    /*
     This funciton handles the real time output of the calculator so you can see the
     numbers you are inputting into the calculator
     */
    func updateOutput(input : Double){
        if(currOuput == 0){
            currOuput = input
            calOutput.text = String(currOuput)
        }
        else{
            if(decimal){
                shift += 1
            }
            
            currOuput *= 10
            currOuput += input
            if(decimal){
                calOutput.text = String(currOuput / pow(10.0, Double(shift)))
            }
            else{
                calOutput.text = String(currOuput)
                
            }
            
        }
        
    }
    /*
     This funciton handles a what each operation button does
     */
    var temp : Double = 0.0
    var equlAgain : Bool = false
    var firstInput = true
    func calulate(input : String){
       
        if(nextInput){
            if(decimal){
                currOuput /= pow(10.0, Double(shift))
            }
            decimal = false
            shift = 0
            if(equlAgain == false){
                temp = 0
            }
            switch(input){
                case "+" :
                    valTemp += currOuput
                case "-" :
                if(firstInput){
                    valTemp = currOuput
                    firstInput = false
                }
                else{
                    valTemp -= currOuput
                }
                    
                case "x" :
                    if(firstInput){
                        valTemp = currOuput
                        firstInput = false
                    }
                    else{
                        valTemp *= currOuput
                    }
                case "/" :
                    if(firstInput){
                        valTemp = currOuput
                        firstInput = false
                    }
                    else{
                        valTemp /= currOuput
                    }
                case "%" :
                    if(firstInput){
                        valTemp = currOuput
                        firstInput = false
                    }
                    else{
                        valTemp = Double(Int(valTemp) % Int(currOuput))
                    }
                case "=" :
                    print(temp)
                    temp = currOuput
                    equlAgain = true
                    calulate(input: currOp)
                default :
                    print("Invalid Input")
                
                
            }
            firstInput = false
            if(equlAgain == false){
                currOuput = 0
            }
            else{
                currOuput = temp
                //equlAgain = false
            }
            if(input != "="){
                currOp = input
            }
        }
        
    }
    func repeatEqualFix(){
        if(equlAgain){
            currOuput = 0
        }
        equlAgain = false
    }
    //operations
    
    @IBAction func equButton(_ sender: Any) {
        print("= pressed")
        print(temp)
        calulate(input: "=")
        calOutput.text = String(valTemp)
        
    }
    @IBAction func plusButton(_ sender: Any) {
        repeatEqualFix()
        calulate(input: "+")
         
    }
    
    @IBAction func minusButton(_ sender: Any) {
        repeatEqualFix()
        calulate(input: "-")

    }
    @IBAction func divButton(_ sender: Any) {
        repeatEqualFix()
        calulate(input: "/")

    }
    @IBAction func modButton(_ sender: Any) {
        repeatEqualFix()
        calulate(input: "%")

    }
    @IBAction func mutlButton(_ sender: Any) {
        repeatEqualFix()
        calulate(input: "x")

    }
    
    @IBAction func decButton(_ sender: Any) {
        decimal = true
    }
    
    
    //misc.
    @IBAction func clearButton(_ sender: Any) {
        reset()
        calOutput.text = String(currOuput)
        
    }
    
    @IBAction func signButton(_ sender: Any) {
        currOuput *= -1
        calOutput.text = String(currOuput)
        
    }
    
    //number buttons
    @IBAction func zeroButton(_ sender: Any) {
        updateOutput(input: 0)    }
    @IBAction func oneButton(_ sender: Any) {
        updateOutput(input: 1)    }
    
    @IBAction func twoButton(_ sender: Any) {
        updateOutput(input: 2)    }
    
    @IBAction func threeButton(_ sender: Any) {
        updateOutput(input: 3)    }
    
    @IBAction func fourButton(_ sender: Any) {
        updateOutput(input: 4)    }
    
    @IBAction func fiveButton(_ sender: Any) {
        updateOutput(input: 5)    }
    
    @IBAction func sixButton(_ sender: Any) {
        updateOutput(input: 6)    }
    
    @IBAction func sevenButton(_ sender: Any) {
        updateOutput(input: 7)    }
    
    @IBAction func eightButton(_ sender: Any) {
        updateOutput(input: 8)    }
    
    @IBAction func nineButton(_ sender: Any) {
        updateOutput(input: 9)    }
    
    
    
}

