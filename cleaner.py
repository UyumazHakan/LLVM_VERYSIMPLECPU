import sys
import re

block_dict = {}

def print_lines(lines):
    for line in lines:
        print(line)

def is_block(line):
    return re.match("^(\\.|!).*:", line) != None

def is_block_ref(word):
    return re.match("^(\\.|!).*", word) != None

def add_static_lines(lines):
    lines.append("16316: 4294967295")
    lines.append("16319: 0")
    lines.append("16349: 16314")
    return lines

def numarize_lines(lines):
    new_lines = []
    i = 0
    for line in lines:
        new_lines.append(str(i) + ": " + line)
        i = i + 1
    return new_lines

def refer_blocks(lines):
    new_lines = []
    for line in lines:
        words = line.split()
        for i in range(len(words)):
            if is_block_ref(words[i]) and words[i] in block_dict:
                words[i] = block_dict[words[i]]
        new_lines.append(" ".join(str(x) for x in words))
    return new_lines



def numarize_blocks(lines):
    i = 0
    new_lines = []
    for line in lines:
        if is_block(line):
            i = i + 1
            new_lines.append("BZJi " + str(i) + " 0")
            block_dict[re.search("^(\\.|!)[^:]*", line).group(0)] = i
            i = i + 1
            new_lines.append(str(i))
        else:
            i = i + 1
            new_lines.append(line)
    return new_lines

def fix_branches(lines):
    new_lines = []
    for line in lines:
        words = line.split()
        inst = words[0]
        if inst == "bg":
            new_lines.append("NAND 16318 16318")
            new_lines.append("BZJ " + words[1] + " 16318")
        elif inst == "bge":
            new_lines.append("BZJ " + words[1] + " 16317")
        elif inst == "bl":
            new_lines.append("NAND 16317 16317")
            new_lines.append("BZJ " + words[1] + " 16317")
        elif inst == "ble":
            new_lines.append("BZJ " + words[1] + " 16318")
        elif inst == "be":
            new_lines.append("ADD 16317 16318")
            new_lines.append("BZJ " + words[1] + " 16317")
        elif inst == "bne":
            new_lines.append("ADD 16317 16318")
            new_lines.append("NAND 16317 16317")
            new_lines.append("BZJ " + words[1] + " 16317")
        else:
            new_lines.append(line)
    return new_lines

def fix_negatives(lines):
    new_lines = []
    for line in lines:
        words = line.split()
        try:
            operand2 = float(words[2])
            if operand2 < 0:
                operand2 = operand2 * -1
                new_lines.append("CPi 16315 "+str(operand2)[:-2])
                new_lines.append("MUL 16315 16316")
                new_lines.append(words[0][:-1] + " " + words[1] + " 16315")
            else:
                new_lines.append(line)
        except (ValueError, IndexError):
            new_lines.append(line)
    return new_lines

def fix_instructions(lines):
    new_lines = []
    for line in lines:
        words = line.split()
        inst = words[0]
        if inst == "mov":
            new_lines.append("CPi "+words[2]+" "+words[1][:-1])
        elif inst == "CPI" and words[2] == "16349":
            new_lines.append("CP "+words[1]+" "+words[2])
        else:
            new_lines.append(line)
    return new_lines

def delete_extra_blocks(lines):
    new_lines = []
    previous_line = lines[0]
    for line in lines[1:]:
        if not is_block(previous_line) or not is_block(line):
            new_lines.append(previous_line)
        previous_line = line
    new_lines.append(lines[-1])
    return new_lines

def divide_lines(lines):
    new_lines = []
    for line in lines:
        words = line.split()
        w_num = len(words)
        if w_num == 1 or w_num == 3:
            new_lines.append(line)
        elif w_num > 5 and w_num % 3 == 0 and line[0] != '.' and line[0] != '!':
            for i in range(w_num/3):
                new_lines.append("\t"+words[i*3]+" "+words[i*3+1]+" "+words[i*3+2])
        else:
            new_lines.append(line)
    return new_lines


def delete_extra_lines(lines):
    new_lines = []
    for line in lines:
        inst = line.split()[0]
        if re.match("^\t(-|\\\\)", line) == None and inst != "nop" and inst != "ret" and inst != "restore" and inst != "call" and inst != "savei":
            new_lines.append(line)
    return new_lines

def delete_line_nums(lines):
    new_lines = []
    for line in lines:
        new_lines.append(re.sub("^[0-9]+:", "", line))
    return new_lines


def skip_unneccessary_lines(lines):
    skip_lines = [".cfi", ".size", ".ident", ".section"]
    new_lines = []
    for line in lines:
        flag = False
        for skip_line in skip_lines:
            if line.find(skip_line) != -1 or line.isspace() or not line:
                flag = True
        if not flag:
            new_lines.append(line)
    return new_lines

def skip_header(lines):
    new_lines = []
    flag = False
    for line in lines:
        if not flag and line[0] == '0':
            flag = True
        if flag:
            new_lines.append(line)
    return new_lines


def main():
    filename = sys.argv[1]
    file = open(filename).read()
    lines = file.splitlines()
    lines = skip_header(lines)
    lines = delete_line_nums(lines)
    lines = skip_unneccessary_lines(lines)
    lines = divide_lines(lines)
    lines = delete_extra_lines(lines)
    lines = delete_extra_blocks(lines)
    lines = fix_instructions(lines)
    lines = fix_negatives(lines)
    lines = fix_branches(lines)
    lines = numarize_blocks(lines)
    lines = refer_blocks(lines)
    lines = numarize_lines(lines)
    lines = add_static_lines(lines)
    print_lines(lines)

if __name__ == "__main__":
    main()
