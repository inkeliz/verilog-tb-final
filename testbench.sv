// Teste
module p;

  // Registradores de Clock, Clear e E.
  reg CLK; reg CLR; reg E;
  
  // Fios de saídas dos Flip-Flops
  wire Q0; wire Q0N; wire Q1; wire Q1N;
  
  // Fios de entrada dos Flip-Flops
  wire D0; wire D0W;
  gate_or D0O(D0W, Q0N, Q1);
  gate_and D0A(D0, E, D0W);
  
  wire D1; wire D1W;
  gate_xor D1X(D1W, Q0, Q1);
  gate_and D1A(D1, E, D1W);
  
  
  // Fios de saídas
  wire S0; wire S1; wire S2; wire S3;
  assign S0 = Q0N;
  gate_or S1W(S1, Q0N, Q1N);
  gate_or S2W(S2, Q0N, Q1N);
  gate_and S3W(S3, Q0N, Q1N);
  
  // Inicializa os flip-flops
  flip_flop_d FFD1(Q0, Q0N, CLK, CLR, D0);
  flip_flop_d FFD2(Q1, Q1N, CLK, CLR, D1);
  
  initial begin
    // Salva o ficheiro de forma de ondas.
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Limpa o flip-flop (CLR = 1).");
    E = 1; CLK = 0; CLR = 1;
    display;
    
    $display("Deixa o flip-flop sincrono (CLR = 0).");
    CLR = 0;
    display;
    
    $display("Define E = 1.");
    E = 1; CLK = ~CLK;
    display;
    
    tick; tick; tick; tick; tick; tick; tick; tick;
    
    $display("Define E = 0.");
    E = 0; CLK = ~CLK;
    display;
    
    tick; tick; tick; tick;
  end
  
  task tick;
    $display("Clock");
    CLK = ~CLK;
    display;
  endtask
  
  task display;
    #1 $display("S0:%0h, S1:%0h, S2:%0h, S3:%0h", S0, S1, S2, S3);
  endtask

endmodule