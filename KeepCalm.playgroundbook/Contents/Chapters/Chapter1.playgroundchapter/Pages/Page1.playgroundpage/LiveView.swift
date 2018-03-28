import PlaygroundSupport
import UIKit


class MyViewController : UIViewController, PlaygroundLiveViewMessageHandler {
    let step: Float = 1
    var slicesLabel = UILabel()
    var lineWidthLabel = UILabel()
    var drawView : DrawView?
    var toolView = UIView()
    var bgImg = UIImageView()
    
    let clear = UIButton(type: .custom)
    let pen = UIButton(type: .custom)
    let save = UIButton(type: .custom)

    override func loadView() {
        let view = UIView()
        // Background
        bgImg.frame = CGRect(x: 0, y: 0, width: 1100, height: 900)
        bgImg.image = UIImage(named: "bg_landscape.png")
        view.addSubview(bgImg)

        //Draw Mandala Area
        drawView = DrawView(frame: CGRect(x: 50, y: 75, width: 400, height: 400))
        drawView?.backgroundColor = .white
        view.addSubview(drawView!)
        
        //Tools Area
        toolView = UIView(frame: CGRect(x: 90, y: 500, width: 325, height: 175))
        //toolView.backgroundColor = .gray
        view.addSubview(toolView)
        
        //Button pencil
        pen.frame = CGRect(x: 50, y: 0, width: 40, height: 40)
        pen.setImage(UIImage(named: "icons/draw.png"), for: .normal)
        pen.setImage(UIImage(named: "icons/draw_black.png"), for: .selected)
        pen.isSelected = true
        pen.addTarget(self, action: #selector(penDraw), for: UIControlEvents.touchDown)
        toolView.addSubview(pen)
        
        //Button clear
        clear.frame = CGRect(x: 130, y: 0, width: 50, height: 50)
        clear.setImage(UIImage(named: "icons/clear.png"), for: .normal)
        clear.setImage(UIImage(named: "icons/clear_black.png"), for: .selected)
        clear.addTarget(self, action: #selector(clearDraw), for: .touchUpInside)
        toolView.addSubview(clear)
        
        //Button save
        save.frame = CGRect(x: 210, y: 5, width: 40, height: 40)
        save.setImage(UIImage(named: "icons/save.png"), for: .normal)
        save.setImage(UIImage(named: "icons/save_black.png"), for: .selected)
        save.addTarget(self, action: #selector(saveDraw), for: .touchUpInside)
        toolView.addSubview(save)
        
        
        //Label lineWidth Slider ----------------------------
        let lineWidthSliderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
        lineWidthSliderLabel.center = CGPoint(x: 25, y: 75)
        lineWidthSliderLabel.textColor = UIColor.black
        lineWidthSliderLabel.text = "Width:"
        toolView.addSubview(lineWidthSliderLabel)

        //lineWidth slider
        let lineWidthSlider = UISlider(frame:CGRect(x: 50, y: 50, width: 250, height: 50))
        lineWidthSlider.minimumValue = 1
        lineWidthSlider.maximumValue = 25
        lineWidthSlider.value = 3.0
        lineWidthSlider.isContinuous = true
        lineWidthSlider.tintColor = UIColor.purple
        lineWidthSlider.addTarget(self, action: #selector(lineWidthSliderValueDidChange(_:)), for: .valueChanged)
        toolView.addSubview(lineWidthSlider)
        
        //Label lineWidth Number
        lineWidthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        lineWidthLabel.center = CGPoint(x: 325, y: 75)
        lineWidthLabel.textColor = UIColor.black
        lineWidthLabel.text = drawView?.getLineWidth()
        toolView.addSubview(lineWidthLabel)
        
        self.view = view
    }
    
    @objc func lineWidthSliderValueDidChange(_ sender:UISlider!) {
        drawView?.changeLineWidthTo(Int(sender.value))
        lineWidthLabel.text = drawView?.getLineWidth()
        drawView?.setNeedsDisplay()
    }
    
    @objc func penDraw(){
        clear.isSelected = false
        save.isSelected = false
        pen.isSelected = true
        drawView?.changeColorTo(UIColor.black)
    }
    @objc func clearDraw(){
        clear.isSelected = true
        save.isSelected = false
        pen.isSelected = false
        drawView?.changeColorTo(UIColor.white)
    }
    @objc  func saveDraw() {
        clear.isSelected = false
        save.isSelected = true
        pen.isSelected = false
        let imageMandala = drawView?.getImage()
        let imageData = UIImagePNGRepresentation(imageMandala!)
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "Your Mandala has been saved in the Library", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    public override func viewDidLayoutSubviews(){
        if self.view.frame.height < self.view.frame.width {
            drawView?.frame = CGRect(x: 20, y: 75, width: 400, height: 400)
            toolView.frame = CGRect( x:430, y:200, width:toolView.frame.size.width, height:toolView.frame.size.height )
        } else {
            drawView?.frame = CGRect(x: 50, y: 75, width: 400, height: 400)
            toolView.frame = CGRect( x:90, y:500, width:toolView.frame.size.width, height:toolView.frame.size.height )
        }
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

