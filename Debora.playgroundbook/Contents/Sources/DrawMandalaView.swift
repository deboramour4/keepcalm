import UIKit

class DrawMandalaView: UIView {
	var lines: Lines[] = []
	var lastPoint: CGPoint!
	var drawColor = UIColor.blackColor()

	init (coder aDecoder: NS Coder!) {
		super.init(coder: aDecoder)
		//initialization code here
		//self.backgroundColor = UIColor.blackColor()
	}

	func drawMandalaOutlines(){
		//draw pizza		
	}

	override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
		lastPoint = touches.anyObject().locationInView(self)
	}

	override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
		var newPoint = touches.anyObject().locationInView(self)
		lines.append(Line(start: lastPoint, end:newPoint, color= drawColor))
		lastPoint = newPoint
		self.setNeedsDisplay()
	}

	override func drawRect(rect: CGRect) {
		var context = UIGraphicsGetCurrentContext()
		CGContextSetLineCap(context, kCGLineCapRound)
		CGContextSetLineWidth(context, 5)

		for line in lines {
			CGContextBeginPath(context)
			CGContextMoveToPoint(context, line.start.x, line.start.y)
			CGContextAddLineToPoint(context, line.end.x, line.end.y)
			CGContextSetStrokeColorWithColor(context, line.color.CGColor)
			CGContextStrokePath(context)
		}
		
	}
} 

https://www.raywenderlich.com/33193/core-graphics-tutorial-arcs-and-paths