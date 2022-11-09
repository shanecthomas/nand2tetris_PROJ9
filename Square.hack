class Square {
    field int x, y, size;
    field boolean done;

    constructor Square new(int startX, int startY, int sqSize) {
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
