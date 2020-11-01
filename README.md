# aplikacja-testujaca

### Pobranie całej aplikacji:
``` git clone --recursive https://github.com/aplikacje-internetowe-l2/aplikacja-testujaca.git ```

### Wejście do folderu:
``` cd aplikacja-testujaca ```

### Zaktualizowanie submodule do main'a
``` git submodule update ```

Nie da się tego bardziej zautomatyzować, wynika to ze specyfikacji gita opisanej [tutaj](https://stackoverflow.com/questions/18770545/why-is-my-git-submodule-head-detached-from-master/55570998#55570998)


### Uruchomienie aplikacji:
``` docker-compose up -d --build```
parametry sprawiają że aplikacja będzie postawiona od zera i nie będzie wykorzystywać starych komponentów

### Posprzątanie 
```docker-compose down -v --rmi all --remove-orphans```


### Korzystanie z aplikacji:
Należy wejść na adres http://127.0.0.1:8082
