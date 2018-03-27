import UIKit

public class DrawView: UIView {
    
    public var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.black
    public var lineWidth = 3
    public var slices = 12
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
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = touches.first?.location(in: self)
        lines.append(Line(start: lastPoint, end: newPoint!, color: drawColor, width:Float(lineWidth)))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    public override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineCap(CGLineCap.round)
        
        for line in lines {
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
        
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineCap(CGLineCap.round)
        
        for line in lines {
            context!.setLineWidth(CGFloat(line.width))
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

