# Трекер задач

## Обзор

Task Tracker - это простое, но мощное приложение для управления задачами, которое использует микросервисную архитектуру для предоставления масштабируемого и эффективного решения. Приложение позволяет пользователям организовывать свои задачи в манере, подобной Trello, с использованием React-клиента для бесшовного пользовательского опыта. Бэкенд реализован с использованием Spring Boot, с дополнительными функциями, такими как планировщик для автоматизации задач и отправитель электронной почты для уведомлений.

## Technologies Used

- **Client (React):** Фронтенд построен с использованием React, предоставляя современный и отзывчивый пользовательский интерфейс для оптимального пользовательского опыта.

- **Task service (Spring Boot):** Бэкенд разработан с использованием Spring Boot, предлагая надежную и масштабируемую основу для управления задачами.

- **Notification service (Spring Boot):** спользуется для отправки уведомлений пользователям, информируя их о важных обновлениях и сроках.

- **Authentification service (Spring Boot):** Разработан с использованием Spring Boot, предлагая надежную и масштабируемую основу для управления пользователями, а также работы с
  oauth 2.0.

- **Database (Postgres):** Postgres используется как реляционная база данных для безопасного хранения информации, связанной с задачами

- **Message Broker (Kafka):** Kafka используется как брокер сообщений для обеспечения коммуникации и обмена данными между микросервисами, обеспечивая слабосвязанную архитектуру.

- **Authentication (JWT Tokens):** JSON Web Tokens (JWT) используются для безопасной аутентификации пользователей, предоставляя надежный механизм для проверки идентичности пользователей.

## Микросервисы

The application comprises the following microservices, each responsible for specific functionalities:

1. [Task Tracker Web API](https://github.com/farneser/task-tracker-api): Implements the core business logic of the
   application, managing tasks and user-related operations.

2. [Task Tracker React Client](https://github.com/farneser/task-tracker-client): Provides a modern and responsive user
   interface for users to interact with the task management system.

3. [Task Tracker Email Service](https://github.com/farneser/task-tracker-email-sender): Manages the sending of email
   notifications, keeping users informed about important updates and deadlines.

4. [Task Tracker Scheduler Service](https://github.com/farneser/task-tracker-scheduler): Implements scheduled tasks to
   automate processes within the application, ensuring efficiency and timely updates.

The microservices are deployed using Docker containers, with the following architecture:

![services](assets/microservices.svg)

## Technologies Used

* [Spring Boot](https://spring.io/projects/spring-boot): A framework for building Java-based enterprise applications.
* [Kotlin](https://kotlinlang.org/): A modern programming language that works seamlessly with Java on the JVM.
* [Spring Data JPA](https://spring.io/projects/spring-data-jpa): Simplifying data access with JPA.
* [Postgres](https://www.postgresql.org/): A powerful, open-source relational database system.
* [Spring Security](https://spring.io/projects/spring-security): A powerful and customizable authentication and access
  control framework.
* [ModelMapper](https://modelmapper.org/): An object mapping library that automatically maps one object to another.
* [Flyway](https://flywaydb.org/): Database migration tool for Java-based systems.
* [Swagger](https://swagger.io/): A tool for documenting APIs, providing a user interface to interact with your RESTful
  services.
* [React](https://reactjs.org/): A JavaScript library for building user interfaces.
* [TypeScript](https://www.typescriptlang.org/): A superset of JavaScript that adds static typing and other features.

## Run default

Main method of running this application is using docker-compose. Learn more about configuration in [Docker.md](Docker.md)

### Run built image

Run the application with the default configuration (docker compose is required). This will start the following services:

1. Clone the repository

    ```bash
    git clone https://github.com/farneser/task-tracker && cd task-tracker
    ```

2. Run the application

    ```bash
    ./run.sh
    ```

3. Open the browser and go to [http://localhost:3000](http://localhost:3000)

4. Stop and remove the containers

    ```bash
    ./run.sh stop
    ```

### Build locally

1. Clone the repository

    ```bash
    git clone https://github.com/farneser/task-tracker --recurse-submodules && cd task-tracker
    ```

2. Run build docker compose

    ```bash
    docker-compose -f docker-compose-build.yml build
    ```

3. Run the application

    ```bash
    docker-compose -f docker-compose-build.yml up
    ```

4. Open the browser and go to [http://localhost:3000](http://localhost:3000)
5. Stop and remove the containers

    ```bash
    docker-compose -f docker-compose-build.yml down -v
    ```

## CI/DI

As part of the project, an automated CI/CD process has been configured using GitHub Actions for each microservice. This
process ensures the automatic creation of Docker images and their upload to a shared repository (Docker Hub) when
changes are made to the master branch.

### Web API

[![Maven build](https://github.com/farneser/task-tracker-api/actions/workflows/maven.yml/badge.svg)](https://github.com/farneser/task-tracker-api/actions/workflows/maven.yml)

[![Docker Image build](https://github.com/farneser/task-tracker-api/actions/workflows/docker.yml/badge.svg)](https://github.com/farneser/task-tracker-api/actions/workflows/docker.yml)

### Scheduler

[![Maven build](https://github.com/farneser/task-tracker-scheduler/actions/workflows/maven.yml/badge.svg)](https://github.com/farneser/task-tracker-scheduler/actions/workflows/maven.yml)

[![Docker Image Build](https://github.com/farneser/task-tracker-scheduler/actions/workflows/docker.yml/badge.svg)](https://github.com/farneser/task-tracker-scheduler/actions/workflows/docker.yml)

### Email Sender

[![Maven build](https://github.com/farneser/task-tracker-email-sender/actions/workflows/maven.yml/badge.svg)](https://github.com/farneser/task-tracker-email-sender/actions/workflows/maven.yml)

[![Docker Image build](https://github.com/farneser/task-tracker-email-sender/actions/workflows/docker.yml/badge.svg)](https://github.com/farneser/task-tracker-email-sender/actions/workflows/docker.yml)

### Client

[![Build CI](https://github.com/farneser/task-tracker-client/actions/workflows/yarn.yml/badge.svg)](https://github.com/farneser/task-tracker-client/actions/workflows/yarn.yml)

[![Docker Image build](https://github.com/farneser/task-tracker-client/actions/workflows/docker.yml/badge.svg)](https://github.com/farneser/task-tracker-client/actions/workflows/docker.yml)
