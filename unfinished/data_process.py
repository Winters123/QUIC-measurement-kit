import sys
global aver
global sume
def calc(rnd):
    print(rnd)
    f = open("Throughput.txt", "r")
    items = []
    start = 0
    end = 0
    for line in f:
        if("+++" in line):
            if int(line[3:]) == rnd:
                start = 1
                end   = 0
            else:
                start = 0
                continue
        elif start == 1:
            if (line[0:2] in "---"):
                if int(line[3:])==rnd:
                    end   = 1
                    start = 0
            if end == 0:
                item = float(line)
                items.append(item)
        else:
            continue
    aver.append(sum(items)/len(items))
    sume.append(sum(items))
    f.close()

if __name__ == "__main__":
    aver = []
    sume = []
    t_c = [5,10,20,30,40,50,60,70]
    for i in range(0,11):
        calc(i)
    print("average:", str(aver))
    print("sum:", str(sume))
    print("finished!")
