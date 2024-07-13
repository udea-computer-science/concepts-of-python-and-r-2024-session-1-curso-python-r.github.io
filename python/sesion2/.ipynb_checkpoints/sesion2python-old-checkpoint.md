
# SESION 3

## MATPLOTLIB 

### HISTOGRAMAS


```python
import numpy as np
import matplotlib.pyplot as plt
```


```python
x=np.random.rand(1000)
plt.hist(x,100)
plt.show()
```


![png](output_4_0.png)



```python
def GaussDist(x,sigma,mu):
    return np.exp(-((x-mu)**2.)/(2.*sigma**2.))/(sigma*np.sqrt(2.*np.pi))
```


```python
x = np.linspace(-5,5,5000)
y = GaussDist(x,0.1,0.)
plt.figure(figsize=(6,4))
plt.plot(x,y,'k-.',lw=3)
plt.xlabel('x',fontsize=20)
plt.ylabel('y',fontsize=40,color='r')
plt.xlim(-5,2)
plt.show()
```


![png](output_6_0.png)



```python
plt.figure(figsize=(8,8))
plt.plot(x,np.gradient(y))
plt.show()
```


![png](output_7_0.png)


### Ejercicio:
Una empresa fabrica estantes para computadoras personales. Para cierto modelo, el costo total c (en miles de dólares) cuando se producen $\textbf{q}$ _cientos_ de estantes, está dado por
\begin{equation}
c=2q^3-9q^2+12q+20
\end{equation}
* La empresa tiene actualmente capacidad para producir entre 75 y 600 (inclusive) estantes por semana. Determine el número de estantes que debe producir por semana para minimizar el costo total y encuentre el correspondiente costo promedio por estante.


```python
def c(q):
    out=2.*q**3. - 9.*q**2. + 12.*q + 20.
    return out

```


```python
q=np.linspace(.75,6.01,10000)
total_cost=c(q)

dcdq=np.gradient(total_cost)

plt.figure()
plt.plot(q,total_cost)
plt.show()


plt.figure()
plt.plot(q,dcdq)
plt.show()

```


![png](output_10_0.png)



![png](output_10_1.png)



```python
total_cost[dcdq.argmin()]
q[dcdq.argmin()]
```




    1.50015101510151



*  Suponga que deben producirse entre 300 y 600 estantes. ¿Cuántos deberían producirse ahora para minimizar el costo total?


## Subplot


```python
plt.figure(figsize=(16,8))

plt.subplot(1,2,1,)
plt.plot(q,total_cost)

plt.subplot(1,2,2)
plt.plot(q,dcdq)

plt.show()
```


![png](output_14_0.png)


## Graficas de densidad


```python
def GausDist2D(x, y, mu1, mu2, sigma1,sigma2):
    z = np.exp( -(x-mu1)**2./(2.*sigma1**2.) - (y-mu2)**2./(2.*sigma2**2.)  )/(2.*np.pi*sigma1*sigma2)
    return z
```


```python
x, y = np.meshgrid(np.linspace(-1., 1., 200),np.linspace(-1., 1., 200))
z = GausDist2D(x, y, 0., 0., 0.5, 0.5)
```


```python
plt.figure(figsize=(8,8))
plt.pcolor(x,y,z,cmap='seismic')
plt.show()
```


![png](output_18_0.png)


## Graficas de Dispersion


```python
nsize = 1000
x = np.linspace(0,3*np.pi,nsize)
y = np.sin(x) + 0.3*np.random.rand(nsize)
```


```python
plt.figure(figsize=(16,12))
plt.title('name')
plt.scatter(x,y,c='k',alpha=0.5,lw=5)
plt.show()
```


![png](output_21_0.png)


### Como guardar imagenes


```python
plt.figure(figsize=(16,12))
plt.title('name')
plt.scatter(x,y,c='k',alpha=0.5,lw=5)
plt.savefig('figure1.png',bbox_inches='tight')
plt.show()
```


![png](output_23_0.png)


## PROBLEMA DE ELASTICIDAD

La elasticidad puntual de la demanda es un número que mide cómo la demanda del consumidor es afectada por el cambio en el precio. Está dada por
\begin{equation}
\eta = \frac{q/p}{dq/dp}
\end{equation}
donde $p$ es el precio por unidad al que se demandan $q$ unidades. Las tres categorías de elasticidad son:
* $|\eta|$>1, demanda elástica,
* $|\eta|$=1, demanda unitaria
* $|\eta|$<-1, demanda inelastica


La ecuación de demanda para un producto es
\begin{equation}
q= \sqrt{100-p}, \quad \text{donde  } 0<p<100
\end{equation}
* Encuentre todos los precios que corresponden a una demanda elástica.

* Calcule la elasticidad puntual de la demanda cuando $p= 40$. Use su respuesta para estimar el incremento o disminución porcentual en la demanda cuando el precio se incrementa en $5\%$ para $p= 42$.




```python
def q(p):
    return np.sqrt(100. - p)
```


```python
p = np.linspace(0.001,99.999,5000)
eta = q(p)/p
eta /= np.gradient(eta)
eta = np.abs(eta)
```


```python
plt.figure()
plt.plot(p,eta)
plt.show()
```


![png](output_29_0.png)



```python
eta.max()
```




    1715.419688039962



# Ejercicio:

Ingreso, costo y utilidad La tabla siguiente da los valores de las funciones de ingreso marginal (IM) y de costo marginal (CM) de una empresa:


|q | 0 3 6 9 12 15 18|
|----:|-----:|
| IM | 25 22 18 13 7 3 0 |
| CM | 15 14 12 10 7 4 2 |


El costo fijo de la empresa es 25. Suponga que la utilidad es máxima cuando $IM= CM$ y que esto ocurre cuando $q= 12$. Además, suponga que la producción de la empresa se escoge en forma tal que maximice la utilidad. Utilice la regla del trapecio y la regla de Simpson en cada una de las siguientes partes.


* Estime el ingreso total usando tantos datos como sea posible.
* Estime el costo total usando los menos datos posibles.
* Determine cómo está relacionada la utilidad máxima con el área encerrada por la línea $q= 0$ y las curvas $IM$ y $CM$; use esta relación para estimar la utilidad máxima tan exactamente como sea posible.



```python
q = np.array([0., 3., 6., 9., 12., 15., 18.])
IM = np.array([ 25., 22., 18., 13., 7., 3., 0.])
CM = np.array([15., 14., 12., 10., 7., 4., 2.])
```


```python
plt.figure()
plt.plot(q,IM,label='IM')
plt.plot(q,CM,label='CM')
plt.legend()
plt.show()
```


![png](output_33_0.png)



```python
print('El ingreso total es: '+str(np.trapz(IM,q)) )
print('El costo total es: '+str(np.trapz(CM,q)) )
```

    El ingreso total es: 226.5
    El costo total es: 166.5

