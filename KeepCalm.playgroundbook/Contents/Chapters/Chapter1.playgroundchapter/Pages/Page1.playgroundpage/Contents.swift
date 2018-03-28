/*:
 
 # Relaxing and anti-stress activities
 Have you ever stopped to think how much daily routine is stressful? It is difficult to find a person who is not stressed.
 
 > The World Health Organization (WHO) has defined stress as a global epidemic because the world is increasingly producing *emotionally altered* individuals.
 
 You can insert small relaxing and stress-free activities into your routine, making your life lighter and more enjoyable. These activities give us pleasure, and allow us to relax the mind and body.
 
 There are several activities that can bring this relief into the routine. Some fun and stress-free activities you can try are listed down below:
 - Dance
 - Visual arts
 - Gardening
 - Yoga
 - Cooking
 - Sport
 
 In this playground we will talk specifically about the **Mandala** and how it can help you relax and reduce stress.
 
 ---
 
 # So what exactly is a Mandala?
 Mandala is Sanskrit for circle. In purest sense, a Mandala is a symbolic representation of the universe a geometric figure that, in modern times, has become synonymous with all unity and balance in the world and in nature and the harmony we seek in our lives.
 
 ![Image of mandalas](mandalas_example.png)
 
 Traditionally, Tibetan Monks are known to make Mandalas with grains of sand, in complex but beautiful designs on a flat surface. It have been used since the ancient times for building focus and attention as well as an aid to meditation and attaining peace of mind while getting rid of anxiety and stress.
 
 ### Drawing Mandalas reduce anxiety and Stress Relief
 Art therapy techniques have now become common, and drawing Mandalas is one of the most powerful techniques of them all.
 
 Drawing Mandalas helps reduce anxiety because of the repetitive and rhythmic movements of your hand and your concentrated attention in creating it, which creates a sense of control and familiarity that you lack when under a great deal of stress.
 
 - Important:
  Just like the Tibetan Monks did, try to create your own mandala in the scene beside.
 
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

