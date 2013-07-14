c = open('cheeses', 'r')
tempCheeseList = c.read().split(",@")
cheeseList = []
for cheese in tempCheeseList:
  cheeseList.append(cheese.strip().translate(None, '"'))
cheeseDict = {}
for cheese in cheeseList:
  cheeseDict["@\"" + cheese + "\""] = []

f = open('cheeseFile', 'r')
for line in f:
  index1 = line.find("Wine:")
  if index1 != -1: 
    index2 = line.find(";")
    wine = line[len("Wine: "):index2]
    for cheese in cheeseList:
      if cheese in line:
        cheeseDict["@\"" + cheese + "\""].append("@\"" + wine + "\"")

print str(cheeseDict)
