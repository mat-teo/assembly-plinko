🕹️ Plinko Simulation in x86 Assembly (DOS)

This Assembly program simulates a simple Plinko-style game running in real mode DOS using BIOS and DOS interrupts. The player starts with a balance of virtual currency and can choose where to drop a ball (positions 1–5). Each drop costs 15 credits, and depending on where the ball lands, the player can win 1, 25, or 100 credits.
🧩 Features:

    Text-based graphical interface using int 10h (BIOS) for cursor and character manipulation.

    Real-time simulation of ball movement and pseudo-randomness via system time (int 21h, ah=2Ch).

    Credit system with ASCII conversion routine.

    Error handling for invalid inputs and insufficient funds.

    Visual display of the Plinko board and prize slots.

📄 File Details:

    Language: x86 Assembly (TASM/MASM syntax)

    Target: Real-mode DOS

    Executable type: .COM

💡 Usage:

Run the compiled program in DOSBox or a compatible DOS environment. Input a number between 1 and 5 to drop a ball, or 0 to exit.
