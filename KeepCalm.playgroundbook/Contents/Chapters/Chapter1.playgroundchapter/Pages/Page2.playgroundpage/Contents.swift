/*:
 # Creating my Mandala
 How was the experience? It's a little bit difficult to draw a complex Mandala without outlines or some kind of helping tool.
 
 - Important:
  In the scene beside try to draw a line or a curve and see what happens.
 
 Now drawing your Mandala became easier and satisfying. The slices in the drawing area repeat your line as many times as you want, therefore creating sensation of continuosity. Generating the abstract concept of the mandala.
 
 ### Meaning of my Mandala
 In this page you're invited to take the time to consider the reason for creating a **personal** mandala. The layout and design of your mandala will vary depending on your underlying purpose. A simple mandala can be made with repeating shapes that you find appealing, but for a more meaningful mandala you will want to choose images and shapes that represent you goals or desires.
 
 Consider the meaning of these common symbols to determine if they belong in your mandala:
 
 **`Circles`**: Circles can represent eternity or the infinite. In religious terms, a circle symbolizes unity, wholeness and protection. It can also symbolize the sun.
 
 **`Triangles`**: Triangles with the point facing upward may symbolize spiritual growth, while those with the point down make represent the physical world.
 
 **`Flowers`**: Flowers typically represent life and renewal.
 
 **`Leaves`**: Leaves and vines often represent eternity or rebirth.
 
 **`Hearts`**: Hearts are the universal symbol of love and compassion.
 
 > It’s not about making the most perfect Mandala, but getting in touch with your emotions and knowing yourself and your feelings.
 ---
 
 # Hints
 - Concentrate
 - Put a calm song on the background
 - Take your time
 - Don't focus in a mistake
 ---
 
 [When you're done go to the next page](@next)
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

