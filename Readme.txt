Sample Run:
	cd assembler
	make
	cd ..
	cd simulator/RISC-Simulator-master/
	make
	cd ../..
	./assembler/bin/assembler a.asm a.hex
	./simulator/RISC-Simulator-master/bin/sim -input a.hex -output a.log -pipe


/*
Project: Computer Architecture Interrupt and Exception Handler
Rishabh Singh - 2016csb1054
Rohit Kumar - 2016csb1055
*/

------ --------------ISA Changes----------------
New instructions are summarized as follows:
New Instruction          Opcode              Functionality
    Movz                   21             Copy register in privileged mode
    Retz                   22             Return to interrupted instruction
Encoding of movz are same as mov, and Retz is same as ret instruction
Registers view for movz:
Along with registers in typical Simple Risc Architecture, a new register “CauseReg” is introduced. This is a
32 bit register that contains the cause of exception or interrupt.
Register Encoding
  R0      0000
 oldPC    0001
 oldSP    0010
 Flags    0011
 oldFlags 0100
 CauseReg 0101
 Sp       1110
Exception/Interrupt vector:
- Program will always start at 0x0
- At exception, PC will jump to 0x4. Exception handing routine will assume cause of exception
written in CauseReg
- At interrupt, PC will jump to 0x8. Interrupt handing routine will assume interrupt id to be
available in CauseReg
- Nested interrupt/exceptions are not supported.

---------------------------------------------------------------------------
Exception Handler is running correctly in our implementation. The pipeline diagram in log file is generated correctly.
Exception Handler is being called correctly whenever an exception is encountered. It is also returning to the same point before the exception,
and continuing executing the instructions from the next instruction.

------------------------------------------------------------------------------
