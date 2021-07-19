import re
import os

with open('a.txt','r',encoding='utf-8') as f:
   cn=f.read()

with open('b.txt','r',encoding='utf-8') as f:
   jp=f.read()

cn = cn.split()
jp = jp.split()
translate = {}

def tr(text):
    for i in translate:
        text = re.sub('/'+i+'/','/'+translate[i]+'/',text)
        text = re.sub('】</span>'+i+'/','】</span>'+translate[i]+'/',text)
        text = re.sub('/'+i+'<','/'+translate[i]+'<',text)
    return(text)

if len(cn) == len(jp):
    for i in range(len(cn)):
        if jp[i] in translate:
            if translate[jp[i]] == cn[i]:
                pass
            else:
                print(jp[i] + ' : ' + translate[jp[i]] + '/' + cn[i])
        else:
            translate[jp[i]]=cn[i]

file  = os.listdir()
for x in file:
    if '.html' in x:
        with open(x,'r',encoding='utf-8') as f:
           html=f.read()
        with open(x,'w',encoding='utf-8') as f:
            f.write(tr(html))

print("Enter the word：")
xx = input('>>> ')
while xx != 'exit':
    if xx in translate:
        print(t[xx])
    else:
        pass
    xx = input('>>> ')


