
# SESION 4


```python
import numpy as np
import matplotlib.pyplot as plt
```

##  OPERADORES LOGICOS

* Mayor que: >
* Mayor igual que: >=
* Igual: ==
* Menor que: <
* Menor igual que: <=
* y: and, &
* o: or, 

## CONDICIONALES:

```python
if 'condicion':
    statement

if 'condition':
    statement
else:
    statement
    
    
if 'condition':
    statement
    
elif:
    statement
    
else:
    statement
    

```

##  Ejemplo:


```python
## USER AND PASSWORD

log="login"
psswd=12345

input_log = raw_input("Login: ")
input_psswd = input("password: ")

if (log == input_log) & (psswd==input_psswd):
    print('\naccess granted!')
else:
    print('\nwrong password or username!')

```

    Login: user
    password: 123
    
    wrong password or username!


## CICLOS

```python
for 'variable' in 'list or array':
    statement;


while 'condition':
    statement;
    
while 'condition':
    statement;
    break
    statement;
    continue

```

### Ejemplo:


```python
sum = 0
for i in range(8):
    sum = sum + i
    print(sum)
```

    0
    1
    3
    6
    10
    15
    21
    28



```python
for i in range(100):
    print('hola '+str(i))
```

    hola 0
    hola 1
    hola 2
    hola 3
    hola 4
    hola 5
    hola 6
    hola 7
    hola 8
    hola 9
    hola 10
    hola 11
    hola 12
    hola 13
    hola 14
    hola 15
    hola 16
    hola 17
    hola 18
    hola 19
    hola 20
    hola 21
    hola 22
    hola 23
    hola 24
    hola 25
    hola 26
    hola 27
    hola 28
    hola 29
    hola 30
    hola 31
    hola 32
    hola 33
    hola 34
    hola 35
    hola 36
    hola 37
    hola 38
    hola 39
    hola 40
    hola 41
    hola 42
    hola 43
    hola 44
    hola 45
    hola 46
    hola 47
    hola 48
    hola 49
    hola 50
    hola 51
    hola 52
    hola 53
    hola 54
    hola 55
    hola 56
    hola 57
    hola 58
    hola 59
    hola 60
    hola 61
    hola 62
    hola 63
    hola 64
    hola 65
    hola 66
    hola 67
    hola 68
    hola 69
    hola 70
    hola 71
    hola 72
    hola 73
    hola 74
    hola 75
    hola 76
    hola 77
    hola 78
    hola 79
    hola 80
    hola 81
    hola 82
    hola 83
    hola 84
    hola 85
    hola 86
    hola 87
    hola 88
    hola 89
    hola 90
    hola 91
    hola 92
    hola 93
    hola 94
    hola 95
    hola 96
    hola 97
    hola 98
    hola 99



```python
data = np.random.rand(25).reshape((5,5))
print(data)

print()

for i in range(5):
    print(data[i,i])
```

    [[0.41177942 0.76616697 0.02114611 0.9238797  0.7456346 ]
     [0.57257074 0.36914177 0.74493035 0.75516412 0.47740324]
     [0.6010903  0.82103019 0.80169053 0.18381342 0.42746362]
     [0.2108293  0.46588895 0.48389307 0.28273228 0.20359842]
     [0.308563   0.89958165 0.01599051 0.81765653 0.76312874]]
    
    0.41177941977894983
    0.36914177019607963
    0.801690525452275
    0.2827322800655172
    0.7631287356656551


### CICLO WHILE


```python
i=0
while i<10:
    print(i)
    i += 1
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9


## Ejemplo:
* Converge la serie?


```python
def sum1(n):
    sum=0
    for i in range(1,n):
        sum += 1./(3.*i - 2.)**(i + 0.5)
    return sum
        
```


```python
sum1(100)
```




    1.032384322161901



## Ejercicio:
Compruebe la convergencia de las siguientes series:

$$
\sum^\infty_{n=1} (-1)^n \tanh n
$$


$$
\sum^\infty_{n=1} \frac{(\tan^{-1} n)^2}{n^2+1}
$$

$$
\sum^\infty_{n=2} \frac{\log_n (n!)}{n^3}
$$

## Ejercicio:
Demuestre numericamente que:
$$
\sum^\infty_{n=1} \frac{n(n+1)}{x^n} = \frac{2x^2}{(1-x)^3}
$$

## Ejemplo: Conjunto de Mandelbrot


```python
from pylab import *
from numpy import NaN
 
def m(a):
    z = 0
    for n in range(1, 100):
        z = z**2 + a
        if abs(z) > 2:
            return n
    return NaN
 
X = arange(-2, .5, .002)
Y = arange(-1,  1, .002)
Z = zeros((len(Y), len(X)))
 
for iy, y in enumerate(Y):
    for ix, x in enumerate(X):
        Z[iy,ix] = m(x + 1j * y)
figure(figsize=(8,8))
imshow(Z, cmap = plt.cm.prism, interpolation = 'none', extent = (X.min(), X.max(), Y.min(), Y.max()))
xlabel("Re(c)")
ylabel("Im(c)")
colorbar()
savefig("mandelbrot_python.svg")
show()
```


![png](output_19_0.png)


### Ejemplo:  Random Walk:
A random walk is a mathematical object, known as a stochastic or random process, that describes a path that consists of a succession of random steps on some mathematical space such as the integers. An elementary example of a random walk is the random walk on the integer number line,  $\mathbb{Z}$￼, which starts at 0 and at each step moves +1 or −1 with equal probability.


```python
nsize=1000
x = np.zeros(nsize)
y = np.zeros(nsize)

for i in range(1,nsize):
    x[i] = i
    prob = np.random.rand()
    if prob<=0.5:
        y[i] = y[i-1] -1.
    else:
        y[i] = y[i-1] + 1.
        

```


```python

```


![png](output_22_0.png)



```python
hist_plot(metropolis(10000))
plt.show()
```


![png](output_23_0.png)

