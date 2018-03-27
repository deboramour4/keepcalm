import PlaygroundSupport
import UIKit


class MyViewController : UIViewController, PlaygroundLiveViewMessageHandler {
    let step: Float = 1
    var slicesLabel = UILabel()
    var lineWidthLabel = UILabel()
    var drawMandalaView : DrawMandalaView?
    var toolView = UIView()
    var bgImg = UIImageView()

    override func loadView() {
        let view = UIView()
        // Background
        bgImg.frame = CGRect(x: 0, y: 0, width: 1100, height: 900)
        bgImg.image = UIImage(named: "bg_landscape.png")
        view.addSubview(bgImg)

        //Draw Mandala Area
        drawMandalaView = DrawMandalaView(frame: CGRect(x: 50, y: 75, width: 400, height: 400))
        drawMandalaView?.backgroundColor = .white
        view.addSubview(drawMandalaView!)
        
        //Tools Area
        toolView = UIView(frame: CGRect(x: 90, y: 500, width: 325, height: 175))
        //toolView.backgroundColor = .gray
        view.addSubview(toolView)
        
        //Button pencil
        let pen = UIButton(type: .system)
        pen.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        pen.setBackgroundImage(UIImage(named: "icons/draw.png"), for: .normal)
        //pen.addTarget(self, action: #selector(toolPen), for: UIControlEvents.touchDown)
        toolView.addSubview(pen)
        
        //Button paint
        let paint = UIButton(type: .system)
        paint.frame = CGRect(x: 90, y: 0, width: 50, height: 45)
        paint.setBackgroundImage(UIImage(named: "icons/paint.png"), for: .normal)
        //paint.addTarget(self, action: #selector(toolPen), for: UIControlEvents.touchDown)
        toolView.addSubview(paint)
        
        //Button clear
        let clear = UIButton(type: .system)
        clear.frame = CGRect(x: 180, y: 0, width: 50, height: 45)
        clear.setBackgroundImage(UIImage(named: "icons/clear.png"), for: .normal)
        clear.addTarget(self, action: #selector(clearDraw), for: .touchUpInside)
        toolView.addSubview(clear)
        
        //Button save
        let save = UIButton(type: .system)
        save.frame = CGRect(x: 270, y: 0, width: 50, height: 50)
        save.setBackgroundImage(UIImage(named: "icons/save.png"), for: .normal)
        save.addTarget(self, action: #selector(saveMandala), for: .touchUpInside)
        toolView.addSubview(save)
        
        //Label Slice Slider ----------------------------
        let slicesSliderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        slicesSliderLabel.center = CGPoint(x: 25, y: 75)
        slicesSliderLabel.textColor = UIColor.black
        slicesSliderLabel.text = "Slices: "
        toolView.addSubview(slicesSliderLabel)

        //Slice slider
        let slicesSlider = UISlider(frame:CGRect(x: 50, y: 50, width: 250, height: 50))
        slicesSlider.minimumValue = 2
        slicesSlider.maximumValue = 20
        slicesSlider.value = 12.0
        slicesSlider.isContinuous = true
        slicesSlider.tintColor = UIColor.purple
        slicesSlider.addTarget(self, action: #selector(slicesSliderValueDidChange(_:)), for: .valueChanged)
        toolView.addSubview(slicesSlider)
        
        //Label Slice Number
        slicesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        slicesLabel.center = CGPoint(x: 325, y: 75)
        slicesLabel.textColor = UIColor.black
        slicesLabel.text = drawMandalaView?.getSlices()
        toolView.addSubview(slicesLabel)
        
        //Label lineWidth Slider ----------------------------
        let lineWidthSliderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        lineWidthSliderLabel.center = CGPoint(x: 25, y: 125)
        lineWidthSliderLabel.textColor = UIColor.black
        lineWidthSliderLabel.text = "Line: "
        toolView.addSubview(lineWidthSliderLabel)

        //lineWidth slider
        let lineWidthSlider = UISlider(frame:CGRect(x: 50, y: 100, width: 250, height: 50))
        lineWidthSlider.minimumValue = 1
        lineWidthSlider.maximumValue = 15
        lineWidthSlider.value = 3.0
        lineWidthSlider.isContinuous = true
        lineWidthSlider.tintColor = UIColor.purple
        lineWidthSlider.addTarget(self, action: #selector(lineWidthSliderValueDidChange(_:)), for: .valueChanged)
        toolView.addSubview(lineWidthSlider)
        
        //Label lineWidth Number
        lineWidthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        lineWidthLabel.center = CGPoint(x: 325, y: 125)
        lineWidthLabel.textColor = UIColor.black
        lineWidthLabel.text = drawMandalaView?.getLineWidth()
        toolView.addSubview(lineWidthLabel)
        
        self.view = view
    }

    func slicesSliderValueDidChange(_ sender:UISlider!) {
        drawMandalaView?.changeSlicesTo(Int(sender.value))
        slicesLabel.text = drawMandalaView?.getSlices()
        drawMandalaView?.setNeedsDisplay()
    }
    
    func lineWidthSliderValueDidChange(_ sender:UISlider!) {
        drawMandalaView?.changeLineWidthTo(Int(sender.value))
        lineWidthLabel.text = drawMandalaView?.getLineWidth()
        drawMandalaView?.setNeedsDisplay()
    }
    
    @objc func clearDraw(){
        let alertClear = UIAlertController(title: "Clear Mandala", message: "Do you really want to clear your drawing?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler:
        { (action) -> Void in
            self.drawMandalaView?.clear()
            self.drawMandalaView?.setNeedsDisplay()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertClear.addAction(okAction)
        alertClear.addAction(cancelAction)
        self.present(alertClear, animated: true, completion: nil)
    }
    @objc  func saveMandala() {
        let imageMandala = drawMandalaView?.getImage()
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
            drawMandalaView?.frame = CGRect(x: 20, y: 75, width: 400, height: 400)
            toolView.frame = CGRect( x:430, y:200, width:toolView.frame.size.width, height:toolView.frame.size.height )
        } else {
            drawMandalaView?.frame = CGRect(x: 50, y: 75, width: 400, height: 400)
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

