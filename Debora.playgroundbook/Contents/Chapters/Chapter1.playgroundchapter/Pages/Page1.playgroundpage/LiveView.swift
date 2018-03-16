import PlaygroundSupport
import UIKit


class MyViewController : UIViewController, PlaygroundLiveViewMessageHandler {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .white
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 150, y: 50, width:100, height:100)
        button.setTitle("Botão", for: .normal)
        
        
        view.addSubview(label)
        view.addSubview(button)
        self.view = view
    }
    
    //Receive messages from Contents.swift
    public func receive(_ message: PlaygroundValue) {
        if case let .string(text) = message {
            let label = UILabel()
            label.frame = CGRect(x: 200, y: 400, width: 200, height: 20)
            label.text = text
            label.textColor = .white
            self.view.addSubview(label)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

