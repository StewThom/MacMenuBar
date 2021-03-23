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

import SwiftUI

// -------------------------------------
struct CellNoteView: View
{
    @EnvironmentObject var prefs: Preferences
    
    static let width = CellView.width / 3
    static let height = width
    
    var note: Int?
    
    var displayText: Text
    {
        let s: String
        if let n = note { s = "\(n)" }
        else { s = "" }
        
        return Text(s)
    }
    
    // -------------------------------------
    var body: some View
    {
        displayText
            .font(Font(prefs.theme.noteFont))
            .foregroundColor(Color(prefs.theme.noteColor))
            .frame(width: Self.width, height: Self.height, alignment: .center)
    }
}

// -------------------------------------
struct CellNoteView_Previews: PreviewProvider
{
    static var previews: some View {
        CellNoteView(note: 5)
    }
}
