# API Testing with Rest Assured and GitHub Actions

This repository contains an API testing framework built with **Java** and **Rest Assured**, integrated with **GitHub Actions** for Continuous Integration. This setup enables automated testing workflows for RESTful APIs, ensuring code quality and stability.

## Table of Contents
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Running Tests](#running-tests)
- [Continuous Integration with GitHub Actions](#continuous-integration-with-github-actions)
- [Reporting](#reporting)
- [Contributing](#contributing)
- [License](#license)

---

## Getting Started

To get started with API testing using Rest Assured, clone this repository and follow the setup instructions below.

## Project Structure

```
├── src
│   ├── main
│   │   └── java
│   └── test
│       └── java
│           ├── tests        # Contains test classes
│           ├── utils        # Utility classes (e.g., for configuration)
│           └── config       # Configuration management
├── .github
│   └── workflows
│       └── ci.yml           # GitHub Actions workflow for running tests
├── pom.xml                  # Maven project file with dependencies
└── README.md
```

## Prerequisites

- **Java** 11 or higher
- **Maven** 3.6 or higher
- **Git** for version control

## Setup and Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/api-testing-restassured-github-actions.git
   cd api-testing-restassured-github-actions
   ```

2. **Install dependencies**:
   Run the following Maven command to download dependencies:
   ```bash
   mvn clean install
   ```

## Running Tests

You can run all tests locally using Maven:

```bash
mvn test
```

### Running a Specific Test

To run a single test, use the following command and specify the test class name:

```bash
mvn -Dtest=TestClassName test
```

## Continuous Integration with GitHub Actions

This project uses **GitHub Actions** to automatically run tests on every commit or pull request to the repository. The workflow file `.github/workflows/ci.yml` defines the CI pipeline.

### GitHub Actions Workflow (ci.yml)

```yaml
name: API Test CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'

      - name: Install dependencies
        run: mvn install

      - name: Run tests
        run: mvn test
```

### Customizing the Workflow

You can edit `.github/workflows/ci.yml` to customize the workflow based on your testing and deployment requirements.

## Reporting

This project supports generating test reports with **Allure**.

1. **Add Allure dependency** to `pom.xml`:

   ```xml
   <dependency>
       <groupId>io.qameta.allure</groupId>
       <artifactId>allure-rest-assured</artifactId>
       <version>2.13.0</version>
   </dependency>
   ```

2. **Generate Allure Reports** after running tests:

   ```bash
   mvn allure:serve
   ```

3. **View Reports**: This will open a local server to display the test results.

## Contributing

We welcome contributions to improve this project! Please follow these steps:

1. Fork this repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to the branch.
5. Open a Pull Request.

## License

This project is licensed under the MIT License.

---

With this setup, you have a complete API testing framework that supports local and CI testing with reporting. Happy testing! 🚀
