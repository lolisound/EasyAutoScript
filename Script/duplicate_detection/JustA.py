with open('a.txt','r',encoding='utf-8') as f:
   txt=f.read()

txt = txt.split('\n')
translate = {}
num=1

for i in txt:
    x = i.split()
    if len(x)==2:
        jp = x[0]
        cn = x[1]
        if jp in translate:
            if translate[jp] == cn:
                pass
            else:
                print(jp + ' : ' + translate[jp] + ' / ' + cn)
        else:
            translate[jp]=cn
    else:
        print('line' + str(num) + ":" + str(x))
    num=num+1

text_jp = ''
text_cn = ''

for i in translate:
    text_jp = text_jp + i + '\n'
    text_cn = text_cn + translate[i] + '\n'

with open('jp.txt','w',encoding='utf-8') as f:
    f.write(text_jp)

with open('cn.txt','w',encoding='utf-8') as f:
    f.write(text_cn)
