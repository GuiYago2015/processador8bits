module Processador;
PC pc_module (
.input_data(saida_ulaSomaBranch[7:0]),
.clk(clk),
.reset(reset),
.output_data(pc_output[7:0])
);
Cmp cmp_module (
.cmp_input(saida_extensor2[7:0]),
.clk(clk),
.reset(reset),
.cmp_output(cmp_output[7:0])
);
RegisterFile registerFile(
.regAddr1(saida_bits[2:0]),
.regAddr2(instruction[1:0]),
.regAddrWrite(saida_bits[2:0]),
.inputData(saida_WriteOnReg[7:0]),
.RegWrite(RegWrite),
.clk(clk),
.regData1(regData1[7:0]),
.regData2(regData2[7:0])
);
MemoriaInstrucao memoriaInstrucao (
.clk(clk),
.reset(reset),
.endereco(pc_output[7:0]),
.saida(intrucao[7:0])
);
MemoriaDados memoriaDados (
.clk(clk),
.memwrite(MemWrite),
.memread(MemRead),
.endereco(regData1[7:0]),
.dado_entrada(regData2[7:0]),
.dado_saida(memoriaDados_output[7:0])
);
Controle controle (.opcode(instrucao[7:5]),
.WriteOnReg(WriteOnReg),
.UlaOP(ulaOP[1:0]),
.MemRead(MemRead),
.MemWrite(MemWrite),
.bits(sinal_bits),
.Imediato(Imediato),
.RegWrite(RegWrite),
.Branch(Branch),
.CMP(CMP)
);
ULA_8bits ULA (
.entrada1(saida_Imediato[7:0]),
.entrada2(regData2[7:0]),
.ulaOP(ulaOP[1:0]),
.saida(saidaULA[7:0]),
.igual(igualULA)
);
Mux_Bits mux_bits (
.entrada3(instrucao[4:2]),
.entrada2(instrucao[4:3]),
.bits(sinal_bits),
.saida(saida_bits[2:0])
);
Mux_WriteOnReg mux_WriteOnReg (
.entrada1(saidaULA[7:0]),
.entrada2(memoriaDados_output[7:0]),
.WriteOnReg(WriteOnReg),
.saida(saida_WriteOnReg[7:0])
);
Mux_Imediato mux_Imediato (
.entrada1(regData1[7:0]),
.entrada2(saida_extensor1[7:0]),
.imediato(Imediato),
.saida(saida_Imediato[7:0])
);
Mux_Branch mux_Branch (
.entrada0(saida_extensor3[7:0]),
.entrada1(8'b00000000),
.branch(resultoAND),
.saida(saida_Branch[7:0])
);Extensor_Sinal_1 extensor1 (
.entrada(instrucao[2:0]),
.saida(saida_extensor1[7:0])
);
Extensor_Sinal_2 extensor2 (
.entrada(igual),
.saida(saida_extensor2[7:0])
);
Extensor_Sinal_3 extensor3 (
.entrada(instrucao[3:0]),
.saida(saida_extensor3[7:0])
);
UlaSoma1 ulaSoma1 (
.entrada(pc_output[7:0]),
.saida(saida_ulaSoma1[7:0])
);
UlaSomaBranch ulaSomaBranch (
.entrada1(saida_ulaSoma1[7:0]),
.entrada2(saida_Branch[7:0]),
.saida(saida_ulaSomaBranch[7:0])
);
portaAND portaAND (
.branch(cmp_output[7:0]),
.cmp(cmp_output[7:0]),
.result(resultoAND)
);
//delcarações
reg clock;
reg reset;
wire [7:0] intrucao;
wire [2:0] saida_bits;
wire sinal_bits;
wire igual;
wire Branch;
wire CMP;
wire WriteOnReg;
wire RegWrite;
wire resultadoAND;
wire [7:0] saida_extensor2;
wire [7:0] cmp_output;wire [7:0] saida_Branch;
wire [7:0] saida_ulaSoma1;
wire [7:0] saida_ulaSomaBranch;
wire [7:0] pc_output;
wire MemRead;
wire MemWrite;
wire [7:0] regData2;
wire [7:0] memoriaDados_output;
wire [7:0] saida_WriteOnReg; // dado escrito no registrador
wire [1:0] ulaOP;
wire Imediato;
wire [7:0] saida_extensor1;
wire [7:0] saida_Imediato; // saida mux imediato
wire [7:0] saida_extensor3;
wire [7:0] saidaULA;
reg i;
initial begin
for (i = 0; i <= 255; i = i + 1) begin
memoriaInstrucao.memoria[i] <= 8'b00000000;
end
end
always begin
#10 clock = ~clock;
end
always @(clock) begin
$display("Teste: %b", registerFile.regData1);
end
endmodule
