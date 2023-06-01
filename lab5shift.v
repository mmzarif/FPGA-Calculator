`timescale 1ns / 1ps

module lab5shift(
input startBit,
input oneBit,
input zeroBit,
input clk,
input reset,
output reg [11:0] outReg
);

// position 11 holds the oldest bit, position 0 holds the newest
reg [11:0] shiftReg;
integer cnt = 0;

// always
//  - this is one of the two ways to start a procedural assignment block, which means that code is evaluated line by line instead of at the same time (this can be changed)
//  - notice that in all the previous code you wrote, all the connections are built at the same time.
//  - the other way is to use "initial", which you used in the simulation file. 
//  - "initial" only runs once, but "always" can be triggered multiple times by @(signal)
//  - Here, the code is triggered by a rising edge (posedge) of the clock signal.
always @(posedge clk) 
begin
    // if … else …
    //  - this part is just like C, where the following code is triggered if the conditions are true
    // 12'h000
    //  - This is the way to represeent constant in verilog. It is in the format of  
    //  - bit_number'number_format number_contents
    //  - So Here, 12'h000 means a 12 bit long hexadecimal number which equals to 0. 
    if (reset) shiftReg[11:0] = 12'h000;
    else if (startBit)
    begin
        shiftReg <= ; // ?????
        cnt <= 12;
    end
    else if (zeroBit)
    begin
        // decoderWord[11:0] = {decoderWord[10:0], 1'b0};
        //  - By this code, we mean the same thing as assign 12 pins at the same time. 
        //  - But insead of using it directly from a longer signal, we construct a signal with the last 11 bit of the orignal data and 1 bit of new data.
        //  - this is a easy way to construct a shift reg 
        shiftReg[11:0] <= {shiftReg[10:0], 1'b0}; 
        cnt <= cnt - 1;
    end
    else if (oneBit)
    begin
        shiftReg[11:0] <= ; // ?????
        cnt <= cnt - 1;
    end
    if(cnt == 0) outReg = shiftReg; // we use count(cnt) so that the output is only changed when all 12 bits are ready
end

endmodule
