## intersystems-objectscript-template
This is a template for PythonGateway - InterSystems ObjectScript Github repository.

The template goes also with a few files which let you immediately compile your InterSystems ObjectScript files in InterSystems IRIS Community Edition (Advanced Analytics including IntegratedML) in a docker container.

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/intersystems-community/PythonGateway-Template.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Open IRIS terminal:

```
$ docker-compose exec iris iris session iris
PYTHON>write ##class(PackageSample.ObjectScript).Test()
```
## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.
![docker_compose](https://user-images.githubusercontent.com/2781759/76656929-0f2e5700-6547-11ea-9cc9-486a5641c51d.gif)

Feel free to delete PackageSample folder and place your ObjectScript classes in a form
/src/Package/Classname.cls
[Read more about folder setup for InterSystems ObjectScript](https://community.intersystems.com/post/simplified-objectscript-source-folder-structure-package-manager)

The script in Installer.cls will import everything you place under /src into IRIS.

Use [csvgen](https://community.intersystems.com/post/import-csv-programmatically-file-or-url-using-csvgen) to load the data from CSV.


## What's inside the repository

## Content

### PythonGateway


Python Gateway for InterSystems Data Platforms. Execute Python code and more from InterSystems IRIS. This projects brings you the power of Python right into your InterSystems IRIS environment:
- Execute arbitrary Python code
- Seamlessly transfer data from InterSystems IRIS into Python
- Build intelligent Interoperability business processes with Python Interoperability Adapter
- Save, examine, modify and restore Python context from InterSystems IRIS

[Readme](https://github.com/intersystems-community/PythonGateway). [Articles](https://community.intersystems.com/post/python-gateway-part-i-introduction).


### PythonGatewaySamples / MLToolkit Experience Lab

Examples of PythonGateway usage. [Readme](https://github.com/intersystems-community/PythonGatewaySamples/). 
If you're just starting follow the tutorial at:

```
http://localhost:52773/csp/user/index.html
```

Where `52773` is a container web port. 

## DevOps

### Dockerfile

The simplest dockerfile which starts IRIS and imports Installer.cls and then runs the Installer.setup method, which creates IRISAPP Namespace and imports ObjectScript code from /src folder into it.
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.
Use .env/ file to adjust the dockerfile being used in docker-compose.

### .vscode/settings.json

Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

### .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript

[Read about all the files in this artilce](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris)
