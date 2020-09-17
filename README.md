# Code Project Template

This repository is a template for code projects.

Take this template, and add your code. Also add documentaion for configuration management and deployment of your code, including:

- build and deploy instructions
- information on automated tests, and where to find results 
- instructions for how to set up local development

Document this here in your `README.md`, or in individual markdown files in the `docs` folder.

After you create your product's documentation repository from this template, please update the Team and Code sections below to link to the appropriate people and code.

Replace these introductory paragraphs with a description of your product. 

For an example that includes code, releases and issues in progress, see our demo Reading Time web application: https://github.com/department-of-veterans-affairs/reading-time-demo


## Product

- Product Name:
- Product Line Portfolio:

### Team Contacts

- Maintained by: @department-of-veterans-affairs/configuration-management
- Project Manager:
- Technical Team Lead:
- Configuration Manager:



## Configurations for Local Development on your GFE


#### Things You'll Need: 

* JDK 1.7
* JDK 1.8
* Grails 2.4.4
* Apache Maven 3.6.3
* Apache Ant 1.9.15

These can be found on the [Liberty JLV Sharepoint Site](https://libertyits.sharepoint.com/:u:/r/sites/HIM_JLV/Shared%20Documents/Software%20Engineering/Requirements/Software/java.zip?csf=1&web=1&e=iUuhVd) or downloaded directly from their respective websites.

#### Setting Up Your Local Environment

Unzip the file containing all of the configurations to your local C:\ drive - you'll end up with a path **C:\Java**. 

Next, open the **Account Environment Variables** system configuration page by clicking the start menu and typing *Variables* - ensure you've selected the option labeled **Edit Environment Variables For Your Account**, as there will be two options and the other one requires administrative rights. 

The following environment variables will need to be added: 

| Variable | Value | 
| --- | --- | 
| ANT_HOME | C:\java\apache-ant-1.9.15 | 
| GRAILS_HOME | C:\java\grails-2.4.4 | 
| JAVA_HOME | C:\java\jdk1.7.0_80 | 
| MAVEN_HOME | C:\java\apache-maven-3.6.3 | 

Next, the following entries will need to be added to your **Account** Path (This is found in the Environment Variables as well, labeled *PATH*): 

```%JAVA_HOME%\bin```
```%GRAILS_HOME%\bin```
```%GRAILS_HOME%```
```%MAVEN_HOME%\bin```
```%ANT_HOME%\bin```



## Code Description

### Deployment


#### Branching strategy

**UPDATE THIS FOR YOUR PROJECT AND BUILD STRATEGY**

Certain branches are special, and would ordinarily be deployed to various test environments:

- master: our default branch, for production-ready code. Master is always deployable. In our case, however, deployment does not happen automatically.
- pre-prod: code destined for the pre-production test server. This code might be deployed by hand or automatically, depending on the project and availability of a CI/CD solution.
- test: code that would probably autotmatically be pushed to a test or staging server. Again, in our case we don't do this -- but test deployment tasks like this are ideally automated with a CI/CD solution like Jenkins.

New code should be produced on a feature branch [following GitHub flow](https://guides.github.com/introduction/flow/). Most often, you'll want to branch from **master**, since that's the latest in production. File a pull request to merge into **test**, which can be deployed to our testing environment.



### Testing




### Installing



