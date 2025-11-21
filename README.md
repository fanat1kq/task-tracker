# Трекер задач[Task Tracker]

## Обзор

Task Tracker - это простое, но мощное приложение для управления задачами, которое использует микросервисную архитектуру для предоставления масштабируемого и эффективного решения. Приложение позволяет пользователям организовывать свои задачи в манере, подобной Trello, с использованием React-клиента для бесшовного пользовательского опыта. Бэкенд реализован с использованием Spring Boot, с дополнительными функциями, такими как планировщик для автоматизации задач и отправитель электронной почты для уведомлений.

## Технологии

- **Client (React):** Фронтенд построен с использованием React, предоставляя современный и отзывчивый пользовательский интерфейс для оптимального пользовательского опыта.

- **Task service (Spring Boot):** Бэкенд разработан с использованием Spring Boot, предлагая надежную и масштабируемую основу для управления задачами.

- **Notification service (Spring Boot):** спользуется для отправки уведомлений пользователям, информируя их о важных обновлениях и сроках.

- **Authentification service (Spring Boot):** Разработан с использованием Spring Boot, предлагая надежную и масштабируемую основу для управления пользователями, а также работы с
  oauth 2.0.

- **Database (Postgres):** Postgres используется как реляционная база данных для безопасного хранения информации, связанной с задачами

- **Message Broker (Kafka):** Kafka используется как брокер сообщений для обеспечения коммуникации и обмена данными между микросервисами, обеспечивая слабосвязанную архитектуру.

- **Authentication (JWT Tokens):** JSON Web Tokens (JWT) используются для безопасной аутентификации пользователей, предоставляя надежный механизм для проверки идентичности пользователей.

- **Gateway (Spring Boot):** API Gateway разработан на Spring Boot, обеспечивает единую точку входа для всех клиентских запросов, маршрутизацию, аутентификацию и кросc-доменные запросы (CORS).
  
- **Debezium:** Используется для захвата изменений данных (CDC) из базы данных Postgres и потоковой передачи этих изменений в Kafka, обеспечивая асинхронную репликацию данных между микросервисами.

## Микросервисы

Приложение состоит из следующих микросервисов, каждый из которых отвечает за определенные функциональности:

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

## Run default

Основной метод запуска этого приложения - использование docker-compose. Узнайте больше о конфигурации в Docker.md

### Запуск собранного образа

Run the application with the default configuration (docker compose is required). This will start the following services:

1. Клонируйте репозиторий

    ```bash
    git clone https://github.com/anat1kq/task-tracker.git && cd task-tracker
    ```

2. Запустите приложение

    ```bash
    ./run.sh
    ```

3. Откройте браузер и перейдите по адресу  [http://localhost:3001](http://localhost:3001)

4. Остановите и удалите контейнеры

    ```bash
    ./run.sh stop
    ```

### Сборка локально

1. Клонируйте репозиторий

    ```bash
    git clone https://github.com/fanat1kq/task-tracker.git --recurse-submodules && cd task-tracker
    ```

2. Запустите сборку docker compose

    ```bash
    docker-compose -f docker-compose-build.yml build
    ```

3. Запустите приложение

    ```bash
    docker-compose -f docker-compose-build.yml up
    ```

4. Откройте браузер и перейдите по адресу  [http://localhost:3001](http://localhost:3001)
5. Остановите и удалите контейнеры

    ```bash
    docker-compose -f docker-compose-build.yml down -v
    ```

## CI/DI

В рамках проекта был настроен автоматизированный процесс CI/CD с использованием GitHub Actions для каждого микросервиса. Этот процесс обеспечивает автоматическое создание Docker-образов и их загрузку в общий репозиторий (Docker Hub) при внесении изменений в ветку master.
