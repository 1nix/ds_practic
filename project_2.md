# Исследование надежности заемщиков


Во второй части проекта вы выполните шаги 3 и 4. Их вручную проверит ревьюер.
Чтобы вам не пришлось писать код заново для шагов 1 и 2, мы добавили авторские решения в ячейки с кодом. 



## Откройте таблицу и изучите общую информацию о данных

**Задание 1. Импортируйте библиотеку pandas. Считайте данные из csv-файла в датафрейм и сохраните в переменную `data`. Путь к файлу:**

`/datasets/data.csv`


```python
import pandas as pd

try:
    data = pd.read_csv('/datasets/data.csv')
except:
    data = pd.read_csv('https://code.s3.yandex.net/datasets/data.csv')
```

**Задание 2. Выведите первые 20 строчек датафрейма `data` на экран.**


```python
data.head(20)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>children</th>
      <th>days_employed</th>
      <th>dob_years</th>
      <th>education</th>
      <th>education_id</th>
      <th>family_status</th>
      <th>family_status_id</th>
      <th>gender</th>
      <th>income_type</th>
      <th>debt</th>
      <th>total_income</th>
      <th>purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>-8437.673028</td>
      <td>42</td>
      <td>высшее</td>
      <td>0</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>253875.639453</td>
      <td>покупка жилья</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>-4024.803754</td>
      <td>36</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>112080.014102</td>
      <td>приобретение автомобиля</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>-5623.422610</td>
      <td>33</td>
      <td>Среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>145885.952297</td>
      <td>покупка жилья</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>-4124.747207</td>
      <td>32</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>267628.550329</td>
      <td>дополнительное образование</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>340266.072047</td>
      <td>53</td>
      <td>среднее</td>
      <td>1</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>F</td>
      <td>пенсионер</td>
      <td>0</td>
      <td>158616.077870</td>
      <td>сыграть свадьбу</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0</td>
      <td>-926.185831</td>
      <td>27</td>
      <td>высшее</td>
      <td>0</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>M</td>
      <td>компаньон</td>
      <td>0</td>
      <td>255763.565419</td>
      <td>покупка жилья</td>
    </tr>
    <tr>
      <th>6</th>
      <td>0</td>
      <td>-2879.202052</td>
      <td>43</td>
      <td>высшее</td>
      <td>0</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>компаньон</td>
      <td>0</td>
      <td>240525.971920</td>
      <td>операции с жильем</td>
    </tr>
    <tr>
      <th>7</th>
      <td>0</td>
      <td>-152.779569</td>
      <td>50</td>
      <td>СРЕДНЕЕ</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>135823.934197</td>
      <td>образование</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2</td>
      <td>-6929.865299</td>
      <td>35</td>
      <td>ВЫСШЕЕ</td>
      <td>0</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>95856.832424</td>
      <td>на проведение свадьбы</td>
    </tr>
    <tr>
      <th>9</th>
      <td>0</td>
      <td>-2188.756445</td>
      <td>41</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>144425.938277</td>
      <td>покупка жилья для семьи</td>
    </tr>
    <tr>
      <th>10</th>
      <td>2</td>
      <td>-4171.483647</td>
      <td>36</td>
      <td>высшее</td>
      <td>0</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>компаньон</td>
      <td>0</td>
      <td>113943.491460</td>
      <td>покупка недвижимости</td>
    </tr>
    <tr>
      <th>11</th>
      <td>0</td>
      <td>-792.701887</td>
      <td>40</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>77069.234271</td>
      <td>покупка коммерческой недвижимости</td>
    </tr>
    <tr>
      <th>12</th>
      <td>0</td>
      <td>NaN</td>
      <td>65</td>
      <td>среднее</td>
      <td>1</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>M</td>
      <td>пенсионер</td>
      <td>0</td>
      <td>NaN</td>
      <td>сыграть свадьбу</td>
    </tr>
    <tr>
      <th>13</th>
      <td>0</td>
      <td>-1846.641941</td>
      <td>54</td>
      <td>неоконченное высшее</td>
      <td>2</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>130458.228857</td>
      <td>приобретение автомобиля</td>
    </tr>
    <tr>
      <th>14</th>
      <td>0</td>
      <td>-1844.956182</td>
      <td>56</td>
      <td>высшее</td>
      <td>0</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>F</td>
      <td>компаньон</td>
      <td>1</td>
      <td>165127.911772</td>
      <td>покупка жилой недвижимости</td>
    </tr>
    <tr>
      <th>15</th>
      <td>1</td>
      <td>-972.364419</td>
      <td>26</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>116820.904450</td>
      <td>строительство собственной недвижимости</td>
    </tr>
    <tr>
      <th>16</th>
      <td>0</td>
      <td>-1719.934226</td>
      <td>35</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>289202.704229</td>
      <td>недвижимость</td>
    </tr>
    <tr>
      <th>17</th>
      <td>0</td>
      <td>-2369.999720</td>
      <td>33</td>
      <td>высшее</td>
      <td>0</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>90410.586745</td>
      <td>строительство недвижимости</td>
    </tr>
    <tr>
      <th>18</th>
      <td>0</td>
      <td>400281.136913</td>
      <td>53</td>
      <td>среднее</td>
      <td>1</td>
      <td>вдовец / вдова</td>
      <td>2</td>
      <td>F</td>
      <td>пенсионер</td>
      <td>0</td>
      <td>56823.777243</td>
      <td>на покупку подержанного автомобиля</td>
    </tr>
    <tr>
      <th>19</th>
      <td>0</td>
      <td>-10038.818549</td>
      <td>48</td>
      <td>СРЕДНЕЕ</td>
      <td>1</td>
      <td>в разводе</td>
      <td>3</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>242831.107982</td>
      <td>на покупку своего автомобиля</td>
    </tr>
  </tbody>
</table>
</div>



**Задание 3. Выведите основную информацию о датафрейме с помощью метода `info()`.**


```python
data.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 21525 entries, 0 to 21524
    Data columns (total 12 columns):
     #   Column            Non-Null Count  Dtype  
    ---  ------            --------------  -----  
     0   children          21525 non-null  int64  
     1   days_employed     19351 non-null  float64
     2   dob_years         21525 non-null  int64  
     3   education         21525 non-null  object 
     4   education_id      21525 non-null  int64  
     5   family_status     21525 non-null  object 
     6   family_status_id  21525 non-null  int64  
     7   gender            21525 non-null  object 
     8   income_type       21525 non-null  object 
     9   debt              21525 non-null  int64  
     10  total_income      19351 non-null  float64
     11  purpose           21525 non-null  object 
    dtypes: float64(2), int64(5), object(5)
    memory usage: 2.0+ MB


## Предобработка данных

### Удаление пропусков

**Задание 4. Выведите количество пропущенных значений для каждого столбца. Используйте комбинацию двух методов.**


```python
data.isna().sum()
```




    children               0
    days_employed       2174
    dob_years              0
    education              0
    education_id           0
    family_status          0
    family_status_id       0
    gender                 0
    income_type            0
    debt                   0
    total_income        2174
    purpose                0
    dtype: int64



**Задание 5. В двух столбцах есть пропущенные значения. Один из них — `days_employed`. Пропуски в этом столбце вы обработаете на следующем этапе. Другой столбец с пропущенными значениями — `total_income` — хранит данные о доходах. На сумму дохода сильнее всего влияет тип занятости, поэтому заполнить пропуски в этом столбце нужно медианным значением по каждому типу из столбца `income_type`. Например, у человека с типом занятости `сотрудник` пропуск в столбце `total_income` должен быть заполнен медианным доходом среди всех записей с тем же типом.**


```python
for t in data['income_type'].unique():
    data.loc[(data['income_type'] == t) & (data['total_income'].isna()), 'total_income'] = \
    data.loc[(data['income_type'] == t), 'total_income'].median()
```

### Обработка аномальных значений

**Задание 6. В данных могут встречаться артефакты (аномалии) — значения, которые не отражают действительность и появились по какой-то ошибке. таким артефактом будет отрицательное количество дней трудового стажа в столбце `days_employed`. Для реальных данных это нормально. Обработайте значения в этом столбце: замените все отрицательные значения положительными с помощью метода `abs()`.**


```python
data['days_employed'] = data['days_employed'].abs()
```

**Задание 7. Для каждого типа занятости выведите медианное значение трудового стажа `days_employed` в днях.**


```python
data.groupby('income_type')['days_employed'].agg('median')
```




    income_type
    безработный        366413.652744
    в декрете            3296.759962
    госслужащий          2689.368353
    компаньон            1547.382223
    пенсионер          365213.306266
    предприниматель       520.848083
    сотрудник            1574.202821
    студент               578.751554
    Name: days_employed, dtype: float64



У двух типов (безработные и пенсионеры) получатся аномально большие значения. Исправить такие значения сложно, поэтому оставьте их как есть. Тем более этот столбец не понадобится вам для исследования.

**Задание 8. Выведите перечень уникальных значений столбца `children`.**


```python
data['children'].unique()
```




    array([ 1,  0,  3,  2, -1,  4, 20,  5])



**Задание 9. В столбце `children` есть два аномальных значения. Удалите строки, в которых встречаются такие аномальные значения из датафрейма `data`.**


```python
data = data[(data['children'] != -1) & (data['children'] != 20)]
```

**Задание 10. Ещё раз выведите перечень уникальных значений столбца `children`, чтобы убедиться, что артефакты удалены.**


```python
data['children'].unique()
```




    array([1, 0, 3, 2, 4, 5])



### Удаление пропусков (продолжение)

**Задание 11. Заполните пропуски в столбце `days_employed` медианными значениями по каждого типа занятости `income_type`.**


```python
for t in data['income_type'].unique():
    data.loc[(data['income_type'] == t) & (data['days_employed'].isna()), 'days_employed'] = \
    data.loc[(data['income_type'] == t), 'days_employed'].median()
```

**Задание 12. Убедитесь, что все пропуски заполнены. Проверьте себя и ещё раз выведите количество пропущенных значений для каждого столбца с помощью двух методов.**


```python
data.isna().sum()
```




    children            0
    days_employed       0
    dob_years           0
    education           0
    education_id        0
    family_status       0
    family_status_id    0
    gender              0
    income_type         0
    debt                0
    total_income        0
    purpose             0
    dtype: int64



### Изменение типов данных

**Задание 13. Замените вещественный тип данных в столбце `total_income` на целочисленный с помощью метода `astype()`.**


```python
data['total_income'] = data['total_income'].astype(int)
```

### Обработка дубликатов

**Задание 14. Обработайте неявные дубликаты в столбце `education`. В этом столбце есть одни и те же значения, но записанные по-разному: с использованием заглавных и строчных букв. Приведите их к нижнему регистру. Проверьте остальные столбцы.**


```python
data['education'] = data['education'].str.lower()
```

**Задание 15. Выведите на экран количество строк-дубликатов в данных. Если такие строки присутствуют, удалите их.**


```python
data.duplicated().sum()
```




    71




```python
data = data.drop_duplicates()
```

### Категоризация данных

**Задание 16. На основании диапазонов, указанных ниже, создайте в датафрейме `data` столбец `total_income_category` с категориями:**

- 0–30000 — `'E'`;
- 30001–50000 — `'D'`;
- 50001–200000 — `'C'`;
- 200001–1000000 — `'B'`;
- 1000001 и выше — `'A'`.


**Например, кредитополучателю с доходом 25000 нужно назначить категорию `'E'`, а клиенту, получающему 235000, — `'B'`. Используйте собственную функцию с именем `categorize_income()` и метод `apply()`.**


```python
def categorize_income(income):
    try:
        if 0 <= income <= 30000:
            return 'E'
        elif 30001 <= income <= 50000:
            return 'D'
        elif 50001 <= income <= 200000:
            return 'C'
        elif 200001 <= income <= 1000000:
            return 'B'
        elif income >= 1000001:
            return 'A'
    except:
        pass
```


```python
data['total_income_category'] = data['total_income'].apply(categorize_income)
```

**Задание 17. Выведите на экран перечень уникальных целей взятия кредита из столбца `purpose`.**


```python
data['purpose'].unique()
```




    array(['покупка жилья', 'приобретение автомобиля',
           'дополнительное образование', 'сыграть свадьбу',
           'операции с жильем', 'образование', 'на проведение свадьбы',
           'покупка жилья для семьи', 'покупка недвижимости',
           'покупка коммерческой недвижимости', 'покупка жилой недвижимости',
           'строительство собственной недвижимости', 'недвижимость',
           'строительство недвижимости', 'на покупку подержанного автомобиля',
           'на покупку своего автомобиля',
           'операции с коммерческой недвижимостью',
           'строительство жилой недвижимости', 'жилье',
           'операции со своей недвижимостью', 'автомобили',
           'заняться образованием', 'сделка с подержанным автомобилем',
           'получение образования', 'автомобиль', 'свадьба',
           'получение дополнительного образования', 'покупка своего жилья',
           'операции с недвижимостью', 'получение высшего образования',
           'свой автомобиль', 'сделка с автомобилем',
           'профильное образование', 'высшее образование',
           'покупка жилья для сдачи', 'на покупку автомобиля', 'ремонт жилью',
           'заняться высшим образованием'], dtype=object)



**Задание 18. Создайте функцию, которая на основании данных из столбца `purpose` сформирует новый столбец `purpose_category`, в который войдут следующие категории:**

- `'операции с автомобилем'`,
- `'операции с недвижимостью'`,
- `'проведение свадьбы'`,
- `'получение образования'`.

**Например, если в столбце `purpose` находится подстрока `'на покупку автомобиля'`, то в столбце `purpose_category` должна появиться строка `'операции с автомобилем'`.**

**Используйте собственную функцию с именем `categorize_purpose()` и метод `apply()`. Изучите данные в столбце `purpose` и определите, какие подстроки помогут вам правильно определить категорию.**


```python
def categorize_purpose(row):
    try:
        if 'автом' in row:
            return 'операции с автомобилем'
        elif 'жил' in row or 'недвиж' in row:
            return 'операции с недвижимостью'
        elif 'свад' in row:
            return 'проведение свадьбы'
        elif 'образов' in row:
            return 'получение образования'
    except:
        return 'нет категории'
```


```python
data['purpose_category'] = data['purpose'].apply(categorize_purpose)
```

### Шаг 3. Исследуйте данные и ответьте на вопросы


```python
def grouping (target, row): # группировка по колонке 
    try:
        return row.groupby([target]).agg({'debt':['mean','sum','count']}).round(2)
    except:
        print('smth wrong')
        
```

 

#### 3.1 Есть ли зависимость между количеством детей и возвратом кредита в срок?


```python
data.head(5)# Ваш код будет здесь. Вы можете создавать новые ячейки.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>children</th>
      <th>days_employed</th>
      <th>dob_years</th>
      <th>education</th>
      <th>education_id</th>
      <th>family_status</th>
      <th>family_status_id</th>
      <th>gender</th>
      <th>income_type</th>
      <th>debt</th>
      <th>total_income</th>
      <th>purpose</th>
      <th>total_income_category</th>
      <th>purpose_category</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>8437.673028</td>
      <td>42</td>
      <td>высшее</td>
      <td>0</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>253875</td>
      <td>покупка жилья</td>
      <td>B</td>
      <td>операции с недвижимостью</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>4024.803754</td>
      <td>36</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>F</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>112080</td>
      <td>приобретение автомобиля</td>
      <td>C</td>
      <td>операции с автомобилем</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>5623.422610</td>
      <td>33</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>145885</td>
      <td>покупка жилья</td>
      <td>C</td>
      <td>операции с недвижимостью</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>4124.747207</td>
      <td>32</td>
      <td>среднее</td>
      <td>1</td>
      <td>женат / замужем</td>
      <td>0</td>
      <td>M</td>
      <td>сотрудник</td>
      <td>0</td>
      <td>267628</td>
      <td>дополнительное образование</td>
      <td>B</td>
      <td>получение образования</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>340266.072047</td>
      <td>53</td>
      <td>среднее</td>
      <td>1</td>
      <td>гражданский брак</td>
      <td>1</td>
      <td>F</td>
      <td>пенсионер</td>
      <td>0</td>
      <td>158616</td>
      <td>сыграть свадьбу</td>
      <td>C</td>
      <td>проведение свадьбы</td>
    </tr>
  </tbody>
</table>
</div>




```python
df_group = grouping('children', data) # группировка по children
df_group.loc['3+'] = df_group.loc[3] + df_group.loc[4] + df_group.loc[5] #создание новой категории, что увеличить выборку
df_group.drop(index=[3,4,5])
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="3" halign="left">debt</th>
    </tr>
    <tr>
      <th></th>
      <th>mean</th>
      <th>sum</th>
      <th>count</th>
    </tr>
    <tr>
      <th>children</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.08</td>
      <td>1063.0</td>
      <td>14091.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.09</td>
      <td>444.0</td>
      <td>4808.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.09</td>
      <td>194.0</td>
      <td>2052.0</td>
    </tr>
    <tr>
      <th>3+</th>
      <td>0.18</td>
      <td>31.0</td>
      <td>380.0</td>
    </tr>
  </tbody>
</table>
</div>





**Вывод:** 
<!-- Общее сравнение медианой и средним арифметическим, не выявляет различий между детьми и сроками возврата. Если предположить, что нету выбросов в колонке total_income, сравниваем среднее относительно количеством детей и рейтингом. 
- Для клиентов с рейтингом А наличие 2 и 3 детей уменьшает средний total_income
- Для клиентов с рейтингом В наличие от 0 до 3 детей увеличивает срединй total_income, но уменьшается с количеством детей 4 и 5
- Для клиентов с рейтингом С наличие 0, 2, 5 среднее практическо одинаковое, а вот для 1, 3 и 4 среднее выше по категории
- Для клиентов с рейтингом D и E среднее увеличивается с ростом количеством детей.

<!-- Зависимость от количества долгов:
- Для группы С процент долгов не изменяется от количества детей
- Для группы В процент долгов увеличивается в два раза от среднего при 4 детях
- Для группы D процент долгов увеличивается при увеличении количества детей
- Для группы Е процент резко падает при 1 ребенке, а для группы А при 2, что вносит сомнения в корректность данных

Зависимость от количества долгов:
- Для некоторых категорий А, Е и 4, 5 детей данных мало относительно остальных групп
- У категорий B , C есть разница в 1 %, 2 % в количесте непогашенных кредитов, если детей нет
- В категории D увеличивается вероятность непогашенного кредита от количества детей
 
Таким образом, гипотеза потвердилась зависимость между количеством детей и возвратом кредита в срок -->

Посчитал среднее количетсов задолжностей по количеству детей. Для клиентов с 3,4,5 детьми выборка небольшая, поэтому объединил в общую группу 3+.
Сравнение задолжностей и количеством детей показало:
- Без детей средняя задолжность 8%
- Для 1 и 2 ребенка 9%
- Для группы 3+ составляет 18%, что в два раза больше, чем у 1 и 2 детей, но данных мало

Гипотеза частично потвердилась.




#### 3.2 Есть ли зависимость между семейным положением и возвратом кредита в срок?


```python
data_pivot_family=data.pivot_table(index=['total_income_category'], columns='family_status', values='debt', aggfunc=['sum'])# Ваш код будет здесь. Вы можете создавать новые ячейки.
data_pivot_family
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="5" halign="left">sum</th>
    </tr>
    <tr>
      <th>family_status</th>
      <th>Не женат / не замужем</th>
      <th>в разводе</th>
      <th>вдовец / вдова</th>
      <th>гражданский брак</th>
      <th>женат / замужем</th>
    </tr>
    <tr>
      <th>total_income_category</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>B</th>
      <td>62.0</td>
      <td>18.0</td>
      <td>9.0</td>
      <td>64.0</td>
      <td>201.0</td>
    </tr>
    <tr>
      <th>C</th>
      <td>209.0</td>
      <td>64.0</td>
      <td>54.0</td>
      <td>315.0</td>
      <td>711.0</td>
    </tr>
    <tr>
      <th>D</th>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>5.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>E</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
data_group_family = grouping('family_status',data).reset_index() # группировка по family_status
data_group_family
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>family_status</th>
      <th colspan="3" halign="left">debt</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th>mean</th>
      <th>sum</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Не женат / не замужем</td>
      <td>0.10</td>
      <td>273</td>
      <td>2796</td>
    </tr>
    <tr>
      <th>1</th>
      <td>в разводе</td>
      <td>0.07</td>
      <td>84</td>
      <td>1189</td>
    </tr>
    <tr>
      <th>2</th>
      <td>вдовец / вдова</td>
      <td>0.07</td>
      <td>63</td>
      <td>951</td>
    </tr>
    <tr>
      <th>3</th>
      <td>гражданский брак</td>
      <td>0.09</td>
      <td>385</td>
      <td>4134</td>
    </tr>
    <tr>
      <th>4</th>
      <td>женат / замужем</td>
      <td>0.08</td>
      <td>927</td>
      <td>12261</td>
    </tr>
  </tbody>
</table>
</div>




```python
data_group_family.loc[5] = data_group_family.loc[[0,1,2]].sum() # разделяем по 2ум категориям  
data_group_family.loc[6] = data_group_family.loc[[3,4]].sum()
data_group_family.drop(index=[i for i in range(5)]) 
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>family_status</th>
      <th colspan="3" halign="left">debt</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th>mean</th>
      <th>sum</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5</th>
      <td>Не женат / не замужемв разводевдовец / вдова</td>
      <td>0.24</td>
      <td>420</td>
      <td>4936</td>
    </tr>
    <tr>
      <th>6</th>
      <td>гражданский бракженат / замужем</td>
      <td>0.17</td>
      <td>1312</td>
      <td>16395</td>
    </tr>
  </tbody>
</table>
</div>



**Вывод:** 
<!-- - Для рейтинга A D E недостаточно данных для сравнения гипотезы
- Для рейтинга B есть разница между 'Не женат / не замужем' и всеми остальными статусами в 2-3% количество непогашенных кредитов  
- Для рейтинга С есть разница между 'гражданский брак' и 'Не женат / не замужем' и всеми остальными в 2-3% количество непогашенных кредитов есть разница между 

Таким образом, можно частично потвердить гипотезу  -->

Сформируем заемщиков по семейному статусу, в первой строке не находятся в браке, во второй строке в браке
- Количество задолжностей не в браке 24%
- Количество задолжностей в браке 17%
Гипотеза потвердилась, семейный статус влияет на возврат долга.



#### 3.3 Есть ли зависимость между уровнем дохода и возвратом кредита в срок?


```python
data.groupby(['total_income_category']).agg({'debt':['mean','sum','count']}).round(2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="3" halign="left">debt</th>
    </tr>
    <tr>
      <th></th>
      <th>mean</th>
      <th>sum</th>
      <th>count</th>
    </tr>
    <tr>
      <th>total_income_category</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>A</th>
      <td>0.08</td>
      <td>2</td>
      <td>25</td>
    </tr>
    <tr>
      <th>B</th>
      <td>0.07</td>
      <td>354</td>
      <td>5014</td>
    </tr>
    <tr>
      <th>C</th>
      <td>0.08</td>
      <td>1353</td>
      <td>15921</td>
    </tr>
    <tr>
      <th>D</th>
      <td>0.06</td>
      <td>21</td>
      <td>349</td>
    </tr>
    <tr>
      <th>E</th>
      <td>0.09</td>
      <td>2</td>
      <td>22</td>
    </tr>
  </tbody>
</table>
</div>




**Вывод:** 
- Для группы А и Е недостаточно данных относительно других рейтингов 
- Для группы B, C увеличивается непогашенных задолжностей на 1%
- Для группы D уменьшается на 2%
Гипотеза зависимость между уровнем дохода и возвратом кредита в срок частично не потверждается.


```python
# Код ревьюера

# Делим на равнозначные группы
data['total_income_category2'] = pd.qcut(data['total_income'], q=4, labels=['Низкий', 'Ниже среднего', 'Средний', 'Высокий'])

# Выводим сводную
display(data.groupby('total_income_category2')['debt'].agg(['count', 'sum', 'mean'])\
        .sort_values(by = 'mean', ascending = False))
```


<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>count</th>
      <th>sum</th>
      <th>mean</th>
    </tr>
    <tr>
      <th>total_income_category2</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ниже среднего</th>
      <td>5450</td>
      <td>480</td>
      <td>0.088073</td>
    </tr>
    <tr>
      <th>Средний</th>
      <td>5216</td>
      <td>444</td>
      <td>0.085123</td>
    </tr>
    <tr>
      <th>Низкий</th>
      <td>5333</td>
      <td>427</td>
      <td>0.080068</td>
    </tr>
    <tr>
      <th>Высокий</th>
      <td>5332</td>
      <td>381</td>
      <td>0.071455</td>
    </tr>
  </tbody>
</table>
</div>


#### 3.4 Как разные цели кредита влияют на его возврат в срок?


```python
data.groupby(['purpose_category']).agg({'debt':['mean','sum','count']}).round(2)# Ваш код будет здесь. Вы можете создавать новые ячейки.
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="3" halign="left">debt</th>
    </tr>
    <tr>
      <th></th>
      <th>mean</th>
      <th>sum</th>
      <th>count</th>
    </tr>
    <tr>
      <th>purpose_category</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>операции с автомобилем</th>
      <td>0.09</td>
      <td>400</td>
      <td>4279</td>
    </tr>
    <tr>
      <th>операции с недвижимостью</th>
      <td>0.07</td>
      <td>780</td>
      <td>10751</td>
    </tr>
    <tr>
      <th>получение образования</th>
      <td>0.09</td>
      <td>369</td>
      <td>3988</td>
    </tr>
    <tr>
      <th>проведение свадьбы</th>
      <td>0.08</td>
      <td>183</td>
      <td>2313</td>
    </tr>
  </tbody>
</table>
</div>



**Вывод:** 
Операции с недвижимостью чаще возвращают в срок, чем операции с автомобилем	и получение образования на 2%, а 
проведение свадьбы на 1%



#### 3.5 Приведите возможные причины появления пропусков в исходных данных.

*Ответ:* 
- Некорректно заполненные данные 
- Ошибки в выгрузке данных
- Некоррентная зависимость от других значений таблицы(безработные и пенсионеры)



#### 3.6 Объясните, почему заполнить пропуски медианным значением — лучшее решение для количественных переменных.

*Ответ:* 
Если в данных есть аномалии или разница между максимальным(минимальным) и средним значением большая, они будут искажать реальные данные, простой пример средняя температура по больнице.


### Шаг 4: общий вывод.

#### Предобрабока данных 
Заполнили пропуски в total_income медианным значением, не трогали days_employed из за недостатка данных.
#### Исследование данных
Результатом исследования было проверка гипотез, которые будут учитываться в составление кредитного скоринга 
##### Есть ли зависимость между количеством детей и возвратом кредита в срок?
    Гипотеза потвердилась частично. Зависимость есть при увеличении количества детей, 
    
    - Средняя задолжность увеличивается на 1%, 
    - При 3+ на 9%
##### Есть ли зависимость между семейным положением и возвратом кредита в срок?
    Сформировали заемщиков по семейному статусу(находится в браке)
    
    - Количество задолжностей не в браке 24%
    - Количество задолжностей в браке 17% 
    
    Гипотеза потвердилась, семейный статус влияет на возврат долга
##### Есть ли зависимость между уровнем дохода и возвратом кредита в срок?
     
     Гипотеза частично не потвердилась, разница для разных рейтингов дохода около 1%
     
##### Как разные цели кредита влияют на его возврат в срок?
        
     Категории с наибольшей долей задолженности
     - операции с автомобилем и образование (по 9%), в то время как 
     - недвижимость и свадьба возвращаются более своевременно (7.3% и 7.9%).

**В общем, можно сказать что наибольший вклад в задолжность оказывают семейный статус, количества детей больше 3 и цели кредита.**


