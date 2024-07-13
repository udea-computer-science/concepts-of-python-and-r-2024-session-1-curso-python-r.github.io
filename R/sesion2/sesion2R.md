
# Conceptos de Programacion en Python y R<a class="tocSkip">
## Semillero Programación Analítica<a class="tocSkip">
### Ciencia de Datos<a class="tocSkip">
### Por Julian A. Restrepo <a class="tocSkip">

julian.restrepoh@upb.edu.co

sergio.sanes@udea.edu.co

En este notebook se encuentran los temas más importantes para el uso de R en ciencia de datos, se debe tener un conocimiento básico de programación para entender completamente el notebook. Los temas a tratar serán:

---
# Dataframes en R
Los Dataframes son una de las herramientas principales para el análisis de datos con R! Las entradas de la matriz eran limitadas porque todos los datos dentro de la matriz tenían que ser del mismo tipo de datos (numéricos, lógicos, etc.). ¡Con Dataframes podremos organizar y mezclar tipos de datos para crear una herramienta de estructura de datos muy poderosa!


```R
# Dataframe sobre states
state.x77
```


```R
# Gastos personales en US
USPersonalExpenditure
```


```R
# Mujeres
women
```

Para obtener una lista de dataframes pre-instalados en R,use `data()`


```R
data()
```

## Trabajando con Dataframes
Cuando el dataframe es muy grande se puede usar la funcion `head()` y `tail()` para ver las primeras o ultimas 6 filas respectivamente.


```R
#Asignacionde variable para escribir menos :)
states <- state.x77
```


```R
head(states) #primeras 6 filas
```


```R
tail(states) #ultimas 6 filas
```

## Informacion General de los DataFrames
`str()` entrega la informacion de la estructura del dataframe y el tipo de datos que contiene, como el nombre de las variables y el tipo de datos.

`summary()` para obtener rapidamente informacion estadistica de cada columna, dependiendo de los datos puede ser su utilidad.


```R
# Resumen estadistico de los datos
summary(states)
```


```R
# Estrutura de los Datos
str(states)
```

## Crear Dataframes

Podemos crear dataframes usando la función `data.frame()` y pasar vectores como argumentos, que luego convertirán los vectores en columnas del marco de datos.


```R
empty <- data.frame() # data frame vacio

c1 <- 1:10 # vector de enteros

c2 <- letters[1:10] # vector de strings

df <- data.frame(col.name.1=c1,col.name.2=c2)
```


```R
df
```


```R
# Ejemplo con valores
# Algunos datos de la temperatura de los dias
days <- c('mon','tue','wed','thu','fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
```


```R
# Conviertiendo los vectores en dataframe
df <- data.frame(days,temp,rain)
```


```R
df
```


```R
# estructura
str(df)
```


```R
# Resumen estadistico
summary(df)
```

## Seleccion e Indexacion de Dataframes
Se realiza utilizando corchetes [  ] y de la misma forma que con matrices
`df[filas,columnas]`


```R
# Toda la fila 1
df[1,]
```


```R
# Toda la columna 1
df[,1]
```


```R
# Tomar los datos del viernes
df[5,]
```

## Seleccion usando nombres de columnas
Se pueden usar los nombes de las columnas en vez de las posiciones de las columnas


```R
# Todos los valores de la columna rain
df[,'rain']
```


```R
# Primeas 5 filas de las columnas days y temp
df[1:5,c('days','temp')]
```

Si desea todos los valores de una columna en particular, puede usar el signo de dólar directamente después del dataframe de la siguiente manera (esta notacion es muy usada): 

`df.name$column.name`


```R
df$rain
```


```R
df$days
```

También puede usar la notación de corchetes para devolver un dataframe con la misma información:


```R
df['rain']
```


```R
df['days']
```

## Filtrar un subconjunto de datos con condiciones

Podemos usar la función `subset()` para tomar un subconjunto de valores de nuestro dataframe en función de alguna condición. Entonces, por ejemplo, si quisiéramos tomar los días en los que llovió `(rain = True)`, podemos usar la función `subset()` de la siguiente manera:


```R
subset(df,subset=rain==TRUE)
```

Observe cómo la condición utiliza algún tipo de operador de comparación, en el caso anterior ==. Tomemos días donde la temperatura era mayor que 23:


```R
subset(df,subset= temp>23)
```

Otra cosa a tener en cuenta es que no pasamos el nombre de la columna como un string, el subconjunto sabe que se está refiriendo a una columna en ese dataframe.

## Ordenar un Dataframe

Podemos organizar el orden de un dataframe utilizando la función  `order()`.


```R
# Orden ascendente
sorted.temp <- order(df['temp'])
```


```R
df[sorted.temp,]
```

Observemos en realidad de que tipo es sorted.temp:


```R
sorted.temp
```


```R
# Orden descendente poniendo el signo negativo
desc.temp <- order(-df['temp'])
```


```R
df[desc.temp,]
```

Tambien se puede hacer la seleccion de columnas usando el signo $


```R
sort.temp <- order(df$temp)
df[sort.temp,]

```

## Informacion de filas y columnas


```R
# Numero de Filas y Columnas
nrow(df)
ncol(df)
```


```R
# Nombres de las columnas
colnames(df)
```


```R
# Nombre de las filas (En este dataframe son numeros)
rownames(df)
```

## Referenciando Celdas especificas
Se utiliza corchetes dobles para obtener un solo numero y corchetes simples para varias celdas


```R
vec <- df[[5, 2]] # obtener la celda po [[fila,columna]]
vec
```


```R
newdf <- df[1:3, 1:2] # tomar varias celdas 
newdf
```


```R
df[[2, 'temp']] <- 99999 # reasignando el valor en una celda
df
```

## Referenciando filas


```R
# Retorna un dataframe (No un vector)
rowdf <- df[1, ]
rowdf
```


```R
#Para obtener un vector debe ser asi
vrow <- as.numeric(as.vector(df[1,]))
vrow
```

## Referenciando Columnas
La mayoria de referencias de columna retornan un vector


```R
# dataset de carros
cars <- mtcars
head(cars)
```


```R
colv1 <- cars$mpg # retorna un vector
colv1
```


```R
colv2 <- cars[, 'mpg'] # retorna un vector
colv2
```


```R
colv3<- cars[, 1] # son int o string?
colv3
```


```R
colv4 <- cars[['mpg']] # retorna un vector
colv4
```

Para retornar dataframes puederser asi:


```R
mpgdf <- cars['mpg'] # retorna un dataframe de 1 col
head(mpgdf)
```


```R
mpgdf2 <- cars[1] # retorna un dataframe de 1 col
head(mpgdf2)
```

## Agregando Filas `rbind()`


```R
df
```


```R
# Los dos argumentos son dataframes
df2 <- data.frame(days = "sat", temp = NA ,rain = TRUE )
df2
```


```R
# usar rbind para agregar una nueva fila
df <- rbind(df,df2)
df
```

## Agregando Columnas `cbind()`


```R
# crear una columna convalores NA
df$newcol <- rep(NA, nrow(df))
df
```


```R
# Copiar una columna
df[, 'copy.of.temp'] <- df$temp
df
```


```R
# tambien se pueden usar ecuaciones
df[['temp.times.2']] <- df$temp * 2
df
```


```R
# Usando la funcion cbind()
df3 <- cbind(df, df$temp)
df3
```

## Definir el Nombre de las Columnas


```R
# Renombrar unacolumna
colnames(df)[5] <- 'copia.Temperatura'
df
```


```R
# Renombrar todas con un vector
colnames(df) <- c('col.name.1', 'col.name.2', 'col.name.3', 'col.name.4' ,'copy.temp','temp2')
df
```

## Seleccion de varias Filas



```R
# Seleccionar solo algunas filas
primeras.cuatro.filas <- df[1:4, ] # Lo mismo que head(df, 4)
primeras.cuatro.filas
```


```R
# No tomar alguna fila
todo.sin.fila.dos <- df[-2, ]
todo.sin.fila.dos
```


```R
# Seleccion Condicional
sub1 <- df[ (df$col.name.2 > 23 & df$temp2 > 48), ]
sub1
```


```R
# Seleccion Condicional
sub2 <- subset(df, col.name.2 > 23 & temp2 < 100)
sub2
```

## Seleccion de varias columnas


```R
# Tomar las columnas 1 2 3
df[, c(1, 2, 3)] 
```


```R
# Por el nombre
df[, c('col.name.1', 'temp2')]
```


```R
# Tomar todo menos la primera columna
df[, -1]
```


```R
# Tomar todo menos la columna 1 y 3
df[, -c(1, 3)] 
```

## Tratando con datos faltantes
Tratar con los datos que faltan es una habilidad muy importante que debe conocer cuando se trabaja con dataframes. Las celdas con datos faltantes se llenan con el valor `na`


```R
df2 <- df# hacer una copia del dataframe
df2
```


```R
# detectar si hay algun dato faltante en el dataframa
any(is.na(df2)) 
```


```R
# Algun dato faltante en la columna buscada
any(is.na(df2$col.name.1)) 
```


```R
# Algun dato faltante en la columna buscada
any(is.na(df2$col.name.4)) 
```


```R
# reemplazar NA con algun valor
df2[is.na(df2)] <- 0 # lo hace para todo el dataframe
df2
```


```R
# Para una columna en especifico
df2<-df
df2$col.name.4[is.na(df2$col.name.4)] <- 999
df2
```


```R
# Borrar las filas que tengan datos faltantes en una columna especifica
df2<-df
df2 <- df2[!is.na(df2$col.name.2),]
df2
```

## Mezclando dataframes `merge()`


```R
# utilice columnas de caracteres de nombres para obtener un orden de clasificación razonable
authors <- data.frame(
    surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
    nationality = c("US", "Australia", "US", "UK", "Australia"),
    deceased = c("yes", rep("no", 4)))
authors
```


```R
books <- data.frame(
    name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
    title = c("Exploratory Data Analysis",
              "Modern Applied Statistics ...",
              "LISP-STAT",
              "Spatial Statistics", "Stochastic Simulation",
              "Interactive Data Analysis",
              "An Introduction to R"),
    other.author = c(NA, "Ripley", NA, NA, NA, NA,
                     "Venables & Smith"))
books
```


```R
# Mezclar authors y books por el nombre
# Observar que estan en columnas diferentes
(m1 <- merge(authors, books, by.x = "surname", by.y = "name"))
```


```R
## mezclar todos los valores
merge(authors, books, by.x = "surname", by.y = "name", all = TRUE)
```


```R
## Ejemplo usando 'incomparables'
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data = 1:5)
merge(x, y, by = c("k1","k2")) # NA's se toman como iguales
merge(x, y, by = "k1") # NA's como iguales, tenemos 6 filas
merge(x, y, by = "k2", incomparables = NA) # 2 filas, sin los NA
```

# Listas en R

Las listas nos permitirán almacenar una variedad de estructuras de datos bajo una sola variable. Esto significa que podríamos almacenar un vector, matriz, dataframe, etc. en una sola lista.


```R
# Crear un vector
v <- c(1,2,3,4,5)

# Crear una matriz
m <- matrix(1:10,nrow=2)

# Crear un dataframe
df <- women
```


```R
v
```


```R
m
```


```R
df
```

## Funcion `list()`
Se unsa la funcion `list()` para combinar todas los datos


```R
li <- list(v,m,df)
li
```

La lista asigna numeros a cada uno de los objetos de la lista, pero tambein se pueden asignar nombres.


```R
li <- list(sample_vec = v,sample_mat = m, sample_df = df)
li
```

## Seleccionando objetos de una lista
Puede usar la notación de corchetes para mostrar objetos en una lista, y corchetes dobles para realmente agarrar los objetos de la lista


```R
# corchetes simples
li[1] # por index
```


```R
# Por nombre
li['sample_vec']
```


```R
# Note el tipo de dato
class(li['sample_vec'])
```


```R
# Utilice dobles corchetes para realmente obtener los datos
li[['sample_vec']]
```


```R
# tambien se puede usar la notacion $
li$sample_vec
```

También puede indexar luego despues de que ha seleccionado el objeto de la lista


```R
# Segunda indexacion
li[['sample_vec']][1]
```


```R
li[['sample_mat']]
```


```R
li[['sample_mat']][1,]
```


```R
li[['sample_mat']][1:2,1:2]
```


```R
li[['sample_df']]['height']
```

## Combinacion de listas
Las listas pueden contener otras listas! También puede combinar listas usando la función de combinación `c()`


```R
double_list <- c(li,li)
double_list
```


```R
str(double_list)
```

---
# Programacion en R

## Operadores Logicos
Los operadores lógicos nos permitirán combinar múltiples operadores de comparación. Los operadores lógicos de los que aprenderemos son:
* AND - &
* OR - |
* NOT - !



```R
# Declarando la variable
x <- 10
```


```R
# Menor que
x < 20
```


```R
# Mayor que
x > 5
```


```R
# Combinacion de comparaciones
x < 20 & x > 5
```


```R
# Para mejor entendimiento es mejor usar parentesis
(x < 20) & (x>5)
```


```R
# Combinacion con AND
(x < 20) & (x>5) & (x == 10)
```


```R
#Combinacion con AND
(x==2) & (x > 1)
```


```R
# Combinacion con OR
(x==2) | (x > 1)
```


```R
# Combinacion con OR
(x==1) | (x==12)
```

### Negacion (NOT !)


```R
(10==1)
```


```R
!(10==1)
```


```R
# Esto no es comun, pero es posible
!!(10==1)
```

### Ejemplo de uso


```R
df <- mtcars
```


```R
df
```


```R
# Carros con mpg mayores o iguales a 20
df[df['mpg'] >= 20,] # Observe el uso de la coma en la indexacion
# subset(df,mpg>=20) # Tambien se puede usar
```


<p>Great! Now let's combine filters with logical operators! Let's grab rows with cars of at least 20mpg and over 100 hp.</p>



```R
# Carros con mpg mayores o iguales a 20 y hp mayor que 100
df[(df['mpg'] >= 20) & (df['hp'] > 100),]
```

## Operadores Logicos con Vectores
Se realiza elemento a elemento


```R
tf <- c(TRUE,FALSE)
tt <- c(TRUE,TRUE)
ft <- c(FALSE, TRUE)
```


```R
tt & tf
```


```R
tt | tf
```

**para comparar el primer elemento usar && o ||**


```R
ft && tt
```


```R
tt && tf
```


```R
tt || tf
```


```R
tt || ft
```

## Condicionales if, else, else if
Su sintaxis es:
```r
if (condicion) { 
    codigo a realizar si es verdadero
    }
else if (condicion){
    codigo a realizar si es verdadero
    }
else{
    codigo a realizar si ninguno de los anteriores es verdadero
    }
```   


```R
hot <- FALSE
temp <- 60
if (temp > 80){
    hot <- TRUE
    }
hot
```


```R
temp <- 100
if (temp > 80){
    hot <- TRUE
    }
hot
```


```R
# Incluyendo el else
temp <- 30

if (temp > 90){
    print("Esta caliente!")
} else{
    print("No esta muy caliente")
}
```

Condicional completo


```R
temp <- 30
if (temp > 80){
    print("Esta caliente")
} else if(temp<80 & temp>50){
    print('Esta tibio!')
} else if(temp <50 & temp > 32){
    print("Esta frio!")
} else{
    print("Esta muy frio!")
}
```

## Ciclos For
Su sintaxis es:
```r
for (Varible_temporal in objeto) { 
    codigo a realizar en cada iteracion
    }
```  
Para terminar los loops se utiliza la palabra `break`

### Ciclor for sobre un Vector


```R
vec <- c(1,2,3,4,5)
```


```R
for (temp_var in vec){
    print(temp_var)
}
```


```R
# otra forma de hacerlo es creando los elementos de iteracion
for (i in 1:length(vec)){
    print(vec[i])
}
```

### Ciclos for sobre una lista


```R
li <- list(1,2,3,4,5)
```


```R
for (temp_var in li){
    print(temp_var)
}
```


```R
for (i in 1:length(li)){
    print(li[[i]]) # Recuerde usar los corchetes dobles para tomar el valor
}
```

### Ciclo for en una Matriz


```R
mat <- matrix(1:25,nrow=5)
mat
```


```R
for (num in mat){
    print(num)
}
```

### Ciclos Anidados


```R
for (row in 1:nrow(mat)){
    for (col in 1:ncol(mat)){
        print(paste('El elemento de la fila:',row,'y columna:',col,'es',mat[row,col]))
    }
}
```

## Ciclos While
Su sintaxis es:
```r
while (Variable) { 
    codigo a realizar mientras la variable sea verdadera
    }
```  


```R
x <- 0
while(x < 10){
    
    cat('x tiene el valor de: ',x)
    print(' x todavia es menor que 10, sumando 1 a x')
    # Sumar 1 a x
    x <- x+1
}
```

## Funciones
El sintaxis de creacion de una funcion es:
```r
Nombre_funcion <- function(arg1,arg2,...){
         #Codigo que se ejecuta cuando se llama la funcion
    }
```


```R
# Funcion simple sin entradas
hello <- function(){
    print('hola!')
}
```


```R
hello()
```


```R
helloyou <- function(name){
    print(paste('Hola ',name))
}
```


```R
helloyou('Joe')
```


```R
add_num <- function(num1,num2){
    print(num1+num2)
}
```


```R
add_num(5,10)
```

Valores predeterminados


```R
hola_persona <- function(name='Juan'){
    print(paste('Hola ',name))
}
```


```R
# Usando el valor predeterminado
hola_persona()
```


```R
#definiendo el argumento de entrada
hola_persona('Matias')
```

### Retornando Valores


```R
formal <- function(name='Jose',title='Don'){
    return(paste(title,' ',name))
}
```


```R
formal()
```


```R
formal('Issac Newton')
```


```R
var <- formal('Marie Curie','Ms.')
var
```


```R
double <- function(a) {
  a <- 2*a         # esta variable es definida solo para la funcion tiene un scope local
  a
}
var <- 5
double(var)
var
```

# Funciones Built-in

* `seq()`: Crea secuencias
* `sort()`: Ordena un vector
* `rev()`: Revierte los elementos en un objeto
* `str()`: Muestra la estrutura de un objeto
* `append()`: Mezcla objetos (Funciona en vectores y listas)


```R
# seq(inicio,final,tamaño del paso)
seq(0, 100, by = 3)
```


<ol class=list-inline>
	<li>0</li>
	<li>3</li>
	<li>6</li>
	<li>9</li>
	<li>12</li>
	<li>15</li>
	<li>18</li>
	<li>21</li>
	<li>24</li>
	<li>27</li>
	<li>30</li>
	<li>33</li>
	<li>36</li>
	<li>39</li>
	<li>42</li>
	<li>45</li>
	<li>48</li>
	<li>51</li>
	<li>54</li>
	<li>57</li>
	<li>60</li>
	<li>63</li>
	<li>66</li>
	<li>69</li>
	<li>72</li>
	<li>75</li>
	<li>78</li>
	<li>81</li>
	<li>84</li>
	<li>87</li>
	<li>90</li>
	<li>93</li>
	<li>96</li>
	<li>99</li>
</ol>




```R
v <- c(1,4,6,7,2,13,2)
```


```R
sort(v)
```


<ol class=list-inline>
	<li>1</li>
	<li>2</li>
	<li>2</li>
	<li>4</li>
	<li>6</li>
	<li>7</li>
	<li>13</li>
</ol>




```R
sort(v,decreasing = TRUE)
```


<ol class=list-inline>
	<li>13</li>
	<li>7</li>
	<li>6</li>
	<li>4</li>
	<li>2</li>
	<li>2</li>
	<li>1</li>
</ol>




```R
v2 <- c(1,2,3,4,5)
rev(v2)
```


<ol class=list-inline>
	<li>5</li>
	<li>4</li>
	<li>3</li>
	<li>2</li>
	<li>1</li>
</ol>




```R
str(v)
```

     num [1:7] 1 4 6 7 2 13 2



```R
append(v,v2)
```


<ol class=list-inline>
	<li>1</li>
	<li>4</li>
	<li>6</li>
	<li>7</li>
	<li>2</li>
	<li>13</li>
	<li>2</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
</ol>




```R
sort(append(v,v2))
```


<ol class=list-inline>
	<li>1</li>
	<li>1</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
	<li>7</li>
	<li>13</li>
</ol>



## Verificar el tipo de datos
- is.*(): Verificar la clase de un objeto de R
- as.*(): Convertir objetos de R 



```R
v <- c(1,2,3)
is.vector(v)
```


TRUE



```R
is.list(v)
```


FALSE



```R
as.list(v)
```


<ol>
	<li>1</li>
	<li>2</li>
	<li>3</li>
</ol>




```R
as.matrix(v)
```


<table>
<tbody>
	<tr><td>1</td></tr>
	<tr><td>2</td></tr>
	<tr><td>3</td></tr>
</tbody>
</table>



## Funciones Matematicas
R tiene incluidas varias funciones matematicas, por ejemplo:

- abs(): calcula el valor absoluto
- sum(): SUma todos los elementos de la entrada
- mean(): Calcula el promedio
- round(): aproxima los valores al entero mas cercado



```R
v <- c(-1,0,1,2,3,4,5)
```


```R
abs(-2)
```


```R
abs(v)
```


```R
sum(v)
```


```R
mean(v)
```


```R
round(23.1231)
```


```R
round(23.1231234,2)
```

Mas Funciones:

</p><table border="0">
<tr>
<td valign="top"><strong>Funcion</strong></td>
<td valign="top"><strong>Descripcion</strong></td>
</tr>
<tr>
<td valign="top"><strong>abs(</strong><em>x</em><strong>)</strong></td>
<td valign="top">valor absoluto </td>
</tr>
<tr>
<td valign="top"><strong>sqrt(</strong><em>x</em><strong>)</strong></td>
<td valign="top">raiz cuadrada</td>
</tr>
<tr>
<td valign="top"><strong>ceiling(</strong><em>x</em><strong>)</strong></td>
<td valign="top">ceiling(3.475) es 4 </td>
</tr>
<tr>
<td valign="top"><strong>floor(</strong><em>x</em><strong>)</strong></td>
<td valign="top">floor(3.475) es 3 </td>
</tr>
<tr>
<td valign="top"><strong>trunc(</strong><em>x</em><strong>)</strong></td>
<td valign="top">trunc(5.99) es 5 </td>
</tr>
<tr>
<td valign="top"><strong>round(</strong><em>x</em><strong>, digits=</strong><em>n</em><strong>) </strong></td>
<td valign="top">round(3.475, digits=2) es 3.48 </td>
</tr>
<tr>
<td valign="top"><strong>signif(</strong><em>x</em><strong>, digits=</strong><em>n</em><strong>) </strong></td>
<td valign="top">signif(3.475, digits=2) es 3.5 </td>
</tr>
<tr>
<td valign="top"><strong>cos(</strong><em>x</em><strong>), sin(</strong><em>x</em><strong>), tan(</strong><em>x</em><strong>) </strong></td>
<td valign="top">tambien acos(<em>x</em>), cosh(<em>x</em>), acosh(<em>x</em>), etc. </td>
</tr>
<tr>
<td valign="top"><strong>log(</strong><em>x</em><strong>)</strong></td>
<td valign="top">logaritmo natural</td>
</tr>
<tr>
<td valign="top"><strong>log10(</strong><em>x</em><strong>)</strong></td>
<td valign="top">logaritmo base 10 </td>
</tr>
<tr>
<td valign="top"><strong>exp(</strong><em>x</em><strong>)</strong></td>
<td valign="top">e^<em>x</em></td>
</tr>
</table>


# Funciones Apply
La idea basica es que `apply()` aplica una funcion sobre un objeto que es iterable.

## `lapply()`
Aplica una funcion sobre una lista o un vector.
`lapply(X, FUN, ...)` X puede ser una lista o un vector y FUN es la funcion que quiere aplicar


```R
help(lapply)
```


```R
# seleccionar un solo numero aleatorio entre 1 y 10
sample(x = 1:10,1)
```


1



```R
# vector
v <- c(1,2,3,4,5)

# funcion inventada
addrand <- function(x){
    # obtener un numero aleatorio
    ran <-sample(x=1:10,1)
    
    # devuelve x + el numero aleatorio
    return(x+ran)
}

# lapply()
lapply(v,addrand)
```


<ol>
	<li>11</li>
	<li>3</li>
	<li>9</li>
	<li>10</li>
	<li>8</li>
</ol>



## Funciones Anonimas
No es necesario declarar toda la funcion, si es una funcion simple se puede crear para el momento que se necesita. (Es la idea similar a las expresiones Lambda en Python)


```R
v
```


<ol class=list-inline>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
</ol>




```R
# Vamos a hacer lo mismo que con el ejemplo de lapply()
# Funcion Anonima con lapply()
lapply(v, function(a){a+sample(x=1:10,1)})
```


<ol>
	<li>3</li>
	<li>3</li>
	<li>4</li>
	<li>13</li>
	<li>10</li>
</ol>




```R
# Otro Ejemplo
# Suma 2 a cada elemento
lapply(v,function(x){x+2})
```


<ol>
	<li>3</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
	<li>7</li>
</ol>



Con funciones con varios argumentos?


```R
add_choice <- function(num,choice){
    return(num+choice)
}
add_choice(2,3)
```


5



```R
lapply(v,add_choice,choice=10)
```


<ol>
	<li>11</li>
	<li>12</li>
	<li>13</li>
	<li>14</li>
	<li>15</li>
</ol>



Se pueden seguir poniendo argumentos sin problema.
## `sapply()` vs. `lapply()`
lapply devuelve una lista, sapply devuelve un vector o una matrix


```R
help(sapply)
```


```R
# Devuelve un vector
sapply(v,add_choice,choice=10)
```


<ol class=list-inline>
	<li>11</li>
	<li>12</li>
	<li>13</li>
	<li>14</li>
	<li>15</li>
</ol>




```R
# Vamos a probarlo
lapp <- lapply(v,add_choice,choice=10)
sapp <- sapply(v,add_choice,choice=10)

class(lapp) # Una lista
class(sapp) # Un vector de numeros
```


'list'



'numeric'


### Limitaciones de `sapply()`
sapply() no podrá devolver automáticamente un vector si la función aplicada no devuelve algo para todos los elementos en ese vector.


```R
# Verifica los numeros pares
even <- function(x) {
  return(x[(x %% 2 == 0)])
}

nums <- c(1,2,3,4,5)

sapply(nums,even) #devulelve una lista
```


<ol>
	<li></li>
	<li>2</li>
	<li></li>
	<li>4</li>
	<li></li>
</ol>




```R
lapply(nums,even)
```


<ol>
	<li></li>
	<li>2</li>
	<li></li>
	<li>4</li>
	<li></li>
</ol>



# Expresiones Regulares
Es un término general que cubre la idea de búsqueda de patrones, generalmente en un string (o un vector de strings).
- `grepl()` que devuelve un valor lógico que indica si se encontró el patrón 
- `grep()`  que devuelve un vector de ubicaciones de índice de instancias de patrón coincidentes. 

Para mas informacion lo puede hcaer en  http://www.regular-expressions.info/rlanguage.html
Para ambas funciones, pasará un patrón y luego el objeto que desea buscar. Veamos algunos ejemplos rápidos:


```R
text <- "Los datos son el nuevo petroleo en el siglo XXI"
```


```R
grepl('datos',text)
```


TRUE



```R
grepl('nuevo',text)
```


TRUE



```R
grepl('Jose',text)
```


FALSE



```R
v <- c('a','b','c','d')
```


```R
grep('a',v)
```


1



```R
grep('c',v)
```


3


---
# Timestamps
R nos brinda una variedad de herramientas para trabajar con información de tiempo. 
## Date
Puede usar la función `as.Date()` para convertir una cadena de caracteres en un objeto Date, lo que le permitirá contener más información de tiempo. El string deberá estar en un formato de hora estándar. Podemos solicitar la fecha de hoy preguntando al sistema (Sys) por la Fecha:



```R
Sys.Date()
```


<time datetime="2018-08-11">2018-08-11</time>



```R
# Guardarlo en una variable
today <- Sys.Date()
today
```


<time datetime="2018-08-11">2018-08-11</time>


También puede convertir cadenas de caracteres en R a un objeto Date usando `as.Date()`. Deberá asegurarse de que esté en el formato correcto o usar% símbolos correlacionados con su formato dado:

<table border="1">
<tr><td>Code</td><td>Value</td></tr>
<tr><td><tt>%d</tt></td><td>Day of the month (decimal number)</td></tr>
<tr><td><tt>%m</tt></td><td>Month (decimal number)</td></tr>
<tr><td><tt>%b</tt></td><td>Month (abbreviated)</td></tr>
<tr><td><tt>%B</tt></td><td>Month (full name)</td></tr>
<tr><td><tt>%y</tt></td><td>Year (2 digit)</td></tr>
<tr><td><tt>%Y</tt></td><td>Year (4 digit)</td></tr></table>



```R
# YYYY-MM-DD
as.Date('1990-11-03')
```


```R
# Usando format
as.Date("Nov-03-90",format="%b-%d-%y")
```


```R
# Usando format
as.Date("November-03-1990",format="%B-%d-%Y")
```

## Time
Convierte un string en un tipo de datos de tiempo, la funcion es `strptime()`


```R
help(strptime)
```


```R
strptime("11:02:03",format="%H:%M:%S")
```


    [1] "2018-08-11 11:02:03 -05"


---
# Leer y guardar Datos (Data Input and Output)

## CSV File (comma-separated values)


```R
# Poner todo el path completo
ex <- read.csv('./Datos/example.csv')
```


```R
# Verificar la estructura
str(ex)
```


```R
# Nombres de las columnas
colnames(ex)
```


```R
df <- data.frame(ex)
head(df)
```


```R
# tambein se puede utilizar si el archivo tiene otro tipo de caracter de separacion
help(read.csv)
```

### `read.table()`

Es la forma general de utilizar `read.csv()`


```R
read.table('./Datos/example.csv')
```

¡Observe cómo obtenemos un error aquí! Eso significa que necesitamos agregar argumentos adicionales a read.table, como lo que es el delimitador o separador (sep):


```R
read.table(file = './Datos/example.csv', sep = ',')
```

### Grabar a csv


```R
### Alternatively
write.csv(df, file = "foo.csv")
read.csv('foo.csv')
```


```R
#Sin los nombres de las filas
write.csv(df, file = "foo2.csv",row.names = FALSE)
read.csv('foo2.csv')
```

## Excel
Nota rápida: el archivo de Excel utilizado tiene una gran cantidad de valores de NA, así es  el archivo,

Para hacer esto, necesitamos el paquete readxl para R. Recuerde que puede descargarlo usando:

`install.packages('readxl')`


```R
# si no tiene el paquete readxl se debe instalar
#install.packages('readxl')
```


```R
# Load the readxl package
library(readxl)
```


```R
# list the sheets of the excel file
excel_sheets('./Datos/Sample-Sales-Data.xlsx')
```


```R
# tomar la informacion de la hoa 1 sheet1
df <- read_excel('./Datos/Sample-Sales-Data.xlsx',sheet='Sheet1')
```


```R
head(df)
```

Ahora se puede trabajar normalmente con el dataframe


```R
sum(df['Value'])
```


```R
str(df)
```


```R
summary(df)
```

Si se tienen varias hojas sheets, se peuden importar en una lista usando la funcion `lapply()`


```R
entire_workbook <- lapply(excel_sheets("./Datos/Sample-Sales-Data.xlsx"), 
                      read_excel, 
                      path = "./Datos/Sample-Sales-Data.xlsx")
```


```R
# Mostrar la lista completa
entire_workbook
```

## SQL EN R
La conexión de R a una base de datos SQL depende completamente del tipo de base de datos que esté utilizando (MYSQL, Oracle, etc.).
<p> Entonces, en lugar de tratar de cubrir todos estos (ya que cada uno requiere un tratamiento especial), se incluyen los siguientes enlaces:

### RODBC
La libreria [RODBC](https://cran.r-project.org/web/packages/DBI/DBI.pdf) 

### MySQL
Libreria ["RMySQL](https://cran.r-project.org/web/packages/RMySQL/index.html)

### Oracle
Libreria [ROracle](https://cran.r-project.org/web/packages/ROracle/index.html)

### JDBC
Libreria [JDBC](https://cran.r-project.org/web/packages/RJDBC/index.html)

# Referencias
- Funciones en R: https://cran.r-project.org/doc/contrib/Short-refcard.pdf
- [R para profesionales de los datos: una introducción - Carlos J. Gil Bellosta](https://www.datanalytics.com/libro_r/index.html)- 
- [R cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf)
