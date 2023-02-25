
// Author: James Ross
// https://github.com/jar/tt02_freespeech/blob/main/src/decoder.v

/*
      ---0---
     |       |
     5       1
     |       |
      ---6---
     |       |
     4       2
     |       |   _
      ---3---   |7|
*/

module decoder (
  input wire [3:0] code,
  output reg [7:0] segments
);
  always @(*) begin
    /* verilator lint_off CASEX */
    casex(code)
      4'b0000: segments = 8'b00111111;
      4'b0001: segments = 8'b00000110;
      4'b0010: segments = 8'b01011011;
      4'bx011: segments = 8'b01001111;
      4'bx100: segments = 8'b01100110;
      4'bx101: segments = 8'b01101101;
      4'bx110: segments = 8'b01111101;
      4'bx111: segments = 8'b00000111;
      4'b1000: segments = 8'b01111111;
      4'b1001: segments = 8'b01100111;
      4'b1010: segments = 8'b10000000;
    endcase
    /* verilator lint_on CASEX */
  end
endmodule