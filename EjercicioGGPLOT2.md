
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
```


```R
numlist100
```




<ol class=list-inline>
	<li>25858</li>
	<li>29913</li>
	<li>38368</li>
	<li>51584</li>
	<li>11819</li>
	<li>19030</li>
	<li>50135</li>
	<li>43014</li>
	<li>25397</li>
	<li>31314</li>
	<li>29406</li>
	<li>34416</li>
	<li>48847</li>
	<li>52439</li>
	<li>31369</li>
	<li>34462</li>
	<li>29134</li>
	<li>49524</li>
	<li>29424</li>
	<li>17775</li>
	<li>27622</li>
	<li>39406</li>
	<li>28086</li>
	<li>2185</li>
	<li>8771</li>
	<li>24774</li>
	<li>651</li>
	<li>45261</li>
	<li>48603</li>
	<li>27957</li>
	<li>10863</li>
	<li>25662</li>
	<li>36078</li>
	<li>41407</li>
	<li>12998</li>
	<li>12183</li>
	<li>33451</li>
	<li>2759</li>
	<li>45338</li>
	<li>19071</li>
	<li>53293</li>
	<li>8560</li>
	<li>47133</li>
	<li>156</li>
	<li>27401</li>
	<li>13888</li>
	<li>2294</li>
	<li>47160</li>
	<li>29950</li>
	<li>46754</li>
	<li>7159</li>
	<li>38387</li>
	<li>27099</li>
	<li>835</li>
	<li>11495</li>
	<li>29653</li>
	<li>45012</li>
	<li>49331</li>
	<li>14611</li>
	<li>25381</li>
	<li>50612</li>
	<li>32919</li>
	<li>39400</li>
	<li>49857</li>
	<li>818</li>
	<li>32821</li>
	<li>28724</li>
	<li>44299</li>
	<li>51167</li>
	<li>19505</li>
	<li>23355</li>
	<li>27791</li>
	<li>5462</li>
	<li>22062</li>
	<li>40778</li>
	<li>36500</li>
	<li>38224</li>
	<li>37225</li>
	<li>32056</li>
	<li>21621</li>
	<li>28429</li>
	<li>22781</li>
	<li>37230</li>
	<li>19769</li>
	<li>13346</li>
	<li>20187</li>
	<li>5364</li>
	<li>41518</li>
	<li>13505</li>
	<li>3347</li>
	<li>46562</li>
	<li>8626</li>
	<li>2289</li>
	<li>45591</li>
	<li>32686</li>
	<li>20139</li>
	<li>37984</li>
	<li>28892</li>
	<li>12587</li>
	<li>4542</li>
</ol>





```R
subset100diamonds <- diamonds[numlist100, ]
```


```R
head(subset100diamonds)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>clarity</th><th scope=col>depth</th><th scope=col>table</th><th scope=col>price</th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr></thead>
<tbody>
	<tr><th scope=row>25858</th><td>1.41</td><td>Very Good</td><td>G</td><td>VVS1</td><td>61.2</td><td>55</td><td>14936</td><td>7.22</td><td>7.25</td><td>4.43</td></tr>
	<tr><th scope=row>29913</th><td>0.42</td><td>Very Good</td><td>I</td><td>SI1</td><td>61</td><td>55.8</td><td>712</td><td>4.83</td><td>4.86</td><td>2.96</td></tr>
	<tr><th scope=row>38368</th><td>0.51</td><td>Ideal</td><td>I</td><td>SI1</td><td>62.5</td><td>57</td><td>1023</td><td>5.07</td><td>5.1</td><td>3.18</td></tr>
	<tr><th scope=row>51584</th><td>0.6</td><td>Premium</td><td>E</td><td>VVS2</td><td>62.4</td><td>61</td><td>2393</td><td>5.36</td><td>5.31</td><td>3.33</td></tr>
	<tr><th scope=row>11819</th><td>1</td><td>Good</td><td>D</td><td>SI1</td><td>64.2</td><td>60</td><td>5093</td><td>6.22</td><td>6.28</td><td>4.01</td></tr>
	<tr><th scope=row>19030</th><td>0.27</td><td>Very Good</td><td>E</td><td>VVS2</td><td>63.8</td><td>54</td><td>621</td><td>4.06</td><td>4.09</td><td>2.6</td></tr>
</tbody>
</table>





```R
dim(diamonds)
```




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




0.27






2.37






397






18508



## * Generamos la gráfica


```R
grafica <- ggplot(subset100diamonds, aes(x=carat, y=price, color=color))
```


```R
grafica + geom_point() + xlab('Quilates') + ylab('Precio') + xlim(caremin, caremax) + ylim(pricemin, pricemax) + geom_smooth(method = 'lm', formula=y~x, aes(group=1))
```

    Warning message:
    : Removed 4 rows containing missing values (geom_path).


![images/svg](output_17_1.svg)

