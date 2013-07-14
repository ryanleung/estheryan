f = open('cheeseFile', 'r')
dictionary = {}
for line in f:
  w = line.find("Wine:")
  if w != -1:
    o = line.find(";")
    wine = line[w+len("Wine: "):o]
    print wine

    s = line.lower().find("Cheese".lower())
    cheeses = line[s+len("Cheese to Consider:"):]
    tempCheeseList = (cheeses.split(","))
    cheeseList = []
    for cheese in tempCheeseList:
      cheeseList.append("@\"" + cheese.strip() + "\"")
    dictionary["@\""+wine+"\""] = cheeseList

print str(dictionary)

#new_dict = dict(zip(dictionary.values(),dictionary.keys()))
#print str(new_dict)    
