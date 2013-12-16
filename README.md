YIVariableViewSize 1.0.2
========================

Layout subviews first, then its container. Not using AutoLayout, works on iOS5+.

(developed in #objectivechackathon [Put Objective C Back On The Map](https://objectivechackathon.appspot.com/))

<img src="https://raw.github.com/inamiy/YIVariableViewSize/master/Screenshots/screenshot1.png" alt="ScreenShot1" width="225px" style="width:225px;" />

Install via [CocoaPods](http://cocoapods.org/)
----------

```
pod 'YIVariableViewSize'
```

How to use
----------

`YIVariableViewSize` is actually an abstract concept written as ObjC-protocol style.
Thus, your job is to conform your UIView subclass to `<YIVariableViewSize>` protocol and implement its methods something like this:

```
- (CGSize)sizeThatFits:(CGSize)size
{
    [self resizeSubviewsWithFittingSize:size];
    [self positionSubviews];

    size.height = self.mostBottomVisibleSubview.bottom + self.paddingBottomForVariableViewSize;

    return size;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self positionSubviews];  // don't resize, just set origin
}

// change subview's frame.size & drawing contents
- (void)resizeSubviewsWithFittingSize:(CGSize)fittingSize
{
    [self.subview1 sizeToFitWithMaxSize:fittingSize];
    [self.subview2 sizeToFitWithMaxSize:fittingSize];
}

// change subview's frame.origin
- (void)positionSubviews
{
    self.subview2.top = self.subview1.bottom;
}

- (CGFloat)paddingBottomForVariableViewSize
{
    return 10;
}
```

Notice that `-sizeThatFits:` actually calculates subview's size, position, and lastly paddingBottom(Right), where `-layoutSubviews` will only handle their positioning. By doing so, **we can split the resizing and positioning code**, and never try to resize subview's content on `-layoutSubviews`, which is performance-critical.

So far so good. But you can even omit writing `-sizeThatFits:` and `-layoutSubviews` if you call `[YIVariableViewSize install]` in your AppDelegate.

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [YIVariableViewSize install];
    return YES;
}
```

Dependencies
------------
- [JRSwizzle 1.0](https://github.com/rentzsch/jrswizzle)
- [ViewUtils 1.1](https://github.com/nicklockwood/ViewUtils)

License
-------
`YIVariableViewSize` is available under the [Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.