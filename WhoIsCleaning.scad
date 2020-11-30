/*
 * Who is cleaning this week
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES = 2;
MAIN_BOARD_TEXT = "Tento týden uklízí";
MAIN_BOARD_WIDTH = 120;
MAIN_BOARD_HEIGHT = 100;

TEXTPAD_WIDTH = 34;
TEXTPAD_HEIGHT = 20;
TEXTPAD_NAME = "Martin";
/*
mainBoard();

translate ([MAIN_BOARD_WIDTH/2-TEXTPAD_WIDTH/2,MAIN_BOARD_HEIGHT-40,THIKNES])
    rails();

translate ([TEXTPAD_WIDTH/8,MAIN_BOARD_HEIGHT-76,THIKNES])
    rails();
translate ([MAIN_BOARD_WIDTH-TEXTPAD_WIDTH-TEXTPAD_WIDTH/8,MAIN_BOARD_HEIGHT-76,THIKNES])
    rails();
*/
translate ([MAIN_BOARD_WIDTH+10,0,0]) textPad (false);   

module mainBoard () {
    cube ([MAIN_BOARD_WIDTH, MAIN_BOARD_HEIGHT, THIKNES]);
    translate ([8,MAIN_BOARD_HEIGHT-0-MAIN_BOARD_HEIGHT/4,THIKNES])
        cube ([MAIN_BOARD_WIDTH-12, MAIN_BOARD_HEIGHT/4, THIKNES*5]);
    translate ([8,MAIN_BOARD_HEIGHT-0-MAIN_BOARD_HEIGHT/4+5,THIKNES*6])
        rotate ([0,0,0])
            linear_extrude(2) 
                text(MAIN_BOARD_TEXT);
}

module textPad (bigger) {
    translate ([0,bigger?0:0.2, 0])
    cube ([bigger?TEXTPAD_WIDTH*2:TEXTPAD_WIDTH, bigger?TEXTPAD_HEIGHT+.2:bigger?TEXTPAD_HEIGHT:TEXTPAD_HEIGHT-0.4, bigger?THIKNES+.2:THIKNES]);
    translate ([THIKNES,bigger?TIHNES:THIKNES+0.2, THIKNES])
        cube ([bigger?TEXTPAD_WIDTH*2:TEXTPAD_WIDTH-THIKNES*2, bigger?TEXTPAD_HEIGHT-THIKNES*2:TEXTPAD_HEIGHT-THIKNES*2-0.4, THIKNES]);
    translate ([2,TEXTPAD_HEIGHT/2-4,THIKNES*2])
        rotate ([0,0,0])
            linear_extrude(2) 
                text(TEXTPAD_NAME, size = 8);    
}

module rails () {
    difference () 
    {
        union () {
            cube ([TEXTPAD_WIDTH, THIKNES*4, THIKNES*5]);
            translate ([0,-TEXTPAD_HEIGHT-THIKNES*2-.4, 0])
                cube ([TEXTPAD_WIDTH, THIKNES*4, THIKNES*5]);
        }
        translate ([0,-TEXTPAD_HEIGHT+THIKNES-0.2, THIKNES*3])
            textPad(true);
    }
}
    