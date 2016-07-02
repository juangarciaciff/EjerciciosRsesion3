
# Ejercicio de QQPLOT2
***

- Autor: Juan Antonio García Cuevas
- Fecha: 02/07/2016

## * Cargamos la librería ggplot2


```R
library(ggplot2)
```

## * Inspeccionamos el dataset diamonds


```R
head(diamonds)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>clarity</th><th scope=col>depth</th><th scope=col>table</th><th scope=col>price</th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>SI2</td><td>61.5</td><td>55</td><td>326</td><td>3.95</td><td>3.98</td><td>2.43</td></tr>
	<tr><th scope=row>2</th><td>0.21</td><td>Premium</td><td>E</td><td>SI1</td><td>59.8</td><td>61</td><td>326</td><td>3.89</td><td>3.84</td><td>2.31</td></tr>
	<tr><th scope=row>3</th><td>0.23</td><td>Good</td><td>E</td><td>VS1</td><td>56.9</td><td>65</td><td>327</td><td>4.05</td><td>4.07</td><td>2.31</td></tr>
	<tr><th scope=row>4</th><td>0.29</td><td>Premium</td><td>I</td><td>VS2</td><td>62.4</td><td>58</td><td>334</td><td>4.2</td><td>4.23</td><td>2.63</td></tr>
	<tr><th scope=row>5</th><td>0.31</td><td>Good</td><td>J</td><td>SI2</td><td>63.3</td><td>58</td><td>335</td><td>4.34</td><td>4.35</td><td>2.75</td></tr>
	<tr><th scope=row>6</th><td>0.24</td><td>Very Good</td><td>J</td><td>VVS2</td><td>62.8</td><td>57</td><td>336</td><td>3.94</td><td>3.96</td><td>2.48</td></tr>
</tbody>
</table>





```R
dim(diamonds)
```




<ol class=list-inline>
	<li>53940</li>
	<li>10</li>
</ol>




## * Generamos una muestra aleatoria del 100 filas del dataset diamonds


```R
numlist100 <- sample(1:length(diamonds[[1]]), 100)
head(numlist100)
length(numlist100)
```




<ol class=list-inline>
	<li>34</li>
	<li>42306</li>
	<li>37944</li>
	<li>2488</li>
	<li>35078</li>
	<li>5699</li>
</ol>







100




```R
subset100diamonds <- diamonds[numlist100, ]
head(subset100diamonds)
dim(diamonds)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>clarity</th><th scope=col>depth</th><th scope=col>table</th><th scope=col>price</th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr></thead>
<tbody>
	<tr><th scope=row>34</th><td>0.23</td><td>Very Good</td><td>E</td><td>VS1</td><td>59.5</td><td>58</td><td>402</td><td>4.01</td><td>4.06</td><td>2.4</td></tr>
	<tr><th scope=row>42306</th><td>0.55</td><td>Very Good</td><td>D</td><td>SI2</td><td>63.3</td><td>56</td><td>1295</td><td>5.22</td><td>5.24</td><td>3.31</td></tr>
	<tr><th scope=row>37944</th><td>0.33</td><td>Very Good</td><td>H</td><td>VS2</td><td>58.8</td><td>62</td><td>486</td><td>4.49</td><td>4.53</td><td>2.65</td></tr>
	<tr><th scope=row>2488</th><td>0.8</td><td>Ideal</td><td>D</td><td>SI1</td><td>61.7</td><td>56</td><td>3195</td><td>5.96</td><td>6</td><td>3.69</td></tr>
	<tr><th scope=row>35078</th><td>0.3</td><td>Very Good</td><td>F</td><td>IF</td><td>62.6</td><td>55</td><td>886</td><td>4.3</td><td>4.32</td><td>2.7</td></tr>
	<tr><th scope=row>5699</th><td>1</td><td>Fair</td><td>E</td><td>SI2</td><td>56.9</td><td>63</td><td>3889</td><td>6.54</td><td>6.49</td><td>3.71</td></tr>
</tbody>
</table>







<ol class=list-inline>
	<li>53940</li>
	<li>10</li>
</ol>




## * Obtenemos los límites de los ejes para cuadrar la gráfica


```R
caremin <- min(subset100diamonds[1])
caremax <- max(subset100diamonds[1])
pricemin <- min(subset100diamonds[7])
pricemax <- max(subset100diamonds[7])
caremin
caremax
pricemin
pricemax
```




0.2






2.5






367






17294



## * Generamos la gráfica


```R
grafica <- ggplot(subset100diamonds, aes(x=carat, y=price, color=color))
```


```R
grafica + geom_point() + xlab('Quilates') + ylab('Precio') + xlim(caremin, caremax) + ylim(pricemin, pricemax) + geom_smooth(method = 'lm', formula=y~x, aes(group=1))
```

    Warning message:
    : Removed 5 rows containing missing values (geom_path).


![svg](images/output_14_1.svg)


***
