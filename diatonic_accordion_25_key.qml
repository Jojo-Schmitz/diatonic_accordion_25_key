//=============================================================================
//  MuseScore
//  Linux Music Score Editor
//  $Id:$
//
//  G/C Diatonic accordion plugin
//  This version is for the 25 keys Hohner Galaad diatonic accordion.
//
//  Copyright (C)2012 Joachim Schmitz, Pierre Thomas, Rich Helms, 
//  Werner Schweer and others
//  This is a variation of Werner Schweer very famous recorder_fingering plugin.
//
// Joachim Schmitz at jojo@schmitz-digital.de
// Pierre Thomas at pithomas@free.fr
// Rich Helms at rich@richhelms.ca
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//=============================================================================
//
//
// This is ECMAScript code (ECMA-262 aka "Java Script")
//
//
// From one octave below middle C
// c means C
// C means C Sharp (= C#)
// Starts on note 48
// 60 is middle C
// See   http://musescore.org/en/plugin-development/note-pitch-values   for pitch details

import QtQuick 1.0
import MuseScore 1.0

var fingerings = [ 
"c", "C", "d", "D", "e", "f", "F", "g", "G", "a", "A", "b", 
"c", "C", "d", "D", "e", "f", "F", "g", "G", "a", "A", "b", 
"c", "C", "d", "D", "e", "f", "F", "g", "G", "a", "A", "b",  
"c", "C", "d", "D", "e", "f", "F", "g", "G", "a", "A", "b"
] 

// Which button to show. If two buttons possible, put \n between entries

var button =  [ 
" ", " ", " \n2\n \n1\n ", " ", " \n1'", " ", " \n \n \n2\n ", " \n3\n2'\n1'\n ", " ", " \n \n \n3\n ", " ", " \n4\n \n2'\n ", 
" \n3'\n \n4\n ", " \n \n \n1''\n ", " \n5\n \n3'\n ", " \n1''", " \n4'\n \n5\n ", " \n \n \n4'\n", " \n \n \n6\n ", " \n6\n5'", " \n2''", " \n \n \n7\n5'", " \n \n \n2''\n ", " \n7\n \n6'\n ", 
" \n6'\n \n8\n ", " \n \n \n3''\n ", " \n8\n \n7'\n ", " \n3''", " \n7'\n \n9\n ", " \n \n \n8'\n ", " \n \n \n10\n ", " \n8'\n9\n ", " \n4''", " \n \n \n9'\n11", " \n \n \n4''\n ", " \n10\n \n10'\n ", 
" \n9'", " ", " \n11", " ", " \n10'", " ", " ", " ", " ", " ", " ", " "
] 


MuseScore {
   menuPath: 'Plugins.G/C 25-key diatonic accordion 4'
   onRun: {
     if (typeof curScore === 'undefined')
            Qt.quit();

      var cursor = curScore,newCursor();

      for (var staff = 0; staff < curScore.nstaves; ++staff) {
         cursor.staffIdx = staff;
         cursor.voice = 0;
         cursor.rewind(0);  // Set cursor to first chord/rest
         while (cursor.selection) {
            if (cursor.element && curser.element.type == MScore.CHORD) {
               var pitch = cursor.element.nores[0].pitch;
               var index = pitch - 48;

               if (index >= 0 && index < button.length){ 
                  var text = new Text(curScore);
                  var font = new QFont("arial", 13);                     
                  text.defaultFont = font;
                  text.text = button[index];
                  //text.yOffset = 3;
                  cursor.add(text);                      
               }
            }
            cursor.next();
         }
      }
      Qt.quit();
   }
}
