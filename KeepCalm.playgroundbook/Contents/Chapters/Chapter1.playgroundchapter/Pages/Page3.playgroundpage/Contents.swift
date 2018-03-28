/*:
 # Coloring my Mandala
 
 Coloring complex geometric patterns are especially popular because they take a simple art activity to an easy and low-cost way to reduce stress and anxiety and help you wind down and relax after a long day.
 
 ### Meanings of colors in Mandalas
 When you uderstand better the meaning of the colors in your Mandalas you're able to create a deeper understanding of you and your feelings.
 Some colors and their meanings are listed down bellow:
 
 **`Red`**:Strength, high energy and passion
 
 **`Orange`**: Creativity, transformation, self-awareness and intuition
 
 **`Yellow`**: Learning, wisdom, laughter and happiness
 
 **`Green`**: Physical healing, psychic ability, love of nature and caring
 
 **`Blue`**: Emotional healding, inner peace and meditation
 
 **`Purple`**: All things spiritual
 
 **`Pink`**: Love, intuition and the feminine
 
 **`White`**: Spiritual focus
 
 **`Black`**: Mystery, deep thinking and individuality
 
 - Important:
 Now you're invited to draw your **personal** Mandala and then paint it with the colors that you like or represent you better.
 ---
 
 # Hints
  - Use one color at a time
  - Take your time
  - Save in your Library and share with your friends
  - HAVE FUN!
 ---
 
 # Final considerations

 In this playground you have learned a little more about Mandalas which are a great way to relieve stress and graphically represent complex personalities. I really hope you have enjoyed this experience and seek to bring into your daily life some small activities that can improve your mental and physical health.

 ---
 
 "*Each person’s life is like a mandala – a vast, limitless circle. We stand in the center of our own circle, and everything we see, hear and think forms the mandala of our life.*" – Pema Chodron
 
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

