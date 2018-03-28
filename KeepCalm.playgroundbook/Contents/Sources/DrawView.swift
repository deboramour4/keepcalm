import UIKit

public class DrawView: UIView {
    
    public var lines: [Line] = []
    public var lastPoint: CGPoint!
    public var drawColor = UIColor.black
    public var lineWidth = 3
    public var canPaint = true
    public var image = UIImage()
    
    public func clear() {
        self.lines = []
    }
    
    public func getLines() -> [Line] {
        return self.lines
    }
    public func getLineWidth() -> String {
        return String(self.lineWidth)
    }
    public func changeLineWidthTo(_ n:Int) {
        self.lineWidth = n
    }
    public func changeColorTo(_ color:UIColor) {
        self.drawColor = color
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        if (canPaint) {
            lastPoint = touches.first?.location(in: self)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with:event)
        if (canPaint) {
            let newPoint = touches.first?.location(in: self)
            lines.append(Line(start: lastPoint, end: newPoint!, color: drawColor, width:Float(lineWidth)))
            lastPoint = newPoint
            self.setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(CGLineCap.round)
        for line in lines {
            context?.setStrokeColor(line.color.cgColor)
            context!.setLineWidth(CGFloat(line.width))
            context!.beginPath()
            context?.move(to: line.start)
            context?.addLine(to: line.end)
            context?.strokePath()
        }
    }
    
    public func getImage() -> UIImage {
        UIGraphicsBeginImageContext(self.frame.size);
        
        let context = UIGraphicsGetCurrentContext()
        
        let rect = CGRect(x:0, y:0, width: self.frame.size.width, height: self.frame.size.height)
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(rect)
        
        context?.setLineCap(CGLineCap.round)
        
        for line in lines {
            context!.setLineWidth(CGFloat(line.width))
            context?.setStrokeColor(line.color.cgColor)
            context!.beginPath()
            context?.move(to: line.start)
            context?.addLine(to: line.end)
            context?.strokePath()
                  
        }
        self.image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        
        return self.image
    }
    
}

