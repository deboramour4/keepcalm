/*:
 # The Mandala
 ## Mandalas are cool
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

