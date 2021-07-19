file = [['life','plant.html'],
['life','animal.html'],
['life','pet.html'],
['life','carriage.html'],
['life','prop.html'],
['life','extension.html'],
['life','maker.html'],]


with open('./initial/introduction.html', 'r') as f:
    html = f.read()

for i in file:
    with open('./' + i[0] + '/' + i[1] , 'w') as f:
        f.write(html)
