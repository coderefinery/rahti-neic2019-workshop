# OpenShift source-to-image example

This example shows how a regular source code repository can be deployed to
OpenShift with a single command without having to create a Dockerfile or do some
other build related tasks beforehand.

We will deploy the Rahti introduction slides. The GitHub repository that
contains these slides is https://github.com/CSCfi/rahti-public-intro.

## From the web interface

1. Create a new project with the "Create Project" button.
2. Select the new project by clicking its name under "My Projects".
3. Click the blue "Browse Catalog" button.
4. Select "Node.js".
5. Follow the instructions of the wizard that shows up. When it asks for
   "Application Name" and "Git Repository", enter these:
   * Application name: rahti-public-intro
   * Git repository: https://github.com/CSCfi/rahti-public-intro
6. Select the "Overview" tab from the menu on the left to find the application
   deployment and a URL that has been created to point to it.

## From the command line

1. Login to an OpenShift cluster using the `oc login` command. You can find
   instructions in the [Rahti documentation](https://rahti.csc.fi/usage/cli/):

   ```bash
   oc login https://rahti.csc.fi:8443 --token=<token from web interface>
   ```

2. Create a project in which to deploy the Job using `oc new-project`:

   ```bash
   oc new-project <some unique project name>
   ```

3. Deploy the slides to OpenShift:

   ```bash
   oc new-app https://github.com/CSCfi/rahti-public-intro
   ```

4. Create a URL for accessing the slides:

   ```bash
   oc expose service rahti-public-intro
   ```

5. Get the URL that was just created:

   ```bash
   oc get routes
   ```

6. Copy and paste the URL under "HOST/PORT" into your browser and you should see
   the Rahti introduction slides.
