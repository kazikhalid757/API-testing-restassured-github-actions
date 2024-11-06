# API Test CI with CircleCI

This project is set up for continuous integration using CircleCI to build and test an API project written in Java with Rest-Assured. The configuration runs tests on every commit pushed to the main branch.

## Prerequisites

- Java 21
- Maven
- CircleCI account
- Access to the repository (if private)

## Project Structure

```
.
├── src/                 # Source code
├── pom.xml              # Maven build configuration
└── .circleci/
    └── config.yml       # CircleCI configuration file
```

## CI/CD Pipeline Overview

The CircleCI pipeline performs the following steps:
1. **Checkout Code**: Pulls the latest code from the repository.
2. **Set up Java Environment**: Uses JDK 21 to build and run tests.
3. **Install Dependencies**: Installs Maven dependencies.
4. **Run Tests**: Executes the test suite using `mvn test`.

## Setup and Configuration

### CircleCI Configuration

The CircleCI configuration file (`.circleci/config.yml`) defines a workflow to build and test the project. Below is an example of the configuration:

```yaml
version: 2.1

executors:
  maven-executor:
    docker:
      - image: cimg/openjdk:21.0  # JDK 21 environment
    working_directory: ~/repo

jobs:
  build:
    executor: maven-executor
    steps:
      - checkout
      - run:
          name: Install dependencies
          command: mvn install
      - run:
          name: Run tests
          command: mvn test

workflows:
  version: 2
  test-and-build:
    jobs:
      - build
```

### Steps to Enable CircleCI

1. **Fork/Clone this Repository**: Get a copy of this repository.
2. **Push to GitHub or Bitbucket**: CircleCI supports integration with GitHub and Bitbucket.
3. **Set Up CircleCI Project**: Go to [CircleCI](https://circleci.com/) and add your repository as a project.
4. **Automatic Builds**: CircleCI will trigger builds on every push to the `main` branch.

## Running Tests Locally

To run the tests locally before pushing to the repository:
1. **Install Dependencies**: Run `mvn install` to download required packages.
2. **Execute Tests**: Run `mvn test` to execute the test suite.

