module start_bit(input data, input clk, input en, input reset, output start); 

wire [11:0]q;
twelve_shift Twelvebitshift1(data, clk, en, reset, q[11:0]);

wire w1,w2;
and and4(w1, q[0], ~q[1], ~q[2], ~q[3], ~q[4], ~q[5], ~q[6], ~q[7], ~q[8], ~q[9],~q[10],q[11]);
and and5(w2, q[0], ~q[1], ~q[2], ~q[3], ~q[4], ~q[5], ~q[6], ~q[7], ~q[8], ~q[9],q[10]);
or or1(start, w1,w2);

endmodule
