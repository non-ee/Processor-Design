o = {
    'lui': "0110111",
    'auipc': "0010111",
    'jal': "1101111",
    'jalr': "1100111"
}
o['beq']=o['bne']=o['blt']=o['bge']=o['bltu']=o['bgeu']="1100011"
o['lb']=o['lh']=o['lw']=o['lbu']=o['lhu']="0000011"
o['sb']=o['sh']=o['sw']="0100011"
o['addi']=o['slti']=o['sltiu']=o['xori']=o['ori']=o['andi']=o['slli']=o['srli']=o['srai']="0010011"
o['add']=o['sub']=o['sll']=o['slt']=o['sltu']=o['xor']=o['srl']=o['sra']=o['or']=o['and']="0110011"

f2={}
f2['jalr']=f2['beq']=f2['lb']=f2['sb']=f2['addi']=f2['add']=f2['sub']="000"
f2['bne']=f2['lh']=f2['sh']=f2['slli']=f2['sll']="001"
f2['lw']=f2['sw']=f2['slti']=f2['slt']="010"
f2['sltiu']=f2['slti']="011"
f2['blt']=f2['lbu']=f2['xori']=f2['xor']="100"
f2['bge']=f2['lhu']=f2['srli']=f2['srai']=f2['srl']=f2['sra']="101"
f2['bltu']=f2['ori']=f2['or']="110"
f2['bgeu']=f2['andi']=f2['and']="111"

binfill = lambda x, base, fill : bin(int(x,base))[2:].zfill(fill)

def hexInst_gen(inst):
    word = inst.split(",")
    opcode = o[word[0]]

    # U-type
    if opcode == "0110111" or opcode == "0010111":
        rd = binfill(word[1][1:], 10, 5)
        Imm = binfill(word[2][2:], 16, 20)
        inst32 = Imm + rd + opcode

    #J-type    
    elif opcode == "1101111":
        pass

    # I-type
    elif opcode == "1100111" or opcode == "0000011" or opcode == "0010011":
        rd = binfill(word[1][1:], 10, 5)
        rs1 = binfill(word[2][1:], 10, 5)
        Imm = binfill(word[3][2:], 16, 12)
        func2 = f2[word[0]]
        inst32 = Imm + rs1 + func2 + rd + opcode

    elif opcode == "0100011":
        rs1 = binfill(word[1][1:], 10, 5)
        rs2 = binfill(word[2][1:], 10, 5)
        func2 = f2[word[0]]
        Imm = binfill(word[3][2:], 16, 12)
        
        inst32 = Imm[:7] + rs2 + rs1 + func2 + Imm[7:] + opcode

    elif opcode == "1100011":
        rs1 = binfill(word[1][1:], 10, 5)
        rs2 = binfill(word[2][1:], 10, 5)
        func2 = f2[word[0]]
        Imm = binfill(word[3][2:], 16, 13)

        inst32 = Imm[0] + Imm[2:8] + rs2 + rs1 + func2 + Imm[8:12] + Imm[1]
    
    elif opcode == "0110011":
        rd = binfill(word[1][1:], 10, 5)
        rs1 = binfill(word[2][1:], 10, 5)
        rs2 = binfill(word[3][1:], 10, 5)
        func2 = f2[word[0]]
        func3 = "0100000" if opcode in {"srai", "sub", "sra"} else "0000000"

        inst32 = func3 + rs2 + rs1 + func2 + rd + opcode

    return hex(int(inst32,2))[2:].zfill(8)
        
    

def hexEncoder(filetxt, outpath):
    f = open(filetxt, 'r')
    inst_txt = f.read()

    open(outpath, 'w').write("")
    fw = open(outpath, 'a')

    inst_list = inst_txt.split('\n')
    for inst in inst_list:
        h = hexInst_gen(inst[8:])
        fw.write(f'@{inst[2:7]}\n{h[:2]}\n{h[2:4]}\n{h[4:6]}\n{h[6:]}\n')

        
        

    

outpath = "../test/Imem_t.dat"
hexEncoder("inst.txt", outpath)



    
    