//
//  DataRenderer.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc(ChartDataRendererBase)
open class DataRenderer: Renderer
{
    @objc open let animator: Animator
    
    // slices and border StrokeColor
    fileprivate var _strokeColor: CGColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1.0).cgColor
    
    //added by Vido -> slices and border StrokeColor
    @objc open var strokeColor: CGColor
        {
        get
        {
            return _strokeColor
        }
        set
        {
            _strokeColor = newValue
        }
    }
    
    @objc public init(animator: Animator, viewPortHandler: ViewPortHandler)
    {
        self.animator = animator

        super.init(viewPortHandler: viewPortHandler)
    }

    @objc open func drawData(context: CGContext)
    {
        fatalError("drawData() cannot be called on DataRenderer")
    }
    
    @objc open func drawValues(context: CGContext)
    {
        fatalError("drawValues() cannot be called on DataRenderer")
    }
    
    @objc open func drawExtras(context: CGContext)
    {
        fatalError("drawExtras() cannot be called on DataRenderer")
    }
    
    /// Draws all highlight indicators for the values that are currently highlighted.
    ///
    /// - parameter indices: the highlighted values
    @objc open func drawHighlighted(context: CGContext, indices: [Highlight])
    {
        fatalError("drawHighlighted() cannot be called on DataRenderer")
    }
    
    /// An opportunity for initializing internal buffers used for rendering with a new size.
    /// Since this might do memory allocations, it should only be called if necessary.
    @objc open func initBuffers() { }
    
    @objc open func isDrawingValuesAllowed(dataProvider: ChartDataProvider?) -> Bool
    {
        guard let data = dataProvider?.data else { return false }
        return data.entryCount < Int(CGFloat(dataProvider?.maxVisibleCount ?? 0) * viewPortHandler.scaleX)
    }
}
