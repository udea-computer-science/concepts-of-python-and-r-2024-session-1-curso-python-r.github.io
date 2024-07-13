
# SESION 6


```python
import os
import numpy as np
import matplotlib.pyplot as plt
```

### Ejemplo:  Random Walk:
A random walk is a mathematical object, known as a stochastic or random process, that describes a path that consists of a succession of random steps on some mathematical space such as the integers. An elementary example of a random walk is the random walk on the integer number line,  $\mathbb{Z}$￼, which starts at 0 and at each step moves +1 or −1 with equal probability.


```python
nsize=1000
x = np.zeros((nsize,1))
y = np.zeros((nsize,1))

for i in range(1,nsize):
    x[i] = i
    prob = np.random.rand()
    if prob<=0.5:
        y[i] = y[i-1] -1.
    else:
        y[i] = y[i-1] + 1.
                

x = x.reshape((len(x),1))
y = y.reshape((len(y),1))

```

## SAVE DATA


```python
data = np.concatenate((x,y),axis=1)
print(data.shape)

np.savetxt('random-walk.tsv',data)
```

    (1000, 2)


## comandos del os
os.getcwd()

os.listdir('.')


```python
os.listdir('.')
```




    ['sesion6.ipynb', '.ipynb_checkpoints', 'random-walk.tsv']



## READ DATAFILE


```python
# Creamos un archivo de texto con dos columnas y varias lineas

file = open('datafile.txt','r')

count=0
for lines in file:
    strings = lines.split(" ")
    print(strings[0]+' '+strings[1])
    count+=1
    
print('total lines: '+str(count))
```

## READ DATAFILE WITH NUMPY


```python
newdata = np.loadtxt('random-walk.tsv',)

```


```python
x1, x2 = np.loadtxt('random-walk.tsv', usecols=(0,1),unpack=True, delimiter=' ')


plt.figure()
plt.plot(x1,x2)
plt.show()
```

## DICCIONARIOS


```python
data = {'name':'sergio','age':33,'profession':'physicist'}
```


```python
for key in data.keys():
    print(key)
```

    name
    age
    profession



```python
medata = {
    'city':'medellin',
    'population': 6E6,
    'age':200,
    'averweather':24,
    'area':3e6    
}
```


```python
person = {}
type(person)


person['fname'] = 'Joe'
person['lname'] = 'Fonebone'
person['age'] = 51
person['spouse'] = 'Edna'
person['children'] = ['Ralph', 'Betty', 'Joey']
person['pets'] = {'dog': 'Fido', 'cat': 'Sox'}
```


```python
person['pets']['cat']
```


```python
person.pop('spouse')
medata.keys()
```

## READ DATAFILE WITH PANDAS


```python
# CREE UN ARCHIVO DE DATOS FORMADO POR COLUMNAS DE DIFERENTES TIPOS DE VARIABLES, STRINGS, INT, FLOATS
import pandas as pd
df = pd.read_csv('datafile2.txt',header=0,sep=" ")
```


```python
df
```


```python
df.iloc[:,0]
```

## Clases

El mecanismo de clases de Python agrega clases al lenguaje con un mínimo de nuevas sintaxis y semánticas. Es una mezcla de los mecanismos de clase encontrados en C++ y Modula-3. Como es cierto para los módulos, las clases en Python no ponen una barrera absoluta entre la definición y el usuario, sino que más bien se apoya en la cortesía del usuario de no “forzar la definición”. Sin embargo, se mantiene el poder completo de las características más importantes de las clases: el mecanismo de la herencia de clases permite múltiples clases base, una clase derivada puede sobreescribir cualquier método de su(s) clase(s) base, y un método puede llamar al método de la clase base con el mismo nombre. Los objetos pueden tener una cantidad arbitraria de datos.


```python
class objeto:
    """
    Notas para manual de referencia
    """
    def __init__(self, name,age,gender):
        self.name = name
        self.age = age
        self.gender = gender
    def func(self):
        print('hola mundo')

```


```python
?objeto
```


    [0;31mInit signature:[0m [0mobjeto[0m[0;34m([0m[0;34m)[0m[0;34m[0m[0m
    [0;31mDocstring:[0m      Notas para manual de referencia
    [0;31mType:[0m           type




```python
x = objeto('sergio',23,'male')
```


```python
x.name
```




    'sergio'




```python
x.age
```




    23


