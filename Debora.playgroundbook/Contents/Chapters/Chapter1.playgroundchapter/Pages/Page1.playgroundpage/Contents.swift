/*:
 # Title one
 ## Title two
 ### Title three

 We can write a block of text like this. \
 To jump a line use (\\) \
 To use monospaced fonts we use this (`)\
 To make a **bold text** use (**) \
 To make a horizontal line use (---).
 
 To make a list we use (*) and it will looks like:
 * Item one: `markColor` and `backgroundColor`
 * Item two: `isChecked`
 * Item three: `strokeFactor`, `insetFactor`, and `markInsetFactor`
 

 ![Trying to use an image](dog.jpg)
 
 - Important:
 Make important notes \
 to your user.

 >Using the (>) you can make Notes in your text!
 > If you want more than one line, use (>) in each new line.

 - Note:
  Or you can make notes this way!
 
 ````
 thisExampleIsMonospaced()
 ````
 
 - Example:
  You can write examples like this one.
 
 
 
[You can go to the next page here](@next)
 */

//: And you can write only one line.


//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
page.needsIndefiniteExecution = true

//Senf messages to LiveView.swift
func say(_ message: String) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.string(message))
    }
}

// --------------- Copy and paste

//<#T##placeholder name##type# >

//#-code-completion( everything, show, moveForward(), turnLeft(), collectGem(), toggleSwitch())

//#-editable-cod e
//#-end-editable-cod e


//#-end-hidden-code

//#-code-completion(everything, show, moveForward(), turnLeft(), collectGem(), toggleSwitch())

//#-editable-code
text here
//#-end-editable-code

funcao(/*#-editable-code*/<#T##color##UIColor#>/*#-end-editable-code*/)



