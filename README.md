# LCD Text Display Controller

I wanted to learn more about FPGA development and LCD interfaces, so I built this text display system. You can input ASCII characters using switches and see them appear on a 16x2 LCD screen.

## What it does

- Use 8 switches to set an ASCII code (0-255)
- Press a button to display the character on the LCD
- The system handles all LCD initialization automatically

## Hardware Setup

- FPGA: Xilinx Virtex 5 (Genesys board)
- Display: 16x2 character LCD
- Input: 8 switches + 1 push button

## Project Structure

```
src/
├── LCDDisplay.v          # Main controller
├── InitLCD.v             # LCD initialization module
├── WriteAsciiLCD.v       # Character writing logic
├── write_lcd_block.v     # Low-level LCD operations
└── Mux2.v               # Bus multiplexer

testbenches/
├── LCDDisplay_Testbench.v
├── InitLCD_Testbench.v
└── (other test files...)

constraints/
└── LCDDisplay.ucf        # Pin assignments
```

## How it works

The design uses two main state machines:

**Initialization FSM**: Configures the LCD on startup with the proper command sequence and timing delays (about 40ms total)

**Write Controller**: Handles user input - reads the switch values, waits for button press, then writes the ASCII character to the display

The challenging part was meeting the LCD timing requirements. I had to implement a clock divider to slow down from 100MHz to around 1kHz and add proper wait states between commands.

## Key Features

- Hierarchical design with modular components
- Proper LCD timing compliance 
- Debounced button input
- Comprehensive testbenches for verification
- Clean separation between initialization and operation modes

## Running the Project

Load the bitstream file onto a compatible FPGA board, or build from source:

1. Set up your FPGA development environment (ISE/Vivado)
2. Add all source files from the `src/` directory
3. Apply the constraint file for pin mappings
4. Synthesize and implement

To use: Set the 8 switches to any ASCII value (try 0x41 for 'A'), then press the button to see it appear on the LCD.

## What I Built This With

- **HDL**: Verilog
- **Tools**: Xilinx ISE
- **Simulation**: Integrated testbenches
- **Hardware**: Custom pin constraints and timing analysis

This project helped me understand LCD interface protocols, finite state machine design, and FPGA timing constraints. The modular approach made debugging much easier and the testbenches caught several timing issues during development.
