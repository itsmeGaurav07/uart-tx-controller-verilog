# 🚀 UART Transmitter (TX) – Verilog | FPGA (Xilinx Vivado)

## 📌 Overview

This project implements a **UART Transmitter (TX)** using **Verilog HDL** based on a **Finite State Machine (FSM)** design.
The design is simulated, synthesized, and implemented on FPGA using **Xilinx Vivado**.

UART (Universal Asynchronous Receiver Transmitter) is a widely used serial communication protocol in embedded and VLSI systems.

---

## 🎯 Objectives

* Design a UART TX module using Verilog
* Implement baud rate generation
* Transmit serial data using FSM
* Perform simulation and verification using testbench
* Implement the design on FPGA

---

## ⚙️ Specifications

* **Clock Frequency:** 100 MHz
* **Baud Rate:** 9600
* **Data Bits:** 8
* **Stop Bits:** 1
* **Parity:** None

---

## 🧠 Architecture

The UART transmitter consists of the following modules:

### 🔹 1. Baud Rate Generator

* Converts system clock (100 MHz) into baud rate (9600)
* Generates `baud_tick` signal for timing control

### 🔹 2. Shift Register

* Loads data along with start and stop bits
* Performs right shift to transmit LSB first

### 🔹 3. Finite State Machine (FSM)

States:

* `IDLE` – Waits for start signal
* `START` – Sends start bit (0)
* `DATA` – Sends 8-bit data
* `STOP` – Sends stop bit (1)

---

## 🔄 Working Principle

1. System stays in **IDLE** state
2. When `start` signal is high:

   * Data is loaded into shift register
   * FSM moves to START state
3. Start bit (`0`) is transmitted
4. Data bits are transmitted serially (LSB first)
5. Stop bit (`1`) is transmitted
6. FSM returns to IDLE

---

## 📂 Project Structure

```
uart-tx-fpga-verilog/
│
├── src/
│   └── uart_tx.v
│
├── tb/
│   └── uart_tx_tb.v
│
├── constraints/
│   └── uart_tx.xdc
│
├── results/
│   ├── waveform.png
│   ├── rtl.png
│   └── implementation.png
│
└── README.md
```

---

## 🧪 Simulation

* Testbench verifies UART transmission
* Input data: `8'h55`
* Observations:

  * Start bit detected
  * Data transmitted correctly
  * Stop bit generated
  * `busy` signal active during transmission

---

## 🖥️ FPGA Implementation

* Tool Used: **Xilinx Vivado**
* Steps:

  * Synthesis ✔️
  * Implementation ✔️
  * Bitstream Generation ✔️

---

## 📸 Results

### 🔹 Waveform Output

(Add your waveform screenshot here)

### 🔹 RTL Schematic

(Add RTL diagram screenshot here)

### 🔹 Implementation View

(Add implementation screenshot here)

---

## 💡 Key Features

* Fully synthesizable Verilog design
* FSM-based architecture
* Parameterized baud rate
* Clean modular design
* FPGA implementation ready

---

## 🚀 Future Improvements

* UART Receiver (RX) implementation
* Full-duplex UART (TX + RX)
* AXI interface integration
* FIFO buffering
* Error detection (parity, framing error)

---

## 🧑‍💻 Tools Used

* Verilog HDL
* Xilinx Vivado
* FPGA Board (e.g., PYNQ Z2 / Basys 3)

---

## 📚 Learning Outcome

* FSM design in digital systems
* Serial communication protocols
* FPGA design flow
* RTL to Bitstream implementation

---

## 🤝 Contribution

Feel free to fork and improve this project!

---

## ⭐ Acknowledgment

This project was developed as part of learning **VLSI design and FPGA implementation**.

---

## 📬 Contact
V.GAURAV SAI 
If you found this useful, feel free to connect!

---
