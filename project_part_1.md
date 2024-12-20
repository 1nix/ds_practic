# Яндекс Музыка

Сравнение Москвы и Петербурга окружено мифами. Например:
 * Москва — мегаполис, подчинённый жёсткому ритму рабочей недели;
 * Петербург — культурная столица, со своими вкусами.

На данных Яндекс Музыки вы сравните поведение пользователей двух столиц.

**Цель исследования** — проверьте три гипотезы:
1. Активность пользователей зависит от дня недели. Причём в Москве и Петербурге это проявляется по-разному.
2. В понедельник утром в Москве преобладают одни жанры, а в Петербурге — другие. Так же и вечером пятницы преобладают разные жанры — в зависимости от города.
3. Москва и Петербург предпочитают разные жанры музыки. В Москве чаще слушают поп-музыку, в Петербурге — русский рэп.

**Ход исследования**

Данные о поведении пользователей вы получите из файла `yandex_music_project.csv`. О качестве данных ничего не известно. Поэтому перед проверкой гипотез понадобится обзор данных.

Вы проверите данные на ошибки и оцените их влияние на исследование. Затем, на этапе предобработки вы поищете возможность исправить самые критичные ошибки данных.

Таким образом, исследование пройдёт в три этапа:
 1. Обзор данных.
 2. Предобработка данных.
 3. Проверка гипотез.



## Обзор данных

Составьте первое представление о данных Яндекс Музыки.




**Задание 1**


```python
import pandas as pd # импорт библиотеки pandas
```

**Задание 2**


```python
df = pd.read_csv('/datasets/yandex_music_project.csv') # чтение файла с данными и сохранение в df
```

**Задание 3**


```python
df.head(10)# получение первых 10 строк таблицы df
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
      <th>userID</th>
      <th>Track</th>
      <th>artist</th>
      <th>genre</th>
      <th>City</th>
      <th>time</th>
      <th>Day</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>FFB692EC</td>
      <td>Kamigata To Boots</td>
      <td>The Mass Missile</td>
      <td>rock</td>
      <td>Saint-Petersburg</td>
      <td>20:28:33</td>
      <td>Wednesday</td>
    </tr>
    <tr>
      <th>1</th>
      <td>55204538</td>
      <td>Delayed Because of Accident</td>
      <td>Andreas Rönnberg</td>
      <td>rock</td>
      <td>Moscow</td>
      <td>14:07:09</td>
      <td>Friday</td>
    </tr>
    <tr>
      <th>2</th>
      <td>20EC38</td>
      <td>Funiculì funiculà</td>
      <td>Mario Lanza</td>
      <td>pop</td>
      <td>Saint-Petersburg</td>
      <td>20:58:07</td>
      <td>Wednesday</td>
    </tr>
    <tr>
      <th>3</th>
      <td>A3DD03C9</td>
      <td>Dragons in the Sunset</td>
      <td>Fire + Ice</td>
      <td>folk</td>
      <td>Saint-Petersburg</td>
      <td>08:37:09</td>
      <td>Monday</td>
    </tr>
    <tr>
      <th>4</th>
      <td>E2DC1FAE</td>
      <td>Soul People</td>
      <td>Space Echo</td>
      <td>dance</td>
      <td>Moscow</td>
      <td>08:34:34</td>
      <td>Monday</td>
    </tr>
    <tr>
      <th>5</th>
      <td>842029A1</td>
      <td>Преданная</td>
      <td>IMPERVTOR</td>
      <td>rusrap</td>
      <td>Saint-Petersburg</td>
      <td>13:09:41</td>
      <td>Friday</td>
    </tr>
    <tr>
      <th>6</th>
      <td>4CB90AA5</td>
      <td>True</td>
      <td>Roman Messer</td>
      <td>dance</td>
      <td>Moscow</td>
      <td>13:00:07</td>
      <td>Wednesday</td>
    </tr>
    <tr>
      <th>7</th>
      <td>F03E1C1F</td>
      <td>Feeling This Way</td>
      <td>Polina Griffith</td>
      <td>dance</td>
      <td>Moscow</td>
      <td>20:47:49</td>
      <td>Wednesday</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8FA1D3BE</td>
      <td>И вновь продолжается бой</td>
      <td>NaN</td>
      <td>ruspop</td>
      <td>Moscow</td>
      <td>09:17:40</td>
      <td>Friday</td>
    </tr>
    <tr>
      <th>9</th>
      <td>E772D5C0</td>
      <td>Pessimist</td>
      <td>NaN</td>
      <td>dance</td>
      <td>Saint-Petersburg</td>
      <td>21:20:49</td>
      <td>Wednesday</td>
    </tr>
  </tbody>
</table>
</div>



**Задание 4**


```python
df.info()# получение общей информации о данных в таблице df
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 65079 entries, 0 to 65078
    Data columns (total 7 columns):
     #   Column    Non-Null Count  Dtype 
    ---  ------    --------------  ----- 
     0     userID  65079 non-null  object
     1   Track     63848 non-null  object
     2   artist    57876 non-null  object
     3   genre     63881 non-null  object
     4     City    65079 non-null  object
     5   time      65079 non-null  object
     6   Day       65079 non-null  object
    dtypes: object(7)
    memory usage: 3.5+ MB


Количество значений в столбцах различается. Значит, в данных есть пропущенные значения.

**Задание 5**


```python
df.isna().sum()# Напишите ваш ответ здесь комментарием. Не удаляйте символ #. Не меняйте тип этой ячейки на Markdown.
# Количество пропущенных ячеек, большое количество в исполнителях, это надо проверить 
```




      userID       0
    Track       1231
    artist      7203
    genre       1198
      City         0
    time           0
    Day            0
    dtype: int64



**Выводы**

В каждой строке таблицы — данные о прослушанном треке. Часть колонок описывает саму композицию: название, исполнителя и жанр. Остальные данные рассказывают о пользователе: из какого он города, когда он слушал музыку.

Предварительно можно утверждать, что данных достаточно для проверки гипотез. Но встречаются пропуски в данных, а в названиях колонок — расхождения с хорошим стилем.

Чтобы двигаться дальше, нужно устранить проблемы в данных.

## Предобработка данных

### Переименование столбцов

**Задание 6**


```python
df.columns# перечень названий столбцов таблицы df
#Некорректные столбцы, приводм  к единому виду
```




    Index(['  userID', 'Track', 'artist', 'genre', '  City  ', 'time', 'Day'], dtype='object')



**Задание 7**


```python
df=df.rename(columns = {'  userID':'userID','Track':'track','  City  ':'city','Day':'day'})
# переименование столбцов
```

**Задание 8**


```python
df.columns# проверка результатов - перечень названий столбцов
```




    Index(['userID', 'track', 'artist', 'genre', 'city', 'time', 'day'], dtype='object')



### Обработка пропущенных значений

**Задание 9**


```python
df.isna().sum()# подсчёт пропусков
```




    userID       0
    track     1231
    artist    7203
    genre     1198
    city         0
    time         0
    day          0
    dtype: int64



**Задание 10**


```python
columns_to_replace = ['track','artist','genre']
for cl in columns_to_replace:
    df[cl] = df[cl].fillna('unknown')# замена пропущенных значений на 'unknown'
```

**Задание 11**


```python
df.isna().sum()# проверка на отсутствие пропусков
```




    userID    0
    track     0
    artist    0
    genre     0
    city      0
    time      0
    day       0
    dtype: int64



### Обработка дубликатов

**Задание 12**


```python
df.duplicated().sum()# подсчёт явных дубликатов
```




    3826



**Задание 13**


```python
df = df.drop_duplicates().reset_index(drop = True)# удаление явных дубликатов, создание новых индексов и удаление старых
```

**Задание 14**


```python
df.duplicated().sum()# проверка на отсутствие явных дубликатов
```




    0



**Задание 15**


```python
sorted(df['genre'].unique())# просмотр уникальных отсортированных названий жанров
```




    ['acid',
     'acoustic',
     'action',
     'adult',
     'africa',
     'afrikaans',
     'alternative',
     'alternativepunk',
     'ambient',
     'americana',
     'animated',
     'anime',
     'arabesk',
     'arabic',
     'arena',
     'argentinetango',
     'art',
     'audiobook',
     'author',
     'avantgarde',
     'axé',
     'baile',
     'balkan',
     'beats',
     'bigroom',
     'black',
     'bluegrass',
     'blues',
     'bollywood',
     'bossa',
     'brazilian',
     'breakbeat',
     'breaks',
     'broadway',
     'cantautori',
     'cantopop',
     'canzone',
     'caribbean',
     'caucasian',
     'celtic',
     'chamber',
     'chanson',
     'children',
     'chill',
     'chinese',
     'choral',
     'christian',
     'christmas',
     'classical',
     'classicmetal',
     'club',
     'colombian',
     'comedy',
     'conjazz',
     'contemporary',
     'country',
     'cuban',
     'dance',
     'dancehall',
     'dancepop',
     'dark',
     'death',
     'deep',
     'deutschrock',
     'deutschspr',
     'dirty',
     'disco',
     'dnb',
     'documentary',
     'downbeat',
     'downtempo',
     'drum',
     'dub',
     'dubstep',
     'eastern',
     'easy',
     'electronic',
     'electropop',
     'emo',
     'entehno',
     'epicmetal',
     'estrada',
     'ethnic',
     'eurofolk',
     'european',
     'experimental',
     'extrememetal',
     'fado',
     'fairytail',
     'film',
     'fitness',
     'flamenco',
     'folk',
     'folklore',
     'folkmetal',
     'folkrock',
     'folktronica',
     'forró',
     'frankreich',
     'französisch',
     'french',
     'funk',
     'future',
     'gangsta',
     'garage',
     'german',
     'ghazal',
     'gitarre',
     'glitch',
     'gospel',
     'gothic',
     'grime',
     'grunge',
     'gypsy',
     'handsup',
     "hard'n'heavy",
     'hardcore',
     'hardstyle',
     'hardtechno',
     'hip',
     'hip-hop',
     'hiphop',
     'historisch',
     'holiday',
     'hop',
     'horror',
     'house',
     'hymn',
     'idm',
     'independent',
     'indian',
     'indie',
     'indipop',
     'industrial',
     'inspirational',
     'instrumental',
     'international',
     'irish',
     'jam',
     'japanese',
     'jazz',
     'jewish',
     'jpop',
     'jungle',
     'k-pop',
     'karadeniz',
     'karaoke',
     'kayokyoku',
     'korean',
     'laiko',
     'latin',
     'latino',
     'leftfield',
     'local',
     'lounge',
     'loungeelectronic',
     'lovers',
     'malaysian',
     'mandopop',
     'marschmusik',
     'meditative',
     'mediterranean',
     'melodic',
     'metal',
     'metalcore',
     'mexican',
     'middle',
     'minimal',
     'miscellaneous',
     'modern',
     'mood',
     'mpb',
     'muslim',
     'native',
     'neoklassik',
     'neue',
     'new',
     'newage',
     'newwave',
     'nu',
     'nujazz',
     'numetal',
     'oceania',
     'old',
     'opera',
     'orchestral',
     'other',
     'piano',
     'podcasts',
     'pop',
     'popdance',
     'popelectronic',
     'popeurodance',
     'poprussian',
     'post',
     'posthardcore',
     'postrock',
     'power',
     'progmetal',
     'progressive',
     'psychedelic',
     'punjabi',
     'punk',
     'quebecois',
     'ragga',
     'ram',
     'rancheras',
     'rap',
     'rave',
     'reggae',
     'reggaeton',
     'regional',
     'relax',
     'religious',
     'retro',
     'rhythm',
     'rnb',
     'rnr',
     'rock',
     'rockabilly',
     'rockalternative',
     'rockindie',
     'rockother',
     'romance',
     'roots',
     'ruspop',
     'rusrap',
     'rusrock',
     'russian',
     'salsa',
     'samba',
     'scenic',
     'schlager',
     'self',
     'sertanejo',
     'shanson',
     'shoegazing',
     'showtunes',
     'singer',
     'ska',
     'skarock',
     'slow',
     'smooth',
     'soft',
     'soul',
     'soulful',
     'sound',
     'soundtrack',
     'southern',
     'specialty',
     'speech',
     'spiritual',
     'sport',
     'stonerrock',
     'surf',
     'swing',
     'synthpop',
     'synthrock',
     'sängerportrait',
     'tango',
     'tanzorchester',
     'taraftar',
     'tatar',
     'tech',
     'techno',
     'teen',
     'thrash',
     'top',
     'traditional',
     'tradjazz',
     'trance',
     'tribal',
     'trip',
     'triphop',
     'tropical',
     'türk',
     'türkçe',
     'ukrrock',
     'unknown',
     'urban',
     'uzbek',
     'variété',
     'vi',
     'videogame',
     'vocal',
     'western',
     'world',
     'worldbeat',
     'ïîï',
     'электроника']



**Задание 16**


```python
df['genre'] = df['genre'].replace('электроника', 'electronic')
df['genre'] = df['genre'].replace('hiphop', 'hip-hop')# устранение неявных дубликатов
```

**Задание 17**


```python
sorted(df['genre'].unique())# проверка на отсутствие неявных дубликатов
```




    ['acid',
     'acoustic',
     'action',
     'adult',
     'africa',
     'afrikaans',
     'alternative',
     'alternativepunk',
     'ambient',
     'americana',
     'animated',
     'anime',
     'arabesk',
     'arabic',
     'arena',
     'argentinetango',
     'art',
     'audiobook',
     'author',
     'avantgarde',
     'axé',
     'baile',
     'balkan',
     'beats',
     'bigroom',
     'black',
     'bluegrass',
     'blues',
     'bollywood',
     'bossa',
     'brazilian',
     'breakbeat',
     'breaks',
     'broadway',
     'cantautori',
     'cantopop',
     'canzone',
     'caribbean',
     'caucasian',
     'celtic',
     'chamber',
     'chanson',
     'children',
     'chill',
     'chinese',
     'choral',
     'christian',
     'christmas',
     'classical',
     'classicmetal',
     'club',
     'colombian',
     'comedy',
     'conjazz',
     'contemporary',
     'country',
     'cuban',
     'dance',
     'dancehall',
     'dancepop',
     'dark',
     'death',
     'deep',
     'deutschrock',
     'deutschspr',
     'dirty',
     'disco',
     'dnb',
     'documentary',
     'downbeat',
     'downtempo',
     'drum',
     'dub',
     'dubstep',
     'eastern',
     'easy',
     'electronic',
     'electropop',
     'emo',
     'entehno',
     'epicmetal',
     'estrada',
     'ethnic',
     'eurofolk',
     'european',
     'experimental',
     'extrememetal',
     'fado',
     'fairytail',
     'film',
     'fitness',
     'flamenco',
     'folk',
     'folklore',
     'folkmetal',
     'folkrock',
     'folktronica',
     'forró',
     'frankreich',
     'französisch',
     'french',
     'funk',
     'future',
     'gangsta',
     'garage',
     'german',
     'ghazal',
     'gitarre',
     'glitch',
     'gospel',
     'gothic',
     'grime',
     'grunge',
     'gypsy',
     'handsup',
     "hard'n'heavy",
     'hardcore',
     'hardstyle',
     'hardtechno',
     'hip',
     'hip-hop',
     'historisch',
     'holiday',
     'hop',
     'horror',
     'house',
     'hymn',
     'idm',
     'independent',
     'indian',
     'indie',
     'indipop',
     'industrial',
     'inspirational',
     'instrumental',
     'international',
     'irish',
     'jam',
     'japanese',
     'jazz',
     'jewish',
     'jpop',
     'jungle',
     'k-pop',
     'karadeniz',
     'karaoke',
     'kayokyoku',
     'korean',
     'laiko',
     'latin',
     'latino',
     'leftfield',
     'local',
     'lounge',
     'loungeelectronic',
     'lovers',
     'malaysian',
     'mandopop',
     'marschmusik',
     'meditative',
     'mediterranean',
     'melodic',
     'metal',
     'metalcore',
     'mexican',
     'middle',
     'minimal',
     'miscellaneous',
     'modern',
     'mood',
     'mpb',
     'muslim',
     'native',
     'neoklassik',
     'neue',
     'new',
     'newage',
     'newwave',
     'nu',
     'nujazz',
     'numetal',
     'oceania',
     'old',
     'opera',
     'orchestral',
     'other',
     'piano',
     'podcasts',
     'pop',
     'popdance',
     'popelectronic',
     'popeurodance',
     'poprussian',
     'post',
     'posthardcore',
     'postrock',
     'power',
     'progmetal',
     'progressive',
     'psychedelic',
     'punjabi',
     'punk',
     'quebecois',
     'ragga',
     'ram',
     'rancheras',
     'rap',
     'rave',
     'reggae',
     'reggaeton',
     'regional',
     'relax',
     'religious',
     'retro',
     'rhythm',
     'rnb',
     'rnr',
     'rock',
     'rockabilly',
     'rockalternative',
     'rockindie',
     'rockother',
     'romance',
     'roots',
     'ruspop',
     'rusrap',
     'rusrock',
     'russian',
     'salsa',
     'samba',
     'scenic',
     'schlager',
     'self',
     'sertanejo',
     'shanson',
     'shoegazing',
     'showtunes',
     'singer',
     'ska',
     'skarock',
     'slow',
     'smooth',
     'soft',
     'soul',
     'soulful',
     'sound',
     'soundtrack',
     'southern',
     'specialty',
     'speech',
     'spiritual',
     'sport',
     'stonerrock',
     'surf',
     'swing',
     'synthpop',
     'synthrock',
     'sängerportrait',
     'tango',
     'tanzorchester',
     'taraftar',
     'tatar',
     'tech',
     'techno',
     'teen',
     'thrash',
     'top',
     'traditional',
     'tradjazz',
     'trance',
     'tribal',
     'trip',
     'triphop',
     'tropical',
     'türk',
     'türkçe',
     'ukrrock',
     'unknown',
     'urban',
     'uzbek',
     'variété',
     'vi',
     'videogame',
     'vocal',
     'western',
     'world',
     'worldbeat',
     'ïîï']



**Выводы**

Предобработка обнаружила три проблемы в данных:

- нарушения в стиле заголовков,
- пропущенные значения,
- дубликаты — явные и неявные.

Вы исправили заголовки, чтобы упростить работу с таблицей. Без дубликатов исследование станет более точным.

Пропущенные значения вы заменили на `'unknown'`. Ещё предстоит увидеть, не повредят ли исследованию пропуски в колонке `genre`.

Теперь можно перейти к проверке гипотез.

## Проверка гипотез

### Сравнение поведения пользователей двух столиц

Первая гипотеза утверждает, что пользователи по-разному слушают музыку в Москве и Санкт-Петербурге. Проверим это предположение по данным о трёх днях недели — понедельнике, среде и пятнице. Для этого:

* Разделим пользователей Москвы и Санкт-Петербурга.
* Сравним, сколько треков послушала каждая группа пользователей в понедельник, среду и пятницу.


**Задание 18**




```python
city_count = df.groupby('city').count()# подсчёт прослушиваний в каждом городе
city_count
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
      <th>userID</th>
      <th>track</th>
      <th>artist</th>
      <th>genre</th>
      <th>time</th>
      <th>day</th>
    </tr>
    <tr>
      <th>city</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Moscow</th>
      <td>42741</td>
      <td>42741</td>
      <td>42741</td>
      <td>42741</td>
      <td>42741</td>
      <td>42741</td>
    </tr>
    <tr>
      <th>Saint-Petersburg</th>
      <td>18512</td>
      <td>18512</td>
      <td>18512</td>
      <td>18512</td>
      <td>18512</td>
      <td>18512</td>
    </tr>
  </tbody>
</table>
</div>



**Задание 19**



```python
#moscow_group = df[df['city'] == 'Moscow']
#moscow_group_monday_count =  df[df['day'] == 'Monday']['track'].count()
#moscow_group_wednesday_count =  df[df['day'] == 'Wednesday']['track'].count()
#moscow_group_friday_count =  df[df['day'] == 'Friday']['track'].count()
#allgroup_moscow = [moscow_group_monday_count,moscow_group_wednesday_count,moscow_group_friday_count]


def count_days (city, day):
    items = []
    group = df[df['city'] == city]
    items.append(group[group['day'] == day[0]]['track'].count())
    items.append(group[group['day'] == day[1]]['track'].count())
    items.append(group[group['day'] == day[2]]['track'].count())
    return items

day = ['Monday','Wednesday','Friday']

moscow_count = count_days('Moscow',day)
spb_count = count_days('Saint-Petersburg',day)
print(moscow_count)
print()
print(spb_count)
# подсчёт прослушиваний в каждый из трёх дней
```

    [15740, 11056, 15945]
    
    [5614, 7003, 5895]


**Задание 20**


```python
def number_tracks(day, city):
    track_list = df[df['day'] == day]# выберите только строки df со значением переменной day в столбце day
    track_list = track_list[track_list['city'] == city]# выберите только строки track_list со значением переменной city в столбце city
    track_list_count = track_list['userID'].count()# вызовите метод подсчета строк для track_list и выберите столбец user_id
    return track_list_count# верните значение track_list_count из функции
```




    15740



**Задание 21**


```python
number_tracks('Monday','Moscow')# количество прослушиваний в Москве по понедельникам
```




    15740




```python
number_tracks ('Monday','Saint-Petersburg')# количество прослушиваний в Санкт-Петербурге по понедельникам
```




    5614




```python
number_tracks ('Wednesday','Moscow')# количество прослушиваний в Москве по средам
```




    11056




```python
number_tracks ('Wednesday','Saint-Petersburg')# количество прослушиваний в Санкт-Петербурге по средам
```




    7003




```python
number_tracks ('Friday','Moscow')# количество прослушиваний в Москве по пятницам
```




    15945




```python
number_tracks ('Friday','Saint-Petersburg')# количество прослушиваний в Санкт-Петербурге по пятницам
```




    5895



**Задание 22**


```python
count_of_listening = {'Moscow': moscow_count,'Saint-Petersburg': spb_count}
count_of_listening = pd.DataFrame(data = count_of_listening, index=['Monday','Wednesday','Friday'])
count_of_listening
# создание таблицы с результатами
# вывод таблицы на экран
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
      <th>Moscow</th>
      <th>Saint-Petersburg</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Monday</th>
      <td>15740</td>
      <td>5614</td>
    </tr>
    <tr>
      <th>Wednesday</th>
      <td>11056</td>
      <td>7003</td>
    </tr>
    <tr>
      <th>Friday</th>
      <td>15945</td>
      <td>5895</td>
    </tr>
  </tbody>
</table>
</div>



**Выводы**

Данные показывают разницу поведения пользователей:

- В Москве пик прослушиваний приходится на понедельник и пятницу, а в среду заметен спад.
- В Петербурге, наоборот, больше слушают музыку по средам. Активность в понедельник и пятницу здесь почти в равной мере уступает среде.

Значит, данные говорят в пользу первой гипотезы.

### Музыка в начале и в конце недели

Согласно второй гипотезе, утром в понедельник в Москве преобладают одни жанры, а в Петербурге — другие. Так же и вечером пятницы преобладают разные жанры — в зависимости от города.

**Задание 23**


```python
moscow_general = df[df['city'] == 'Moscow']# получение таблицы moscow_general из тех строк таблицы df, для которых значение в столбце 'city' равно 'Moscow'

```


```python
spb_general = df[df['city'] == 'Saint-Petersburg'] # получение таблицы spb_general из тех строк таблицы df, для которых значение в столбце 'city' равно 'Saint-Petersburg'

```

**Задание 24**


```python
def genre_weekday(df, day, time1, time2):
    # последовательная фильтрация
    # оставляем в genre_df только те строки df, у которых день равен day
    genre_df = df[df['day'] == day]# ваш код здесь
    # оставляем в genre_df только те строки genre_df, у которых время меньше time2
    genre_df = genre_df[genre_df['time'] <= time2]# ваш код здесь
    # оставляем в genre_df только те строки genre_df, у которых время больше time1
    genre_df = genre_df[genre_df['time'] >= time1]# ваш код здесь
    # сгруппируем отфильтрованный датафрейм по столбцу с названиями жанров, возьмём столбец genre и посчитаем кол-во строк для каждого жанра методом count()
    genre_df_grouped = genre_df.groupby('genre')['genre'].count()# ваш код здесь
    # отсортируем результат по убыванию (чтобы в начале Series оказались самые популярные жанры)
    genre_df_sorted = genre_df_grouped.sort_values(ascending=False)# ваш код здесь
    # вернём Series с 10 самыми популярными жанрами в указанный отрезок времени заданного дня
    return genre_df_sorted[:10]
```

**Задание 25**


```python
genre_weekday(moscow_general, 'Monday', '06:00:00', '12:00:00')# вызов функции для утра понедельника в Москве (вместо df — таблица moscow_general)
```




    genre
    pop            781
    dance          549
    electronic     480
    rock           474
    hip            281
    ruspop         186
    world          181
    rusrap         175
    alternative    164
    unknown        161
    Name: genre, dtype: int64




```python
genre_weekday(spb_general, 'Monday', '06:00:00', '12:00:00')# вызов функции для утра понедельника в Петербурге (вместо df — таблица spb_general)
```




    genre
    pop            218
    dance          182
    rock           162
    electronic     147
    hip             79
    ruspop          64
    alternative     58
    rusrap          55
    jazz            44
    classical       40
    Name: genre, dtype: int64




```python
genre_weekday(moscow_general, 'Monday', '18:00:00', '24:00:00')# вызов функции для вечера пятницы в Москве
```




    genre
    pop            717
    dance          524
    rock           518
    electronic     485
    hip            231
    alternative    182
    world          172
    classical      172
    ruspop         149
    rusrap         133
    Name: genre, dtype: int64




```python
genre_weekday(spb_general, 'Monday', '18:00:00', '24:00:00')# вызов функции для вечера пятницы в Петербурге
```




    genre
    pop            263
    rock           208
    electronic     192
    dance          191
    hip            100
    alternative     72
    classical       71
    jazz            57
    rusrap          54
    ruspop          53
    Name: genre, dtype: int64



**Выводы**

Если сравнить топ-10 жанров в понедельник утром, можно сделать такие выводы:

1. В Москве и Петербурге слушают похожую музыку. Единственное различие — в московский рейтинг вошёл жанр “world”, а в петербургский — джаз и классика.

2. В Москве пропущенных значений оказалось так много, что значение `'unknown'` заняло десятое место среди самых популярных жанров. Значит, пропущенные значения занимают существенную долю в данных и угрожают достоверности исследования.

Вечер пятницы не меняет эту картину. Некоторые жанры поднимаются немного выше, другие спускаются, но в целом топ-10 остаётся тем же самым.

Таким образом, вторая гипотеза подтвердилась лишь частично:
* Пользователи слушают похожую музыку в начале недели и в конце.
* Разница между Москвой и Петербургом не слишком выражена. В Москве чаще слушают русскую популярную музыку, в Петербурге — джаз.

Однако пропуски в данных ставят под сомнение этот результат. В Москве их так много, что рейтинг топ-10 мог бы выглядеть иначе, если бы не утерянные  данные о жанрах.

### Жанровые предпочтения в Москве и Петербурге

Гипотеза: Петербург — столица рэпа, музыку этого жанра там слушают чаще, чем в Москве.  А Москва — город контрастов, в котором, тем не менее, преобладает поп-музыка.

**Задание 26**


```python
moscow_genres = moscow_general.groupby('genre')['genre'].count()# одной строкой: группировка таблицы moscow_general по столбцу 'genre', выбор столбца `genre`, подсчёт числа значений 'genre' методом count(), сохранение в moscow_genres
moscow_genres = moscow_genres.sort_values(ascending=False)# сортировка получившегося Series в порядке убывания и сохранение обратно в moscow_genres
```

**Задание 27**


```python
moscow_genres[:10]# просмотр первых 10 строк moscow_genres
```




    genre
    pop            5892
    dance          4435
    rock           3965
    electronic     3786
    hip            2041
    classical      1616
    world          1432
    alternative    1379
    ruspop         1372
    rusrap         1161
    Name: genre, dtype: int64



**Задание 28**


```python
spb_genres = spb_general.groupby('genre')['genre'].count()# одной строкой: группировка таблицы spb_general по столбцу 'genre', выбор столбца `genre`, подсчёт числа значений 'genre' методом count(), сохранение в spb_genres
spb_genres = spb_genres.sort_values(ascending=False)# сортировка получившегося Series в порядке убывания и сохранение обратно в spb_genres
```

**Задание 29**


```python
spb_genres[:10]# просмотр первых 10 строк spb_genres
```




    genre
    pop            2431
    dance          1932
    rock           1879
    electronic     1737
    hip             934
    alternative     649
    classical       646
    rusrap          564
    ruspop          538
    world           515
    Name: genre, dtype: int64



**Выводы**

Гипотеза частично подтвердилась:
* Поп-музыка — самый популярный жанр в Москве, как и предполагала гипотеза. Более того, в топ-10 жанров встречается близкий жанр — русская популярная музыка.
* Вопреки ожиданиям, рэп одинаково популярен в Москве и Петербурге.


## Итоги исследования

Вы проверили три гипотезы и установили:

1. День недели по-разному влияет на активность пользователей в Москве и Петербурге.

Первая гипотеза полностью подтвердилась.

2. Музыкальные предпочтения не сильно меняются в течение недели — будь то Москва или Петербург. Небольшие различия заметны в начале недели, по понедельникам:
* в Москве слушают музыку жанра “world”,
* в Петербурге — джаз и классику.

Таким образом, вторая гипотеза подтвердилась лишь отчасти. Этот результат мог оказаться иным, если бы не пропуски в данных.

3. Во вкусах пользователей Москвы и Петербурга больше общего, чем различий. Вопреки ожиданиям, предпочтения жанров в Петербурге напоминают московские.

Третья гипотеза не подтвердилась. Если различия в предпочтениях и существуют, на основной массе пользователей они незаметны.

**На практике исследования содержат проверки статистических гипотез.**
Из части данных одного сервиса невозможно сделать какие-то выводы о всех пользователях сервиса без методов статистики.
Проверки статистических гипотез покажут, насколько они достоверны, исходя из имеющихся данных.
С методами проверок гипотез вы ещё познакомитесь в следующих темах.
