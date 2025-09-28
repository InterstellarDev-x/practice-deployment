rn the db first 

docker netwok create user_network


docker run -d -p 5432:5432  -e POSTGRES_PASSWORD=mysecretpassword postgres

docker run -d   --network user_network   --name some-postgres   -e POSTGRES_PASSWORD=mysecretpassword postgres


docker build -t practice:1 .