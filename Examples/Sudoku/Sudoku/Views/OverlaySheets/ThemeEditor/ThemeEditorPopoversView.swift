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
//

import SwiftUI


// -------------------------------------
struct ThemeEditorPopoversView: View
{
    @Binding var currentTheme: Theme
    @EnvironmentObject var prefs: Preferences
    @State var fakeState: Bool = true
    
    // -------------------------------------
    func invisibleRect(align: Alignment) -> some View
    {
        Rectangle().fill(Color.black.opacity(0))
            .frame(width: 1, height: 1, alignment: align)
    }
    
    // -------------------------------------
    func spacerRect() -> some View
    {
        Rectangle().fill(Color.black.opacity(0))
            .frame(width: 130, height: 100)
    }
    
    // -------------------------------------
    var notesPopoverColumn: some View
    {
        return VStack(alignment: .leading, spacing: 0)
        {
            HStack(alignment: .top)
            {
                VStack(spacing: 0)
                {
                    ThemeColorWell(
                        "Available Note",
                        currentTheme: $currentTheme,
                        colorPath: \.unSelectedNoteColor
                    ).frame(alignment: .trailing)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    
                    ThemeColorWell(
                        "Selected Note",
                        currentTheme: $currentTheme,
                        colorPath: \.selectedNoteColor
                    ).frame(alignment: .trailing)
                    .padding(.bottom, 10)
                }
                .frame(alignment: .leading)
            }.frame(alignment: .leading)
            
            HStack(alignment: .top, spacing: 0)
            {
                ThemeEditorPopoverPreview(
                    currentTheme: $currentTheme,
                    settingNotes: false,
                    arrowEdge: .trailing
                ).frame(ThemeEditorPopoverPreview.size)
                .padding(.trailing, 30)

                spacerRect()
            }
        }
    }
    
    // -------------------------------------
    var guessPopoverColumn: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            HStack(alignment: .top, spacing: 0)
            {
                spacerRect()
                
                ThemeEditorPopoverPreview(
                    currentTheme: $currentTheme,
                    settingNotes: true,
                    arrowEdge: .leading
                ).frame(ThemeEditorPopoverPreview.size)
                    .frame(alignment: .topTrailing)
                    .padding(.leading, 30)
            }.padding(.top, 20)

            HStack(alignment: .top)
            {
                invisibleRect(align: .leading)
                    .frame(ThemeEditorPopoverPreview.size)
                
                VStack(alignment: .trailing, spacing: 0)
                {
                    ThemeColorWell(
                        "Invalid Guess",
                        currentTheme: $currentTheme,
                        colorPath: \.invalidGuessColor
                    )
                    .padding(.top, 20)
                    .frame(alignment: .trailing)
                    
                    ThemeColorWell(
                        "Valid Guess",
                        currentTheme: $currentTheme,
                        colorPath: \.invalidGuessColor
                    )
                    .padding(.top, 10)
                    .frame(alignment: .trailing)
                    
                    ThemeColorWell(
                        "Selected Guess",
                        currentTheme: $currentTheme,
                        colorPath: \.actualGuessColor
                    )
                    .padding(.top, 10)
                    .frame(alignment: .trailing)
                }
                .frame(alignment: .trailing)
            }.frame(alignment: .trailing)
        }
    }
    
    // -------------------------------------
    var body: some View
    {
        ZStack
        {
            notesPopoverColumn
            guessPopoverColumn
        }
        .padding(.top, 10)
        .onAppear { fakeState = true }
    }
}

// -------------------------------------
struct ThemeEditorPopoversView_Previews: PreviewProvider
{
    @State static var theme = Theme.system
    // -------------------------------------
    static var previews: some View
    {
        ZStack
        {
            Color.gray
            ThemeEditorPopoversView(currentTheme: $theme)
        }
    }
}