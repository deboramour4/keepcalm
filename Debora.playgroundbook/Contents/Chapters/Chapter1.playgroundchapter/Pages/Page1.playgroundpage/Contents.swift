//: ### Important things

/*:
 We can write simple text using in `Contents.swift`. To use monospaced fonts we use this (`). To make a list
 * `CGColor`: `markColor` and `backgroundColor`
 * `Bool`: `isChecked`
 * `CGFloat`: `strokeFactor`, `insetFactor`, and `markInsetFactor`
 */


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
//#-end-hidden-code

//#-code-completion(everything, show, moveForward(), turnLeft(), collectGem(), toggleSwitch())

//: Enter a value for the number of repetitions of the `for`
for i in 1 ... /*#-editable-code*/<#T##number of repetitions##Int#>/*#-end-editable-code*/ {
    say(/*#-editable-code*/<#T##something##String#>/*#-end-editable-code*/)
}

//#-editable-code Tap to write your code
//#-end-editable-code

//#-editable-code
// code outdented beyond delimiter
print("This does not render correctly")
//#-end-editable-code


