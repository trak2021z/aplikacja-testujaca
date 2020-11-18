# aplikacja-testujaca

### Pobranie całej aplikacji:
``` git clone https://github.com/aplikacje-internetowe-l2/aplikacja-testujaca.git ```

### Wejście do folderu:
``` cd aplikacja-testujaca ```

### Uruchomienie aplikacji:
``` docker stack deploy -c docker-compose.yaml app_testujaca```
parametry sprawiają że aplikacja będzie postawiona od zera i nie będzie wykorzystywać starych komponentów

### Posprzątanie 
```docker stack rm app_testujaca```

### Korzystanie z aplikacji:
Należy wejść na adres http://127.0.0.1:8082

