
# Conceptos de Programacion en Python y R

julian.restrepoh@upb.edu.co

sergio.sanes@udea.edu.co

En este notebook se encuentran los temas más importantes para el uso de R en ciencia de datos, se debe tener un conocimiento básico de programación para entender completamente el notebook. Los temas a tratar serán:

## Definir el directorio de trabajo
R necesita que se defina el directorio donde se esta trabajando, en jupyter notebook el directorio sera desde donde se ejecuta en el terminal el comando `Jupyter notebook`


```R
#Obtener el directorio de trabajo actual
DirTrabajo <-getwd() 
DirTrabajo
```


'/home/krushev/Dropbox/Cursos/curso-posgrado-python-r/github/curso-python-r.github.io/R'



```R
## Definir otro directorio para trabajar
setwd(dir = './Datos') # ir a la carpeta Datos
getwd() #ver cual es el directorio actual de trabajo
```


```R
setwd(DirTrabajo) # regresar al directorio original de trabajo
getwd()
```

## Instalar e Importar Paquetes
R tiene un repositorio donde estan la mayoria de paquetes:
https://cran.r-project.org/web/packages/available_packages_by_name.html

- Desde el menu en Rstudio en: Packages->Install package(s).
- **Nota:** Anaconda instala los paquetes mas importantes para r asi:
`conda install -c r r-essentials`


```R
# Importar una libreria
library(stringr) # Esta ya esta instalada
```


```R
library(audio) #Este Paquete no esta instalado
```


```R
require(audio) # devuelve TRUE o FALSE según el paquete esté o no instalado
```

### Instalar, Eliminar y actualizar paquetes en CRAN


```R
# Antes de instalar un paquete es bueno detectar si ya esta instalado
if(!require(audio)) # verificar si esta instalado el paquete
    install.packages("audio") # Comando para instalar paquetes, note las dobles comillas
library(audio) #Importar libreria
```


```R
# Quitar un paquete de la memoria
detach("package:audio", unload=TRUE)
```


```R
# Eliminar un paquete instalado
remove.packages("audio") #es necesario las dobles comillas
```


```R
# Actualizar paquetes de cran
update.packages() #se recomienda por linea de comando
```


```R
if(!require(sos)) # verificar si esta instalado el paquete
    install.packages("sos") # Comando para instalar paquetes, note las dobles comillas
library(sos) #Importar libreria
findFn("audio")# Buscar paquetes que contengan la palabra audio
```

### Instalar paquetes con conda
El listado de paquetes se puede ver en : https://anaconda.org/r/repo

Para instalar un paquete se hace en linea de comando asi:

`conda install -c r [nombre-del-paquete]`

### Obteniendo ayuda con R
Además de una búsqueda en google o de visitar [StackOverflow](www.stackoverflow.com), hay algunas maneras incorporadas de obtener ayuda con R! La mayoría de las funciones R tienen documentación en línea.
- help(algo) documentacion
- help.search("algo") Busca en la ayuda
- apropos("algo") nombre de todos los objetos parecidos a ”algo”
- help.start() Inicia la version HTML de la ayuda


```R
# Necesita ayuda con vectors
help(vector)
```


```R
# TDebe ser un string
help.search('numeric')
```


```R
# Tambien se puede usar ??para buscar
??vector
```

# Aritmetica con R


```R
1+2 #Suma
```


```R
5-3  # Resta
```


```R
1/2 # Division
```


```R
2^3 # Potenciacion
```


```R
5 %% 2 # Modulo
```


```R
(100 * 2) + (50 / 2) #Orden de las operaciones
```

---
# Variables
En R la asignacion de variables se hace asi:


```R
# Observe que parece una flecha apuntando hacia la variable.
variable.name <- 100
```


```R
# Veamos la variable
variable.name
```


100

variable

```R
bank.account <- 100
```


```R
deposit <- 10
```


```R
bank.account <- bank.account + deposit
```


```R
bank.account
```

## Tipos de datos en R
### Punto Flotante


```R
n <- 2.2
n # Jupyter notebook muestra las variables solo escribiendolas
```

### Enteros



```R
i <- 5
i
```


5


### Boolean o logicos


```R
t <- TRUE
f <- FALSE
```


```R
t
```


TRUE



```R
f
```


FALSE


### Caracteres (Characters)
    
los datos tipo Texto/string son conocidos como characters en R.


```R
# Comillas dobles
char <- "Data scientists, according to interviews and expert estimates, spend from 50 percent to 80 percent of their time mired in this more mundane labor of collecting and preparing unruly digital data, before it can be explored for useful nuggets"
char
```


'Data scientists, according to interviews and expert estimates, spend from 50 percent to 80 percent of their time mired in this more mundane labor of collecting and preparing unruly digital data, before it can be explored for useful nuggets'



```R
# Comillas simples
c <- 'Hola Mundo!'
c
```


'Hola Mundo!'


### Verificar la clase de los Datos
Se puede realizar con la funcion class():


```R
class(t)
```


'logical'



```R
class(f)
```


```R
class(char)
```


'character'



```R
class(c)
```


'character'



```R
class(n)
```


```R
class(i)
```


```R
class(Inf)
```


'numeric'



```R
class(NaN)
```


'numeric'



```R
class(4+5i)
```


'complex'


### Verificar el tipo de los Datos
Se puede realizar con la funcion `typeof()`:


```R
typeof(t)
```


'logical'



```R
typeof(f)
```


```R
typeof(char)
```


```R
typeof(c)
```


'character'



```R
typeof(n)
```


```R
typeof(i)
```


```R
typeof(Inf)
```


'double'



```R
typeof(NaN)
```


'double'



```R
typeof(4+5i)
```


'complex'


### Manejo de Variables en el workspace


```R
# listado de las variables en el workspace
ls()
```


<ol class=list-inline>
	<li>'c'</li>
	<li>'char'</li>
	<li>'f'</li>
	<li>'i'</li>
	<li>'t'</li>
	<li>'variable.name'</li>
</ol>




```R
# Borrar una variable del workspace
rm(deposit)
ls()
```

# Impresion en pantalla
Se realiza con la funcion `print()` y pueden ser numeros o strings. En jupyter notebook no es necesario la funcion print para imprimir el valor de una variable.


```R
print("Ciencia de Datos")
```


```R
x <- 10
print(x)
```

    [1] 10



```R
x <- mtcars
print(mtcars)
```

## Formatos
   Podemos imprimir con formato strings y variables de diferentes maneras:

### paste()    
Concatena los elementos mediante un separador definido
`paste (..., sep = " ")`


```R
print(paste('Hola','Mundo')) # El espacio es el separador predeterminado
```


```R
print(paste('Hola','Mundo',sep='-|-')) # puedo definir cualquier separador
```

### paste0()
Concatena pero sin separador


```R
paste0('Hola','Mundo')
```

### sprint
es un contenedor para la función C sprintf, que devuelve un vector de caracteres que contiene una combinación formateada de texto y valores variables. Lo que significa que puede usar% códigos para colocar variables especificando todas al final.


```R
sprintf("%s mide %f mt de alto\n", "Jose", 1.85) #\n es para dar un salto de linea
```


```R
# Esto producira un error por que 1.85 es un float y no un integer
sprintf("%s mide %f mt de alto\n", "Jose", 1.85)
```

Para mas ayuda de como usar la funcion `sprintf()` se puede ver en la documentacion:


```R
help(sprintf)
```

---
# Vectores en R
Los vectores son una de las estructuras de datos clave en R. Un vector es una matriz o arreglo de 1 dimensión que puede contener elementos de tipo string, numéricos o lógicos.
Podemos crear un vector usando la función de combinación `c ()`. Para usar la función, pasamos los elementos que queremos en la matriz, con cada elemento individual separado por una coma.


```R
# Usando c() para crear un vector con elementos numericos
nvec <- c(1,2,3,4,5)
```


```R
class(nvec)
```


```R
# Vector de letras
cvec <- c('U','S','A')
```


```R
class(cvec)
```


```R
# vector de Booleans
lvec <- c(TRUE,FALSE)
lvec
```


```R
class(lvec)
```

Tenga en cuenta que no podemos mezclar los tipos de datos de los elementos en una matriz, R convertirá los otros elementos en la matriz para obligar a que todo sea del mismo tipo de datos. Más adelante, aprenderemos sobre la estructura de datos de la lista que puede tomar múltiples tipos de datos.
A continuación, se muestra un ejemplo rápido de lo que ocurre con las matrices con diferentes tipos de datos:


```R
v <- c(FALSE,2)
```


```R
v
```


```R
class(v)
```


```R
v <- c('A',1)
```


```R
v
```


```R
class(v)
```

## Nombres de vectores

Podemos usar la función `names()` para asignar nombres a cada elemento de nuestro vector. Por ejemplo, imagine el siguiente vector de una semana de temperaturas:


```R
temps <- c(72,71,68,73,69,75,71)
```


```R
temps
```

Tenemos 7 temperaturas durante 7 días de la semana, pero ¿qué temperatura corresponde a qué día de la semana? ¿Comienza el lunes, el domingo u otro día de la semana? Aquí es donde se pueden asignar los `nombres()` de la siguiente manera:


```R
names(temps) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
```

Note que pasa cuadno se muestra el vector


```R
temps
```

¡Ahora podemos comenzar a ver cómo se les asignaron nombres a los elementos! Dependiendo de qué IDE esté utilizando, puede ver lo que se muestra arriba horizontalmente o verticalmente, podemos usar el uso simple de un nombre de variable como asignación de `names()`, por ejemplo:


```R
days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps2 <- c(1,2,3,4,5,6,7)
names(temps2) <- days
```


```R
temps2
```

## Operaciones con Vectores
Podemos realizar aritmética básica con vectores y las operaciones se realizarán elemento a elemento, por ejemplo:


```R
v1 <- c(1,2,3)
v2 <- c(5,6,7)
```

### Suma de Vectores


```R
v1+v2
```

### Resta de Vectores


```R
v1-v1
```


```R
v1-v2
```

### Multiplicacion de Vectores


```R
v1*v2
```

### Division de vectores


```R
v1/v2
```

## Funciones con vectores. 
Aprendamos algunas funciones útiles que podemos usar con vectores. Una función tendrá el siguiente formato: `nombre_de_la_funcion(input)` Luego aprenderemos a crear nuestras propias funciones, pero R viene con una gran cantidad de funciones integradas que usará habitualmente. Por ejemplo, si desea sumar todos los elementos en un vector numérico, puede usar la función `sum()`. Por ejemplo:


```R
v1
```


```R
sum(v1)
```

También podemos verificar cosas como la desviación estándar, la varianza, el elemento máximo, el elemento mínimo, el producto de los elementos:


```R
v <- c(12,45,100,2)
```


```R
# Desviacion estandar
sd(v)
```


```R
# Varianza
var(v)
```


```R
# Elemento con valor maximo
max(v)
```


```R
#Elemento con el minimo valor
min(v)
```


```R
# Producto interno de los elementos
prod(v1)
prod(v2)
```


```R
# Una de las funciones mas utiles es summary()
# que nos da la informacion estadistica de cuartiles
summary(v)
```

Referencia a todas las funciones de R en: https://cran.r-project.org/doc/contrib/Short-refcard.pdf

## Indexación y slicing de vectores: 
Se usan los corchetes para indexar y acceder a elementos individuales desde un vector, **el index empieza en 1**:


```R
v1 <- c(100,200,300)
v2 <- c('a','b','c')
```


```R
v1
v2
```


<ol class=list-inline>
	<li>100</li>
	<li>200</li>
	<li>300</li>
</ol>




<ol class=list-inline>
	<li>'a'</li>
	<li>'b'</li>
	<li>'c'</li>
</ol>



La indexación funciona usando corchetes y pasando la posición del índice del elemento como un número. **Tenga en cuenta que el índice comienza en 1** (en otros lenguajes de programación la indexación comienza en 0 por ejemplo Python, C++).


```R
# Obtener el segundo elemento
v1[2]
```


200



```R
v2[2]
```


'b'


### Indexación múltiple
Podemos tomar múltiples elementos de un vector pasando un vector con las posiciones de los índices dentro de los corchetes. Por ejemplo:


```R
v1[c(1,2)] # tomar el elemento 1 y 2
```


<ol class=list-inline>
	<li>100</li>
	<li>200</li>
</ol>




```R
v2[c(2,3)] # tomar el elemento 2 y 3
```


```R
v2[c(1,3)] # tomar el elemento 1 y 3
```

### Slicing
Puede usar dos puntos (:) para indicar una porción de un vector. 

El formato es: `vector[inicio_index: final_index]`

**Se incluye los elementos del inicio y final**

Por ejemplo:


```R
v <- c(1,2,3,4,5,6,7,8,9,10)
```


```R
v[2:4] # La indexacionempieza desde el numero 1
```


<ol class=list-inline>
	<li>2</li>
	<li>3</li>
	<li>4</li>
</ol>




```R
v[7:10]
```

### Indexacion con nombres


```R
v <- c(1,2,3,4)
names(v) <- c('a','b','c','d')
```


```R
v['a']
```


```R
# Se pueden llamar en cualquier orden!
v[c('a','c','b')]
```

## Operadores de comparación y selección
Se puede usar operadores de comparación para filtrar elementos de un vector. A veces esto se conoce como enmascaramiento lógico/booleano, porque está creando un vector de valores lógicos para filtrar los resultados que desea. 


```R
v
```


```R
v>2
```

Pasamos este vector de valores lógicos a través de los paréntesis del vector y solo devolvemos los valores donde sea verdadera la condicion:


```R
v[v>2]
```

Podemos asignarles nombres a las comparaciones logicas


```R
filter <- v>2
```


```R
filter
```


```R
v[filter]
```

# Operadores de Comparacion
En R, podemos usar operadores de comparación para comparar variables y devolver valores lógico

**Mayor que**


```R
5 > 6
```


```R
6 > 5
```

Se puede hacer elemento a elemento en un vector


```R
v1 <- c(1,2,3)
v2 <- c(10,20,30)
```


```R
v1 < v2
```

**Mayor o Igual que**



```R
6 >= 6
```


```R
6 >= 5
```


```R
6 >= 7
```

**Menor y Menor o igual que**


```R
3 < 2
```


```R
2 <= 2
```

**!Mucho cuidado con los operadores de comparación y los números negativos!**  se Recomienda usar espaciado para mantener las cosas claras. Un ejemplo de una situación peligrosa:


```R
var <- 1
```


```R
var
```


```R
# Comparando var menor que  -2
var < -2
```


```R
# Accidentalmente se reasgina var
var <- 2
```


```R
var
```

**Diferente**


```R
5 != 2
```


```R
5 != 5
```

**Igual**


```R
5 == 5
```


```R
2 == 3
```

## Comparacion con Vectores


```R
v <- c(1,2,3,4,5)
```


```R
v < 2
```


```R
v == 3
```

---
# Matrices con R

## Crear una Matriz
Hemos aprendido acerca de los vectores que nos permiten almacenar elementos indexados. Una matriz nos permitirá tener una estructura de datos bidimensional que contiene elementos que constan del mismo tipo de datos. Antes de hablar sobre Matrix, debemos mostrar un consejo rápido para crear rápidamente vectores numéricos secuenciales, puede usar la notación de dos puntos de la división para crear vectores secuenciales:


```R
1:10
```


```R
v <- 1:10
v
```

Para crear una matriz en R, se usa la función `matrix()`. Podemos pasar un vector en la matriz:


```R
matrix(v) #Matriz de una sola dimension
```

Observe cómo se muestra la salida. Aquí tenemos una matriz bidimensional que tiene 10 filas por 1 columna. Ahora, ¿qué pasa si queremos especificar el número de filas? Podemos pasar el parámetro / argumento a la función de matriz llamada `nrow` que representa el número de filas:


```R
matrix(v,nrow=2)
```

Ahora tenemos una matriz de 2 por 5. Tenga en cuenta que el argumento `nrow` permite que esto suceda. ¿Pero cómo decidimos la orden de relleno? Podríamos haber puesto columnas primero (como lo hicimos anteriormente) o haber completado las primeras filas de orden insecuencial. El argumento `byrow` le permite especificar si desea completar o no la matriz por filas o columnas. Por ejemplo:


```R
matrix(1:12,byrow = FALSE,nrow=4)
```


```R
matrix(1:12, byrow=TRUE, nrow=4)
```


```R
v
```

## Crear Matrices de Vectores

Podemos combinar vectores para luego ingresarlos en una matriz. Por ejemplo, imagine los siguientes vectores a continuación de los precios de las acciones:


```R
# no son valores reales
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)
```


```R
stocks <- c(goog,msft)
```


```R
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)
```


```R
stock.matrix
```

## Nombrando matrices 
Ahora que tenemos nuestra matriz, sería bueno nombrar las filas y columnas para referencia. Podemos hacer esto de forma similar a la función `names()` para vectores, pero en este caso definimos `colnames()` y `rownames()`.


```R
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
```


```R
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
```


```R
stock.matrix
```

## Aritmetica de Matrices
Podemos realizar operaciones matemáticas elemento por elemento en una matriz con un escalar (número único) al igual que con los vectores.


```R
mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat
```


```R
# Multiplicacion
2*mat
```


```R
# Division
1/mat
```


```R
# Division
mat/2
```


```R
# Potencia
mat ^ 2
```

## Operadores de comparacion con Matrices


```R
mat > 17
```

## Aritmetica con matrices
Elemento a elemento


```R
mat + mat
```


```R
mat / mat
```


```R
#Cuidado, puede dar numeros grandes
mat ^ mat
```


```R
mat*mat
```

## Multiplicación de Matrices


```R
mat2 <- matrix(1:9, nrow=3)
```


```R
mat2
```


```R
# Verdadera Multiplicacion de Matrices
mat2 %*% mat2
```

## Operaciones de matriz

Ahora que aprendimos cómo crear una matriz, ¡aprendamos a usar funciones y realizar operaciones en ella!


```R
# Precios
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

# Poner los vectores en la matriz
stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)

# Nombrar la matriz
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

# Mostrarla
stock.matrix
```

Podemosrealizar funciones atraves de las columnas como `colSums()`


```R
# Por columnas
colSums(stock.matrix)
```


```R
# Por filas
rowSums(stock.matrix)
```

Tambien se pueden hacer diferentes operaciones matematicas,para mas informacion de todas las funciones disponibles: https://cran.r-project.org/doc/contrib/Short-refcard.pdf


```R
# el valor promedio de cada fila
rowMeans(stock.matrix)
```

## Agregar columnas y filas
Con `cbind()` se agregan nuevas columnas, y `rbind()` para nuevas filas.


```R
FB <- c(111,112,113,120,145)
```


```R
tech.stocks <- rbind(stock.matrix,FB)
```


```R
tech.stocks
```

Ahora agreguemos una columna con el valor promedio a la matriz:


```R
avg <- rowMeans(tech.stocks)
```


```R
avg
```


```R
tech.stocks <- cbind(tech.stocks,avg)
```


```R
tech.stocks
```

## Selección e indexación de matrices

Al igual que con los vectores, utilizamos la notación de corchetes para seleccionar elementos de una matriz. Como tenemos dos dimensiones para trabajar, utilizaremos una coma para separar la indexación para cada dimensión. La sintaxis es:

`matriz.ejemplo[filas, columnas]` 

Si cualquiera de las filas o columnas se deja en blanco, entonces estamos seleccionando todas las filas y columnas.


```R
# Creando una matriz de 50elementos de 5 x10
mat <- matrix(1:50,byrow=TRUE,nrow=5)
```


```R
mat
```


```R
# Tomar la primera fila
mat[1,]
```


```R
# Tomarla primera columna
mat[,1]
```


```R
# Tomar las primeras 3 filas
mat[1:3,]
```


```R
# Tomar diferente numero de filas y columnas
# 1,2,3
# 11,12,13
#
mat[1:2,1:3]
```


```R
#Tomar las dos ultimas columnas
mat[,9:10]
```


```R
# Tomar los valores centrales
# 15,16
# 25,26
mat[2:3,5:6]
```

## Factor y Matrices categoricas
la función `factor()` sirve para crear matrices categóricas. Esta función específica será extremadamente útil cuando comencemos a aplicar técnicas de análisis de datos y aprendizaje automático a nuestros datos, esta idea a veces también se conoce como la creación de dummy variables (variables ficticias).


Comencemos mostrando un ejemplo de por qué y cómo construimos esta matriz. Imagine que tenemos los siguientes vectores que representan datos de un santuario de animales para dogs('d') y cats('c'), donde cada uno tiene un número de identificación correspondiente en otro vector.


```R
animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5)
```

Queremos convertir el vector animal en información que un algoritmo o ecuación pueda comprender más fácilmente. Lo que significa que queremos comenzar a verificar cuántas categorías (niveles de factores) hay en nuestro vector de caracteres. Esto se hace con la funcion `factor()`


```R
factor.ani <- factor(animal)
```


```R
# Ver los niveles creados
factor.ani
```

Podemos ver que tenemos dos niveles, 'd' y 'c'. En R hay dos tipos distintos de variables categóricas, una variable categórica ordinal y una variable categórica nominal 

Las variables categóricas nominales no tienen ningún orden, como perros y gatos (no hay ningún orden para ellos). Versus Las variables categóricas ordinales (como su nombre lo indica) sí tienen un orden. Por ejemplo, si tuvieras el vector:


```R
ord.cat <- c('frio','tibio','caliente')
```

Puede comenzar a asignar para estas variables, como: frio tibio caliente si quiere asignar un orden mientras usa la función `factor()`, puede pasar los argumentos ordenados = True y el pase los niveles = y pasar en un vector en el orden en que desea que estén los niveles. Por ejemplo:


```R
temps <- c('frio','tibio','frio','tibio','caliente','caliente','frio')
fact.temp <- factor(temps,ordered=TRUE,levels=c('frio','tibio','caliente'))
fact.temp
```

Esta información es útil cuando se usa junto con la función `summary()` que es una función sorprendentemente conveniente para obtener rápidamente información de una matriz o vector.


```R
summary(temps)
```


```R
summary(fact.temp)
```
