//Este modulo garante que a saida oRESET fique no nivel '0' por aprox. 1 milhao 
//de ciclos de relogio, e depois retorne para o nivel '1'. O processo eh repetido
//se FORCE_RESET passar por uma transicao negativa ('1' => '0')
module LCD_Reset_Delay( input iCLK, input FORCE_RESET, output reg oRESET);
reg    [19:0]    Cont = 0;

always@(posedge iCLK, negedge FORCE_RESET)
begin
    if (!FORCE_RESET) Cont <= 0; else begin
		 if(Cont!=20'hFFFFF)
		 begin
			  Cont    <=    Cont + 1'b1;
			  oRESET    <=    1'b0;
		 end
		 else
		 oRESET    <=    1'b1;
	 end
end

endmodule
