//
//  DrawView.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/5.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    private var lines: [Line] = []
    
    private var lastPoint: CGPoint!
    
    
    private var color: CGColor = UIColor.black.cgColor
    private var lineWidth: CGFloat = 5.0
    private var opacity: CGFloat = 1.0
    private var lineCap = CGLineCap.square
    
    //MARK:Setters
    
    func appendLines(_ line: Line)
    {
        lines.append(line)
    }
    func setLines(_ lines: [Line])
    {
        self.lines = lines
    }
    func clearLines()
    {
        lines = []
    }
    func setColor(_ color: CGColor){
        self.color = color
    }
    func setLineWidth(_ width: CGFloat){
        lineWidth = width
    }
    func setLineCap(_ lineCap: CGLineCap)
    {
        self.lineCap = lineCap
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            lastPoint = location
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch : UITouch!
        touch = touches.first
        var newPoint = touch.location(in: self)
        
        if (newPoint.x <= dVC.d) && (newPoint.y <= dVC.d) && (newPoint.x >= 0) && (newPoint.y>=0)
        {
            lines.append(Line(start: lastPoint, end: newPoint))
            lastPoint = newPoint
            lineCap = CGLineCap.round
        }
        else if newPoint.x < 0 && newPoint.y < 0 //top left corner
        {
            newPoint = CGPoint(x: newPoint.x+dVC.d, y: newPoint.y+dVC.d)
            
            lastPoint.x += dVC.d
            lastPoint.y += dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x > dVC.d && newPoint.y < 0 //top right corner
        {
            newPoint = CGPoint(x: newPoint.x-dVC.d, y: newPoint.y+dVC.d)
            
            lastPoint.x -= dVC.d
            lastPoint.y += dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x > dVC.d && newPoint.y > dVC.d //bottom right corner
        {
            newPoint = CGPoint(x: newPoint.x-dVC.d, y: newPoint.y-dVC.d)
            
            lastPoint.x -= dVC.d
            lastPoint.y -= dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x < 0 && newPoint.y > dVC.d //bottom left corner
        {
            newPoint = CGPoint(x: newPoint.x+dVC.d, y: newPoint.y-dVC.d)
            
            lastPoint.x += dVC.d
            lastPoint.y -= dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x > dVC.d //to the right
        {
            newPoint = CGPoint(x: newPoint.x-dVC.d, y: newPoint.y)
            lastPoint.x -= dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x < 0  //to the left
        {
            newPoint = CGPoint(x: newPoint.x+dVC.d, y: newPoint.y)
            
            lastPoint.x += dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.y > dVC.d // to the bottom
        {
            newPoint = CGPoint(x: newPoint.x, y: newPoint.y-dVC.d)
            
            lastPoint.y -= dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        else if newPoint.y < 0 // to the top
        {
            newPoint = CGPoint(x: newPoint.x, y: newPoint.y+dVC.d)
            
            lastPoint.y += dVC.d
            
            lines.append(Line(start: CGPoint(x: lastPoint.x, y: lastPoint.y), end: newPoint))
            
            lastPoint = touch.location(in: self)
        }
        self.setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        
//        var point: String = ""
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
       
        for line in lines {
            
            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
//                print("line.start.x: \(line.start.x), line.start.y: \(line.start.y)")
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
            
//            if point != ("[\(line.start.x),\(line.start.y),\(line.end.x),\(line.end.y)]")
//            {   point = "[\(line.start.x),\(line.start.y),\(line.end.x),\(line.end.y)]"
//                print(point)
//            }
            
        }
        
        context?.setLineCap(lineCap)
        context?.setStrokeColor(color)
        context?.setLineWidth(lineWidth)
        context?.setAlpha(opacity)
        //context?.setShadow(offset: CGSize.init(width: 3, height: 3), blur: 0.5)
        context?.strokePath()
    
    }
}
