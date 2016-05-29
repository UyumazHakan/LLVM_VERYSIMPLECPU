import json, sys, re

def print_lines(lines):
    for line in lines:
        print(line)

def find_unmatches(case, memory):
	matches = case["no_match"]
	for match in matches:
		flag = True
		for line in memory:
			if line == match:
				case["found"].append({match: "0"})
				flag = False
		if flag:
			case["found"].append({match: "1"})
	return case

def find_matches(case, memory):
	matches = case["match"]
	case["found"] = []
	for match in matches:
		flag = True
		for line in memory:
			if int(line) == int(match):
				case["found"].append({match: "1"})
				flag = False
		if flag:
			case["found"].append({match: "0"})
	return case


def get_memory(lines):
	i = 0
	in_memory = False
	memory = []
	pre_number = -1
	while True:
		number = int(re.search("^[^:]*", lines[i]).group(0))
		#print i, number
		if number > 16314 and not in_memory:
			i = i-1
			in_memory = True
		elif not in_memory:
			i = i+1
		elif in_memory and pre_number < (number + 10):
			#print pre_number, number
			memory.append(lines[i][7:])
			i = i-1
		else:
			break
		pre_number = number
	return memory
		

def main():
    output_name = sys.argv[1]
    output = open(output_name).read()
    search_json = json.loads(open("tests/find.json").read())
    expected_results = None
    for case in search_json:
    	if case["name"] == output_name:
    		expected_results = case
    		search_json.remove(case)
    if expected_results == None:
    	expected_results = {"name":sys.argv[1], "match":[], "no_match":[], "found":[]}
    lines = output.splitlines()
    expected_results = find_matches(expected_results, get_memory(lines))
    expected_results = find_unmatches(expected_results, get_memory(lines))
    search_json.append(expected_results)
    open("tests/find.json", "w").write(json.dumps(search_json, sort_keys=True, indent=4))


if __name__ == "__main__":
    main()
