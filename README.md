# Be A Builder - Code Samples
If you've been following along with Be A Builder you have seen some sample code, you can dive into the code implementation here! 

Don't know what Be A Builder is? Follow along here: https://trailhead.salesforce.com/offers/beabuilder

## Installation instructions:

In the commands below, terms wrapped in \*asterisks\* signify places where you'll need to replace the dummy text we're providing with values that match your Salesforce DX setup.

1. Authenticate into your DX hub org (if you haven't already):
	
	```
	sfdx force:auth:web:login -d -a *myhub* 
	```
- Clone the repo:
	
	```
	git clone https://github.com/slychika/Be-A-Builder
	```
- Create a scratch org, and provide it with an alias:
	
	```
	sfdx force:org:create -s -f config/project-scratch-def.json -a *myalias*
	```
- Push the code you cloned from Github to your scratch org:
	
	```
	sfdx force:source:push
	```
- Open the scratch org:
	
	```
	sfdx force:org:open
	```

Or, deploy to SFDX using this button:

[![Deploy](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com/deploy?template=https://github.com/slychika/Be-A-Builder)

## Configuration:

Once you've pushed the source, you can create a Project, upload photos to said Project and see them with the PhotoCarousel (Day 4) as well as keep track of how many Projects have been completed for each Account (Day 7).


## Issues
- There is no code coverage provided

- This is not a representation of the entire project built during Be A Builder, this is just some code samples to help out builders that are less familiar with code.



