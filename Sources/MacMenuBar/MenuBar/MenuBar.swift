// Copyright 2021 Chip Jarred
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Cocoa

// -------------------------------------
public protocol MenuBar
{
    var body: StandardMenuBar { get }
}

// -------------------------------------
@resultBuilder
public struct MenuBarBuilder {
    public static func buildBlock(_ menus: MacMenu...) -> [MacMenu] { menus }
}

// -------------------------------------
public struct StandardMenuBar
{
    internal private(set) var menu: NSMenu
    
    public init(@MenuBarBuilder menus: () -> [MacMenu])
    {
        self.menu = NSMenu()
        menus().forEach
        {
            if $0 is NoMenu { return }
            
            let item = NSMenuItem()
            item.title = $0.title
            item.submenu = $0.nsMenu
            self.menu.addItem(item)
        }
    }
}
