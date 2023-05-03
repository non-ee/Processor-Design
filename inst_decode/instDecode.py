ADDR_SIZE = 5
INST_SIZE = 8
opcode_dist = {
    "0110111" : {'type': "U-type", 'name': "lui"},
    "0010111" : {'type': "U-type", 'name': "auipc"},
    "1101111" : {'type': "J-type", 'name': "jal"},
    "1100111" : {'type': "I-type", 'name': "jalr"},
    "1100011" : {'type': "B-type", 'name': "branch"},
    "0000011" : {'type': "I-type", 'name': "load"},
    "0100011" : {'type': "S-type", 'name': "store"},
    "0010011" : {'type': "I-type", 'name': "I-op"},
    "0110011" : {'type': "R-type", 'name': "R-op"}
}

branch_dist = {
    "000" : "beq",
    "001" : "bne",
    "100" : "blt",
    "101" : "bge",
    "110" : "bltu",
    "111" : "bgeu"
}

byteSize_dist = {
    "000" : "b", 
    "001" : "h",
    "010" : "w",
    "100" : "bu",
    "101" : "hu"
}

op_dist = {
    "000" : "add",
    "001" : "sll",
    "010" : "slt",
    "011" : "sltu",
    "100" : "xor",
    "101" : "srl",
    "110" : "or",
    "111" : "and"
}

add_sub = {
    "0000000" : "add",
    "0100000" : "sub",
}

srA_L = {
    "0000000" : "srl",
    "0100000" : "sra"
}


### opcode を解読する関数
def opcode_decode(opcode, func2, func3):
    _opcode = opcode_dist[opcode]['name']

    if _opcode == "branch":
        return branch_dist[func2]
    elif _opcode == "load":
        return "l" + byteSize_dist[func2]
    elif _opcode == "store":
        return "s" + byteSize_dist[func2]
    elif _opcode == "I-op":
        _opcode = op_dist[func2]
        if _opcode == "srl":
            return  srA_L[func3] + 'i'
        return _opcode + 'i'
    elif _opcode == "R-op":
        _opcode = op_dist[func2]
        if _opcode == "add":
            return add_sub[func3]
        elif _opcode == "srl":
            return srA_L[func3]
        return _opcode

    return _opcode

### 32bitの命令を解読する
def inst_decode(hex_inst):
    inst = bin(int(hex_inst, 16))[2:].zfill(32)

    opcode, func2, func3 = inst[-7:], inst[-15:-12], inst[:-25]
    opcode = opcode_decode(opcode, func2, func3)
    inst_type = opcode_dist[inst[-7:]]['type']

    rs1 = int(inst[-20:-15], 2)
    rs2 = int(inst[-25:-20], 2)
    rd  = int(inst[-12:-7], 2)

    if inst_type == "U-type":
        Imm = hex(int(inst[:-12], 2))
        return f'{opcode: <5} r{rd: <2},      {Imm: >8}'
    elif inst_type == "J-type":
        Imm = inst[-21] + inst[-11:-1] + inst[-12] + inst[-20:-13] + '0'
        Imm = hex(int(Imm, 2))
        return f'{opcode: <5} r{rd: <2},      {Imm: >8}'

    elif inst_type == "I-type":
        Imm = hex(int(inst[-12:], 2))
        return f'{opcode: <5} r{rd: <2}, r{rs1: <2}, {Imm: >8}'

    elif inst_type == "S-type":
        Imm = hex(int(inst[-12:-5] + inst[-5:], 2))
        return f'{opcode: <5} r{rs1: <2}, r{rs2: <2}, {Imm: >8}'
    
    elif inst_type == "B-type":
        Imm = hex(int(inst[-13] + inst[-11:-5] + inst[-5:-1] + inst[-12], 2))
        return f'{opcode: <5} r{rs1: <2}, r{rs2: <2}, {Imm: >8}'
    
    elif inst_type == "R-type":
        func3 = inst[:-25]
        return f'{opcode: <5} r{rd: <2}, r{rs1: <2}, r{rs2: <2}'

### Imem.dat --> "addr : instruction"
def file_decode(filepath):
    f = open(filepath, 'r')
    inst_format = f.read()
    inst_format = inst_format.replace('\n', '')
    inst_format = inst_format.replace('@', '')

    inst_list = []
    while True:
        if len(inst_format) == 0:
            break
        addr = '0x' + inst_format[:ADDR_SIZE]
        inst_format = inst_format[ADDR_SIZE:]

        if len(inst_format) == 0:
            inst_list.append({'addr': addr, 'inst': None})
            break
        inst = inst_format[:INST_SIZE]
        inst_format = inst_format[INST_SIZE:]
        inst_list.append({'addr': addr, 'inst': inst_decode(inst)})

    f.close()
    return inst_list


### ファイル出力
## filepath : 入力ファイルpath
## name : 出力ファイル名
def txtInst_gen(filepath, name):
    txtname = name + ".txt"
    f = open(txtname, 'w')
    f.write('')
    f.close()

    f = open(txtname, 'a')
    for inst in file_decode(filepath):
        newline = "{} : {}\n".format(inst['addr'], inst['inst'])
        f.write(newline)
    f.close()



filepath = r"../Imem.dat"
name = "out1"
txtInst_gen(filepath, name)