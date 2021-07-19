with open('a.txt','r',encoding='utf-8') as f:
   cn=f.read()

with open('b.txt','r',encoding='utf-8') as f:
   jp=f.read()

cn = cn.split()
jp = jp.split()
translate = {}

if len(cn) == len(jp):
    for i in range(len(cn)):
        if jp[i] in translate:
            if translate[jp[i]] == cn[i]:
                pass
            else:
                print(jp[i] + ' : ' + translate[jp[i]] + '/' + cn[i])
        else:
            translate[jp[i]]=cn[i]
else:
    print('The number of texts is not equal.')
a=''
b=''

for i in translate:
    a = a + i + '\n'
    b = b + translate[i] + '\n'

with open('jp.txt','w',encoding='utf-8') as f:
    f.write(a)
with open('cn.txt','w',encoding='utf-8') as f:
    f.write(b)
