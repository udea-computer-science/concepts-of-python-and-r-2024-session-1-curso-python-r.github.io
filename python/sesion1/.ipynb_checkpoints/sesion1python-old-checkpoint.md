
# SESION 1-2 
* Introducion al curso
* Breve Historia
* Entornos: Interprete, scripts, Jupyter
* Instalacion Anaconda
* Numpy: Arreglos
* Markdown


```python
%%html
<img src="https://img.memecdn.com/Good-news-everyone_o_45468.webp",width=60,height=60>
```


<img src="https://img.memecdn.com/Good-news-everyone_o_45468.webp",width=60,height=60>


### SHORTCUTS
* New cell below: "Esc+b"
* New cell above: "Esc+a"
* Delete cell: "Esc+D+D"
* Comment region:"Crtl+/" or "Ctrl+}"
* SHIFT + M = It merges multiple selected cells into one cell. 
* CTRL + SHIFT + – = It splits the current cell into two cells from where your cursor is. 

# Magics


```python
%ls
%dirs
%lsmagic
%matplotlib inline ## It allows the output of plotting command to be displayed inline i.e. in Jupyter lab UI.
%who ## will list all variables that exist in the global scope. 
%time ## will give you information about the time taken in a single run of the code in your cell.
```

    sesion1.ipynb





    Available line magics:
    %alias  %alias_magic  %autocall  %automagic  %autosave  %bookmark  %cat  %cd  %clear  %colors  %config  %connect_info  %cp  %debug  %dhist  %dirs  %doctest_mode  %ed  %edit  %env  %gui  %hist  %history  %killbgscripts  %ldir  %less  %lf  %lk  %ll  %load  %load_ext  %loadpy  %logoff  %logon  %logstart  %logstate  %logstop  %ls  %lsmagic  %lx  %macro  %magic  %man  %matplotlib  %mkdir  %more  %mv  %notebook  %page  %pastebin  %pdb  %pdef  %pdoc  %pfile  %pinfo  %pinfo2  %popd  %pprint  %precision  %profile  %prun  %psearch  %psource  %pushd  %pwd  %pycat  %pylab  %qtconsole  %quickref  %recall  %rehashx  %reload_ext  %rep  %rerun  %reset  %reset_selective  %rm  %rmdir  %run  %save  %sc  %set_env  %store  %sx  %system  %tb  %time  %timeit  %unalias  %unload_ext  %who  %who_ls  %whos  %xdel  %xmode
    
    Available cell magics:
    %%!  %%HTML  %%SVG  %%bash  %%capture  %%debug  %%file  %%html  %%javascript  %%js  %%latex  %%perl  %%prun  %%pypy  %%python  %%python2  %%python3  %%ruby  %%script  %%sh  %%svg  %%sx  %%system  %%time  %%timeit  %%writefile
    
    Automagic is ON, % prefix IS NOT needed for line magics.



#  Numpy Library


```python
import numpy as np
```

### Arrays


```python
x=np.array([1,2,3])
x.view()
```




    array([1, 2, 3])




```python
x=np.array([[1,2,3],[5,6,7],[8,9,10]])
x.view()
```




    array([[ 1,  2,  3],
           [ 5,  6,  7],
           [ 8,  9, 10]])




```python
y=np.arange(0,9)
y.view()
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8])




```python
np.zeros(5)
```




    array([ 0.,  0.,  0.,  0.,  0.])




```python
np.ones(10)
```




    array([ 1.,  1.,  1.,  1.,  1.,  1.,  1.,  1.,  1.,  1.])




```python
np.eye(4)
```




    array([[1., 0., 0., 0.],
           [0., 1., 0., 0.],
           [0., 0., 1., 0.],
           [0., 0., 0., 1.]])



### Array Attributes


```python
y.size
```




    9




```python
y.shape
```




    (9,)




```python
y.reshape((3,3))
```




    array([[0, 1, 2],
           [3, 4, 5],
           [6, 7, 8]])




```python
y=np.arange(0,9).reshape((3,3))
y.view()
```




    array([[0, 1, 2],
           [3, 4, 5],
           [6, 7, 8]])



### Array Operations


```python
x+y
```




    array([[ 1,  3,  5],
           [ 8, 10, 12],
           [14, 16, 18]])




```python
y/x
```




    array([[0.        , 0.5       , 0.66666667],
           [0.6       , 0.66666667, 0.71428571],
           [0.75      , 0.77777778, 0.8       ]])




```python
np.matmul(x,y)
```




    array([[ 24,  30,  36],
           [ 60,  78,  96],
           [ 87, 114, 141]])



# Numpy Functions


```python
np.sin(0)
```




    0.0




```python
np.cos(0)
```




    1.0




```python
np.exp(0)
```




    1.0




```python
np.linspace(0,10,30)
```




    array([  0.        ,   0.34482759,   0.68965517,   1.03448276,
             1.37931034,   1.72413793,   2.06896552,   2.4137931 ,
             2.75862069,   3.10344828,   3.44827586,   3.79310345,
             4.13793103,   4.48275862,   4.82758621,   5.17241379,
             5.51724138,   5.86206897,   6.20689655,   6.55172414,
             6.89655172,   7.24137931,   7.5862069 ,   7.93103448,
             8.27586207,   8.62068966,   8.96551724,   9.31034483,
             9.65517241,  10.        ])




```python
np.sin(np.linspace(0,2*np.pi,50))
```




    array([  0.00000000e+00,   1.27877162e-01,   2.53654584e-01,
             3.75267005e-01,   4.90717552e-01,   5.98110530e-01,
             6.95682551e-01,   7.81831482e-01,   8.55142763e-01,
             9.14412623e-01,   9.58667853e-01,   9.87181783e-01,
             9.99486216e-01,   9.95379113e-01,   9.74927912e-01,
             9.38468422e-01,   8.86599306e-01,   8.20172255e-01,
             7.40277997e-01,   6.48228395e-01,   5.45534901e-01,
             4.33883739e-01,   3.15108218e-01,   1.91158629e-01,
             6.40702200e-02,  -6.40702200e-02,  -1.91158629e-01,
            -3.15108218e-01,  -4.33883739e-01,  -5.45534901e-01,
            -6.48228395e-01,  -7.40277997e-01,  -8.20172255e-01,
            -8.86599306e-01,  -9.38468422e-01,  -9.74927912e-01,
            -9.95379113e-01,  -9.99486216e-01,  -9.87181783e-01,
            -9.58667853e-01,  -9.14412623e-01,  -8.55142763e-01,
            -7.81831482e-01,  -6.95682551e-01,  -5.98110530e-01,
            -4.90717552e-01,  -3.75267005e-01,  -2.53654584e-01,
            -1.27877162e-01,  -2.44929360e-16])



### Numpy.linalg


```python
np.linalg.inv(x)
```




    array([[-1.0293942e+16,  2.4019198e+16, -1.3725256e+16],
           [ 2.0587884e+16, -4.8038396e+16,  2.7450512e+16],
           [-1.0293942e+16,  2.4019198e+16, -1.3725256e+16]])




```python
np.linalg.det(x)
```




    2.914335439641041e-16



## Linear Algebra with Numpy

## linalg.det

The linalg.det tool computes the determinant of an array.


```python
np.linalg.det([[1 , 2], [2, 1]])       #Output : -3.0
```

## linalg.eig

The linalg.eig computes the eigenvalues and right eigenvectors of a square array.


```python
vals, vecs = np.linalg.eig([[1 , 2], [2, 1]])
print(vals)                                      #Output : [ 3. -1.]
print(vecs)                                      #Output : [[ 0.70710678 -0.70710678]
                                                #          [ 0.70710678  0.70710678]]
```

## linalg.inv

The linalg.inv tool computes the (multiplicative) inverse of a matrix.


```python
np.linalg.inv([[1 , 2], [2, 1]])       #Output : [[-0.33333333  0.66666667]
                                                #          [ 0.66666667 -0.33333333]]
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-1-64801093b544> in <module>
    ----> 1 np.linalg.inv([[1 , 2], [2, 1]])       #Output : [[-0.33333333  0.66666667]
          2                                                 #          [ 0.66666667 -0.33333333]]


    NameError: name 'np' is not defined



```python
np.linalg.solve()
```

## Task:
Solve the following operations: $\mathbf{A+B}$, $\mathbf{A-B}$, $\mathbf{AB}$, $\mathbf{A(BC)}$, $\mathbf{(AB)C}$, 

$$
A=
\begin{pmatrix}
0 & 1 & -2 \\
3 & 4 & 5 \\
-6 & 7 & 15 
\end{pmatrix}
\quad, B=
\begin{pmatrix}
0 & -5 & 3 \\
5 & 2 & -1 \\
-4 & 2 & 0 
\end{pmatrix}
\quad, C=
\begin{pmatrix}
6 & -2 & -3 \\
2 & 0 & 1 \\
0 & 5 & 7 
\end{pmatrix}
$$




## Task:

Solve the following equation systems
\begin{align}
2 x_1 - 5 x_2 & = 3 \\
5 x_1 + 8 x_2 & = 5 
\end{align}

Solve the following equation systems
\begin{align}
2 x_1 + 2 x_2 - x_3 =  2 \\
  x_1 - 3 x_2 + x_3 = 0 \\
3 x_1 + 4 x_2 - x_3 = 1
\end{align}



```python
#A = np.array([[0, 1, -2],[3, 4, 5],[-6, 7, 15]])
A = np.array([[2, 2,-1],[1,-3,1],[3,4,-1]])
b = np.array([2,0,1])
A.view()
```




    array([[ 2,  2, -1],
           [ 1, -3,  1],
           [ 3,  4, -1]])




```python
np.linalg.det(A)
```




    -164.99999999999994




```python
x=np.linalg.solve(A,b)
```


```python
x.view()
```




    array([ 0.42857143, -0.71428571, -2.57142857])



## Markdown

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

[I'm an inline-style link](https://www.google.com)

## Code highlight


```python
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
 
```python
s = "Python syntax highlighting"
print s
```
 
```

## Tables

Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the 
raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
