1. Polecenie do budowy obrazu: docker build --build-arg VERSION=2.0.5 -t sprawozdanielab5:2.0.5 .
2. Polecenie uruchamiające serwer: docker run -d -p 3000:8081  --name kontenerlab5 -t sprawozdanielab5:2.0.5
3. Poprawne działanie kontenera można sprawdzić za pomocą polecenia: docker ps (wtedy przy statusie kontenera jest napis "healthy"), poprawne funkcjonowanie aplikacji sprawdzamy przez wpisanie adresu http://localhost:3000 w przeglądarce.
