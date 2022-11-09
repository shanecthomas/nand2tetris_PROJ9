class Square {
    field int x, y, size;
    field boolean done;

    constructor Square new(int startX, int startY, int sqSize) {
        do menu();
        let x = startX;
        let y = startY;
        let size = sqSize;
        let done = false;

        do draw();

        return this;
    }

    method void dispose() {
        do Memory.deAlloc(this);
        return;
    }

    method void draw() {
        do Screen.setColor(true);
        do Screen.drawRectangle(x, y, x + size, y + size);
        return;
    }

    method void reset() {
        do menu();
        let x = 0;
        let y = 0;
        let size = 30;
        let done = false;

        do draw();

        return this;
    }

    method void menu() {
        let instr = Array.new(3);
        let instr[0] = "BUTTON MASHER!!!";
        let instr[1] = "Practice your button mashing skills, and turn this tiny little square into a GIANT SQUARE!";
        let instr[2] = "Press 'space' to increase size of square, 'n' to start over, 'q' to quit";
        do Screen.clearScreen();
        do Output.moveCursor(10, 30);
        do Output.printString(instr[0]);
        do Output.moveCursor(12, 30);
        do Output.printString(instr[1]);
        do Output.moveCursor(14, 30);
        do Output.printString(instr[2]);
        
        return;
    }

    method void congrats() {
        do Screen.clearScreen();
        do Output.moveCursor(50,50);
        do Output.printString("CONGRATS, BUTTON MASHER! "Press 'n' to start over, 'q' to quit");
    }

    method void sizeUp() {
        if (((y + size) < 254) & ((x + size) < 510)) {
            do erase();
            let size = size + 2;
            do draw();
        }
        return;
    }
    
    method void erase() {
        do Screen.setColor(false);
        do Screen.drawRectangle(x, y, x + size, y + size);
        return;
    }
    
    method boolean isFinished() {
        if (((y + size) < 254) & ((x + size) < 510)) {
            let done = true;
        }
        
        return done;
    }
}
