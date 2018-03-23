import UIKit

public class DrawMandalaView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.black
    var lineWidth = 3
    var slices = 12
    
    func drawMandalaOutlines(){
        let viewWidth = Double(self.frame.width)
        let viewHeight = Double(self.frame.height)
        let viewCenter = CGPoint(x: viewWidth/2, y:viewHeight/2)
        let radius = viewWidth*0.8
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.gray.cgColor)
        context!.setLineWidth(0.5)
        for i in 0...slices {
            context!.beginPath()
            context?.move(to: viewCenter)
            let angle = (2*Double.pi) * (Double(i)/Double(slices))
            let newX = CGFloat((viewWidth/2)+radius*cos(angle))
            let newY = CGFloat((viewHeight/2)+radius*sin(angle))
            let lineEdge = CGPoint(x:newX, y:newY)
            context?.addLine(to: lineEdge)
            context?.strokePath()
        }
    }
    
    public func clear() {
        self.lines = []
    }
    
    public func getSlices() -> String {
        return String(self.slices)
    }
    
    public func changeSlicesTo(_ n:Int) {
        self.slices = n
    }
    
    public func getLineWidth() -> String {
        return String(self.lineWidth)
    }
    
    public func changeLineWidthTo(_ n:Int) {
        self.lineWidth = n
    }
    
    public func and(_ x:Bool,_ y:Bool) -> Bool {
        return x ? y : false;
    }
    
    public func solveAngle(a:Float, b:Float, c:Float) -> Float{
        let temp = (a * a + b * b - c * c) / (2 * a * b);
        if ( and(temp >= -1, 0.9999999 >= temp) ){
            return acos(temp)
        } else if (1 >= temp) {
            return sqrt((c * c - (a - b) * (a - b)) / (a * b))
        } else {
            print("No solution")
            return 0.0
        }
    }
    
    func rotateLine(_ line: Line,_ rotation: Float) -> Line {
        let startRotated = self.rotatePoint(line.start, rotation)
        let endRotated = self.rotatePoint(line.end, rotation)
        return Line(start: startRotated, end: endRotated, color: drawColor, width: Float(lineWidth))
    }
    
    public func rotatePoint(_ point: CGPoint,_ rotation: Float) -> CGPoint {
        let viewWidth = self.frame.width
        let viewHeight = self.frame.height
        
        let radius = sqrt(pow(point.x - (viewWidth/2), 2) + pow(point.y - (viewHeight/2), 2))
        
        let p1 = CGPoint(x:(viewWidth/2)+radius*cos(0), y:(viewHeight/2)+radius*sin(0))
        
        let a = point.x - p1.x
        let b = point.y - p1.y
        
        let distBetweenPosAndP1 = sqrt( pow(a, 2) + pow(b, 2) )
        let angleBetweenPosAndP1 = solveAngle(a:Float(radius) , b: Float(radius), c: Float(distBetweenPosAndP1))
        
        let testX = round(Float((viewWidth/2)+radius)*cos(-angleBetweenPosAndP1))
        let testY = round(Float((viewHeight/2)+radius)*sin(-angleBetweenPosAndP1))
        
        let angleDirection = (testX == Float(point.x) && testY == Float(point.y)) ? -1 : 1
        let angle = rotation+(angleBetweenPosAndP1*Float(angleDirection))
        
        return CGPoint(x:(viewWidth/2)+radius*CGFloat(cos(angle)), y:(viewHeight/2)+radius*CGFloat(sin(angle)))
        
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
        drawMandalaOutlines()
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineCap(CGLineCap.round)
        
        for line in lines {
            for i in 0...slices-1 {
                if (i == 0) {
                    context!.beginPath()
                    context?.move(to: line.start)
                    context?.addLine(to: line.end)
                    context!.setLineWidth(CGFloat(line.width))
                    context?.strokePath()
                    continue
                }
                
                let rotation = (2*Double.pi)*(Double(i)/Double(slices))
                let lineRotated = rotateLine(line, Float(rotation))
                
                context!.beginPath()
                context?.move(to: lineRotated.start)
                context?.addLine(to: lineRotated.end)
                context?.strokePath()
            }
        }
        
    }
}
