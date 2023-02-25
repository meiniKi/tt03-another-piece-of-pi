// Densely packed decimal (DPD) to decimal, circuit in Verilog.
// Made of just 39 NANDs.
//
// By Kim Øyhus 2019 (c) into (CC BY-SA 3.0.)
// This work is licensed under the Creative Commons Attribution 3.0
// Unported License. To view a copy of this license, visit
// https://creativecommons.org/licenses/by-sa/3.0/
//
// This is my entry to win this Programming Puzzle & Code Golf
// at Stack Exchange: 
// https://codegolf.stackexchange.com/questions/176557/densely-packed-decimal-dpd-to-decimal-with-logic-gates
//
// TASK:
// 3 decimal digits are stored in 10 bits in the DPD format,
// and this circuit transforms them into 3 decimal digits in
// 4 bits each, BCD format.
//
// 39 gates seem to be the smallest possible NAND circuit there is
// for this task, but I can get even lower by a trick, to 37:
// I assume that the largest numbers are correctly encoded.
//   888, 889, 898, 899, 988, 989, 998, 999 are to be encoded
// with the 2 MSB as 00, requiring just 37 NANDs for decoding.
//
//   However, in the specification for decoding, they are specified
// to be ignored, meaning they can be anything. It is a reasonable
// assumption that this freer specification could require even fewer
// gates, but the opposite is true. 39 gates are required for this.
// This saving could give real benefits for real circuits.
//
//   This DPD format seems to be used a lot for storing decimal numbers
// in computers and IO for ALUs, even though it is stored as 12 bits
// per 3 digits inside the ALUs and for other calculations.
// There are many patents for these kinds of circuits, and so I am
// a little skeptical for making a free one for a competition.
// However, the point is to make it as small as possible and of just
// NAND gates, which in itself is not so commercially interesting.


module decode1000 ( in_000, in_001, in_002, in_003, in_004, in_005, in_006, in_007, in_008, in_009, out000, out001, out002, out003, out004, out005, out006, out007, out008, out009, out010, out011 );
input  in_000, in_001, in_002, in_003, in_004, in_005, in_006, in_007, in_008, in_009;
output out000, out001, out002, out003, out004, out005, out006, out007, out008, out009, out010, out011;
wire   wir000, wir001, wir002, wir003, wir004, wir005, wir006, wir007, wir008, wir009, wir010, wir011, wir012, wir013, wir014, wir015, wir016, wir017, wir018, wir019, wir020, wir021, wir022, wir023, wir024, wir025, wir026, wir027, wir028, wir029, wir030, wir031, wir032;

// The 3 bits of 1s goes straight through from input to output.
assign out000 = in_000;
assign out004 = in_004;
assign out008 = in_007;
 
nand gate001 ( wir001, in_003, in_001 );
nand gate002 ( wir002, in_002, in_003 );
nand gate003 ( wir003, wir001, in_006 );
nand gate004 ( wir004, wir002, in_001 );
nand gate005 ( wir005, wir001, wir001 );
nand gate006 ( wir006, in_005, in_001 );
nand gate007 ( wir007, wir006, in_003 );
nand gate009 ( wir008, wir004, wir007 );
nand gate010 ( wir009, wir005, in_006 );
nand gate011 ( wir010, wir007, wir007 );
nand gate012 ( wir011, wir009, in_002 );
nand gate013 ( wir012, wir011, wir009 );
nand gate014 ( wir013, wir011, wir011 );
nand gate015 ( wir014, in_008, wir013 );
nand gate016 ( wir015, in_009, wir013 );
nand gate017 ( wir016, wir010, wir014 );
nand gate018 ( wir017, wir014, wir005 );
nand gate019 ( wir018, wir015, wir015 );
nand gate020 ( wir019, wir011, wir008 );
nand gate021 ( wir020, wir019, wir006 );
nand gate022 ( wir021, wir010, wir018 );
nand gate023 ( wir022, wir020, wir004 );
nand gate024 ( wir023, wir016, wir008 );
nand gate025 ( out001, wir023, wir023 );
nand gate026 ( out003, wir022, wir022 );
nand gate027 ( wir024, wir005, wir008 );
nand gate028 ( wir025, wir012, wir002 );
nand gate029 ( wir026, wir019, in_003 );
nand gate031 ( out007, wir024, wir009 );
nand gate032 ( out011, wir026, wir026 );
nand gate033 ( wir028, wir017, in_005 );
nand gate035 ( wir030, wir026, in_008 );
nand gate036 ( out005, wir028, wir028 );
nand gate037 ( out009, wir030, wir030 );
nand gate039 ( wir031, wir026, in_009 );
nand gate041 ( out010, wir031, wir031 );
nand gate042 ( wir032, out003, wir018 );
nand gate043 ( out006, wir003, wir032 );
nand gate044 ( out002, wir025, wir021 );
endmodule

  
