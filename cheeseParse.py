f = open('cheeseFile','r')
cheeseListToReturn = []
for line in f:
  s = line.find("Cheese to Consider:")
  if s != -1:
    cheeses = line[s+len("Cheese to Consider:"):]
    cheeseList = (cheeses.split(","))
    for cheese in cheeseList:
	if cheese not in cheeseListToReturn:
          cheeseListToReturn.append(cheese)

actualReturn = []
for cheese in cheeseListToReturn:
  actualReturn.append("@\"" + cheese + "\"")
print actualReturn
