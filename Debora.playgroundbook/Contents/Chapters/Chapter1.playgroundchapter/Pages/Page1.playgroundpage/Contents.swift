//: ### Testando títulos

//: título 1

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



/*---- placeholder text ----*/
for i in 1 ... /*#-editable-code digite numero aqui*//*#-end-editable-code*/ {
    say(/*#-editable-code*/<#T##something##String#>/*#-end-editable-code*/)
}

//#-editable-code

//#-end-editable-code


