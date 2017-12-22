//
//  FigurasView.swift
//  GraficadorProyecto2
//
//  Created by user130165 on 9/25/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

@IBDesignable
class FigurasView: UIView {
    
    @IBInspectable
    var verTri:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var verCua:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var verPen:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var verHex:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var verHep:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var verOct:Bool = false { didSet {setNeedsDisplay()}}
    @IBInspectable
    var escala : CGFloat = 0.9 { didSet {setNeedsDisplay()}}
    @IBInspectable
    var strokePoint : CGFloat = 10.0 { didSet {setNeedsDisplay()}}
    
    //handler pinch
    func changeScale(byReactingto pinchRecognizer: UIPinchGestureRecognizer)
    {
        switch pinchRecognizer.state {
        case .changed , .ended:
            escala *= pinchRecognizer.scale
            pinchRecognizer.scale = 1
            
        default:
            break
        }
    }
    
    //handler tap 1 dedo
    func tapOneFinger(byReactingto tapRecognizer: UITapGestureRecognizer)
    {
        if tapRecognizer.state == .ended {
            escala *= 1.1 //la escala crece un 10%
        }
    }
    
    //handler tap 2 dedos
    func tapTwoFinger(byReactingto tapRecognizer: UITapGestureRecognizer)
    {
        if tapRecognizer.state == .ended
        {
            escala *= 0.9 // la escala se reduce un 10%
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        //se escoge la figura
        switch nroLadosSelec {
        case 3:
            verTri = true
        case 4:
            verCua = true
        case 5:
            verPen = true
        case 6:
            verHex = true
        case 7:
            verHep = true
        case 8:
            verOct = true
        default:
            NSLog("Error" + String(nroLadosSelec))
        }
        //se escogen los colores
        colorBordeSelec.setStroke()
        colorRellenoSelec.setFill()
        
        
        // Dibujar todas las figuras. Mostrar solo la necesaria.
        let puntoCentral = CGPoint(x: bounds.midX , y: bounds.midY)
        
        //Triangulo equilatero
        let altura = (bounds.maxY/2) * escala //ocupa media pantalla siempre es la misma en todas las figuras
        let ladoTri = altura * 1.16 //calculos hecho en papel
        let pathTri = UIBezierPath()
        let v1Tri = CGPoint(x: puntoCentral.x, y: puntoCentral.y - (altura/2))
        let v2Tri = CGPoint(x: puntoCentral.x + ladoTri/2, y: puntoCentral.y + 0.5*altura)
        let v3Tri = CGPoint(x: puntoCentral.x - ladoTri/2, y: puntoCentral.y + 0.5*altura)
        
        pathTri.move(to: v1Tri)
        pathTri.addLine(to: v2Tri)
        pathTri.addLine(to: v3Tri)
        pathTri.close()
        pathTri.lineWidth = strokePoint
        if verTri {
            pathTri.stroke()
            pathTri.fill()
        }
        
        //Cuadrado
        let pathCuad = UIBezierPath()
        let v1Cua = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y - altura/2)
        let v2Cua = CGPoint(x: puntoCentral.x - altura/2, y: puntoCentral.y - altura/2)
        let v3Cua = CGPoint(x: puntoCentral.x - altura/2, y: puntoCentral.y + altura/2)
        let v4Cua = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y + altura/2)
        
        pathCuad.move(to: v1Cua)
        pathCuad.addLine(to: v2Cua)
        pathCuad.addLine(to: v3Cua)
        pathCuad.addLine(to: v4Cua)
        pathCuad.close()
        pathCuad.lineWidth = strokePoint
        if verCua {
            pathCuad.stroke()
            pathCuad.fill()
        }
        
        //Pentagono
        let pathPen = UIBezierPath()
        let v1Pen = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y)
        let v2Pen = CGPoint(x: puntoCentral.x + 0.155 * altura, y: puntoCentral.y - 0.476 * altura)
        let v3Pen = CGPoint(x: puntoCentral.x - 0.405 * altura, y: puntoCentral.y - 0.294 * altura)
        let v4Pen = CGPoint(x: puntoCentral.x - 0.405 * altura, y: puntoCentral.y + 0.294 * altura)
        let v5Pen = CGPoint(x: puntoCentral.x + 0.155 * altura, y: puntoCentral.y + 0.476 * altura)
        
        pathPen.move(to: v1Pen)
        pathPen.addLine(to: v2Pen)
        pathPen.addLine(to: v3Pen)
        pathPen.addLine(to: v4Pen)
        pathPen.addLine(to: v5Pen)
        pathPen.close()
        pathPen.lineWidth = strokePoint
        if verPen {
            pathPen.stroke()
            pathPen.fill()
        }
        
        //Hexagono
        let pathHex = UIBezierPath()
        let v1Hex = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y)
        let v2Hex = CGPoint(x: puntoCentral.x + 0.25 * altura, y: puntoCentral.y - 0.25 * altura)
        let v3Hex = CGPoint(x: puntoCentral.x - 0.25 * altura, y: puntoCentral.y - 0.25 * altura)
        let v4Hex = CGPoint(x: puntoCentral.x - altura/2, y: puntoCentral.y)
        let v5Hex = CGPoint(x: puntoCentral.x - 0.25 * altura, y: puntoCentral.y + 0.25 * altura)
        let v6Hex = CGPoint(x: puntoCentral.x + 0.25 * altura, y: puntoCentral.y + 0.25 * altura)
        
        pathHex.move(to: v1Hex)
        pathHex.addLine(to: v2Hex)
        pathHex.addLine(to: v3Hex)
        pathHex.addLine(to: v4Hex)
        pathHex.addLine(to: v5Hex)
        pathHex.addLine(to: v6Hex)
        pathHex.close()
        pathHex.lineWidth = strokePoint
        if verHex {
            pathHex.stroke()
            pathHex.fill()
        }
        
        //Heptagono
        let pathHep = UIBezierPath()
        let v1Hep = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y)
        let v2Hep = CGPoint(x: puntoCentral.x + altura * 0.31, y: puntoCentral.y - 0.39 * altura)
        let v3Hep = CGPoint(x: puntoCentral.x - altura * 0.11, y: puntoCentral.y - 0.49 * altura)
        let v4Hep = CGPoint(x: puntoCentral.x - altura * 0.45, y: puntoCentral.y - 0.22 * altura)
        let v5Hep = CGPoint(x: puntoCentral.x - altura * 0.45, y: puntoCentral.y + 0.22 * altura)
        let v6Hep = CGPoint(x: puntoCentral.x - altura * 0.11, y: puntoCentral.y + 0.49 * altura)
        let v7Hep = CGPoint(x: puntoCentral.x + altura * 0.31, y: puntoCentral.y + 0.39 * altura)
        
        pathHep.move(to: v1Hep)
        pathHep.addLine(to: v2Hep)
        pathHep.addLine(to: v3Hep)
        pathHep.addLine(to: v4Hep)
        pathHep.addLine(to: v5Hep)
        pathHep.addLine(to: v6Hep)
        pathHep.addLine(to: v7Hep)
        pathHep.close()
        pathHep.lineWidth = strokePoint
        
        if verHep {
            pathHep.stroke()
            pathHep.fill()
        }
        
        
        //Octagono
        let pathOct = UIBezierPath()
        let v1Oct = CGPoint(x: puntoCentral.x + altura/2, y: puntoCentral.y)
        let v2Oct = CGPoint(x: puntoCentral.x + 0.35 * altura, y: puntoCentral.y - 0.35 * altura)
        let v3Oct = CGPoint(x: puntoCentral.x, y: puntoCentral.y - altura/2)
        let v4Oct = CGPoint(x: puntoCentral.x - 0.35 * altura, y: puntoCentral.y - 0.35 * altura)
        let v5Oct = CGPoint(x: puntoCentral.x - altura/2, y: puntoCentral.y)
        let v6Oct = CGPoint(x: puntoCentral.x - 0.35 * altura, y: puntoCentral.y + 0.35 * altura)
        let v7Oct = CGPoint(x: puntoCentral.x, y: puntoCentral.y + altura/2)
        let v8Oct = CGPoint(x: puntoCentral.x + 0.35 * altura, y: puntoCentral.y + 0.35 * altura)
        
        pathOct.move(to: v1Oct)
        pathOct.addLine(to: v2Oct)
        pathOct.addLine(to: v3Oct)
        pathOct.addLine(to: v4Oct)
        pathOct.addLine(to: v5Oct)
        pathOct.addLine(to: v6Oct)
        pathOct.addLine(to: v7Oct)
        pathOct.addLine(to: v8Oct)
        pathOct.close()
        pathOct.lineWidth = strokePoint
        if verOct {
            pathOct.stroke()
            pathOct.fill()
        }
    }

}
