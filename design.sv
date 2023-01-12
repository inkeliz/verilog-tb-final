module gate_or(output o, input a, b); 
  assign o = a | b; // OR
endmodule

module gate_and(output o, input a, b);
  assign o = a && b; // AND
endmodule

module gate_xor(output o, input a, b);
  assign o = a ^ b; // XOR
endmodule

module flip_flop_d(output q, qn, input clk, clr, d);
  reg        r;   // Registrador
  assign q = r;   // Saida
  assign qn = ~r; // Saida Negada

  always @(posedge clk or posedge clr)
  begin
    if (clr) begin
      r <= 1'b0; // Clear on-rising (define o valor para 0)
    end else begin
      r <= d;    // Clock on-rising (define o valor para D)
    end
  end
endmodule