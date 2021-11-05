# GitHub list commits API

This project shows list of all commits for given GitHub url. Can be run as a script with output as a .json file or works as api with output through HTTP.

README.md for this project is also accesable on:
```http://localhost:5000/```
after install.

## Setup:

### Script version
To run script version use findgitcommits_to_file.sh in Scripts folder. Script will perform clone git of given url, make list of all commits. Output will be saved into .json file with unique UUID name. At the end git repository will be removed from hard disk.

Usage:
Use scripts with 2 arguments, branch name and given GitHub url.

Example:
```bash
./findgitcommits_to_file.sh master https://github.com/codacy/codacy-orbs
```
Warning, can be needed to add executable permissions for file.
```bash
chmod +x ./findgitcommits_to_file.sh
```

After script make all steps you will receive .json file with random UUID name containing list of all commits for given url.

### API version
To run api version we will use docker-compose to build, pull and run all necessary components. Project contains 3 apps:
* ist_commits_api
* [prometheus](https://github.com/prometheus/prometheus)
* [grafana](https://github.com/grafana/grafana)

list_commits_api application is written in python/flask and it uses modified scrips from above, but with difference that it doesnt save .json file but serve it as response for HTTP request. This application additionally will serve metrics for prometheus.

prometheus is open source application which will collect metrics from list_commits_api. Application is configured as code. No need to interact.

grafana is open source application which will show dashboard from collected informations by prometheus. Application is configured as code. No need to interact. For administration purposes i left default login and password: admin:admin

To setup:
```bash
./runme.sh
```
Warning, can be needed to add executable permissions for file.
```bash
chmod +x ./runme.sh
```

or:
```bash
docker-compose build
docker-compose -p "jakub_s_SRE_Challenge" up -d
```

Usage:
To use api we have to provide url on our favourite browser with given url argument. 
```http://localhost:5000/api/?url="GitHub url"```
For example:
```http://localhost:5000/api/?url=https://github.com/codacy/codacy-orbs```

or use curl in terminal
```bash
curl http://localhost:5000/api/?url=https://github.com/codacy/codacy-orbs
```

Application use the same methodology as scripts from above to obtain list of commits.

Metrics:
To see metrics we have to use Grafana Dashboard that is accessible on:
```http://localhost:3000/```
Dashboard will show us "Average response time" for last 30 min.
There is possibility to add new panels or alerts as you prefer, to access admin page use default login and password: admin:admin

There is still an available dashboard for prometheus if there is any need to change configuration or add additional sources to gather metrics from.
```http://localhost:9090/```

## Feedback 
Any questions or suggestions?
You are welcome to discuss it on email: jakubsarosiek@hotmail.com