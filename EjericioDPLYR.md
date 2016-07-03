
# Ejericio de DPLYR
***
- Autor: Juan Antonio García Cuevas
- Fecha: 03/07/2016
***

## * Cargamos las librerías dplyr y ggplot2:


```R
library(dplyr)
library(ggplot2)
```

## * Inspeccionamos el dataset diamonds:


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




## * Filtramos los diamantes con corte “Ideal”:


```R
diamondsWork <- filter(diamonds, cut == "Ideal")
head(diamondsWork)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>clarity</th><th scope=col>depth</th><th scope=col>table</th><th scope=col>price</th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>SI2</td><td>61.5</td><td>55</td><td>326</td><td>3.95</td><td>3.98</td><td>2.43</td></tr>
	<tr><th scope=row>2</th><td>0.23</td><td>Ideal</td><td>J</td><td>VS1</td><td>62.8</td><td>56</td><td>340</td><td>3.93</td><td>3.9</td><td>2.46</td></tr>
	<tr><th scope=row>3</th><td>0.31</td><td>Ideal</td><td>J</td><td>SI2</td><td>62.2</td><td>54</td><td>344</td><td>4.35</td><td>4.37</td><td>2.71</td></tr>
	<tr><th scope=row>4</th><td>0.3</td><td>Ideal</td><td>I</td><td>SI2</td><td>62</td><td>54</td><td>348</td><td>4.31</td><td>4.34</td><td>2.68</td></tr>
	<tr><th scope=row>5</th><td>0.33</td><td>Ideal</td><td>I</td><td>SI2</td><td>61.8</td><td>55</td><td>403</td><td>4.49</td><td>4.51</td><td>2.78</td></tr>
	<tr><th scope=row>6</th><td>0.33</td><td>Ideal</td><td>I</td><td>SI2</td><td>61.2</td><td>56</td><td>403</td><td>4.49</td><td>4.5</td><td>2.75</td></tr>
</tbody>
</table>




## * Seleccionamos las columnas carat, cut, color, price y clarity:


```R
diamondsWork <- select(diamondsWork, carat, cut, color, price, clarity)
head(diamondsWork)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>price</th><th scope=col>clarity</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>326</td><td>SI2</td></tr>
	<tr><th scope=row>2</th><td>0.23</td><td>Ideal</td><td>J</td><td>340</td><td>VS1</td></tr>
	<tr><th scope=row>3</th><td>0.31</td><td>Ideal</td><td>J</td><td>344</td><td>SI2</td></tr>
	<tr><th scope=row>4</th><td>0.3</td><td>Ideal</td><td>I</td><td>348</td><td>SI2</td></tr>
	<tr><th scope=row>5</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td></tr>
	<tr><th scope=row>6</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td></tr>
</tbody>
</table>




## * Creamos una nueva columna precio/quilate:


```R
diamondsWork <- mutate(diamondsWork, caretprice = price/carat)
head(diamondsWork)
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>price</th><th scope=col>clarity</th><th scope=col>caretprice</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>326</td><td>SI2</td><td>1417.391</td></tr>
	<tr><th scope=row>2</th><td>0.23</td><td>Ideal</td><td>J</td><td>340</td><td>VS1</td><td>1478.261</td></tr>
	<tr><th scope=row>3</th><td>0.31</td><td>Ideal</td><td>J</td><td>344</td><td>SI2</td><td>1109.677</td></tr>
	<tr><th scope=row>4</th><td>0.3</td><td>Ideal</td><td>I</td><td>348</td><td>SI2</td><td>1160</td></tr>
	<tr><th scope=row>5</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
	<tr><th scope=row>6</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
</tbody>
</table>




## * Agrupamos los diamantes por color:


```R
diamondsWork <- group_by(diamondsWork, color)
head(diamondsWork)
summarise(diamondsWork, max(price))
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>price</th><th scope=col>clarity</th><th scope=col>caretprice</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>326</td><td>SI2</td><td>1417.391</td></tr>
	<tr><th scope=row>2</th><td>0.23</td><td>Ideal</td><td>J</td><td>340</td><td>VS1</td><td>1478.261</td></tr>
	<tr><th scope=row>3</th><td>0.31</td><td>Ideal</td><td>J</td><td>344</td><td>SI2</td><td>1109.677</td></tr>
	<tr><th scope=row>4</th><td>0.3</td><td>Ideal</td><td>I</td><td>348</td><td>SI2</td><td>1160</td></tr>
	<tr><th scope=row>5</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
	<tr><th scope=row>6</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
</tbody>
</table>







<table>
<thead><tr><th></th><th scope=col>color</th><th scope=col>max(price)</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>D</td><td>18693</td></tr>
	<tr><th scope=row>2</th><td>E</td><td>18729</td></tr>
	<tr><th scope=row>3</th><td>F</td><td>18780</td></tr>
	<tr><th scope=row>4</th><td>G</td><td>18806</td></tr>
	<tr><th scope=row>5</th><td>H</td><td>18760</td></tr>
	<tr><th scope=row>6</th><td>I</td><td>18779</td></tr>
	<tr><th scope=row>7</th><td>J</td><td>18508</td></tr>
</tbody>
</table>




## * Calculamos la media del precio/quilate para cada uno de los grupos anteriores:


```R
diamondsWork <- group_by(diamondsWork, color)
head(diamondsWork)
summarise(diamondsWork, max(caretprice))
```




<table>
<thead><tr><th></th><th scope=col>carat</th><th scope=col>cut</th><th scope=col>color</th><th scope=col>price</th><th scope=col>clarity</th><th scope=col>caretprice</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>0.23</td><td>Ideal</td><td>E</td><td>326</td><td>SI2</td><td>1417.391</td></tr>
	<tr><th scope=row>2</th><td>0.23</td><td>Ideal</td><td>J</td><td>340</td><td>VS1</td><td>1478.261</td></tr>
	<tr><th scope=row>3</th><td>0.31</td><td>Ideal</td><td>J</td><td>344</td><td>SI2</td><td>1109.677</td></tr>
	<tr><th scope=row>4</th><td>0.3</td><td>Ideal</td><td>I</td><td>348</td><td>SI2</td><td>1160</td></tr>
	<tr><th scope=row>5</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
	<tr><th scope=row>6</th><td>0.33</td><td>Ideal</td><td>I</td><td>403</td><td>SI2</td><td>1221.212</td></tr>
</tbody>
</table>







<table>
<thead><tr><th></th><th scope=col>color</th><th scope=col>max(caretprice)</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>D</td><td>17077.67</td></tr>
	<tr><th scope=row>2</th><td>E</td><td>14609.38</td></tr>
	<tr><th scope=row>3</th><td>F</td><td>13860.9</td></tr>
	<tr><th scope=row>4</th><td>G</td><td>12454.3</td></tr>
	<tr><th scope=row>5</th><td>H</td><td>10187.5</td></tr>
	<tr><th scope=row>6</th><td>I</td><td>9116.019</td></tr>
	<tr><th scope=row>7</th><td>J</td><td>8647.115</td></tr>
</tbody>
</table>




## * Ordenamos por precio/quilate de forma descendente:


```R
diamondsWork <- diamondsWork %>% group_by(color) %>% summarise(med = mean(caretprice)) %>% arrange(desc(med))
diamondsWork
```




<table>
<thead><tr><th></th><th scope=col>color</th><th scope=col>med</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>G</td><td>4163.999</td></tr>
	<tr><th scope=row>2</th><td>F</td><td>4097.519</td></tr>
	<tr><th scope=row>3</th><td>H</td><td>3846.066</td></tr>
	<tr><th scope=row>4</th><td>I</td><td>3808.071</td></tr>
	<tr><th scope=row>5</th><td>D</td><td>3806.532</td></tr>
	<tr><th scope=row>6</th><td>J</td><td>3733.766</td></tr>
	<tr><th scope=row>7</th><td>E</td><td>3683.172</td></tr>
</tbody>
</table>



