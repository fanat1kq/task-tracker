FROM eclipse-temurin:21-jre

# Копируем все собранные JAR файлы из подмодулей
COPY tracket-auth-service/target/*.jar /app/auth-service.jar
COPY task-service/target/*.jar /app/task-service.jar
COPY tracker-notification-service/target/*.jar /app/notification-service.jar
COPY tracker-notification-service/target/*.jar /app/notification-service.jar
COPY tracker-gateway/target/*.jar /app/tracker-gateway.jar
COPY tracker-front/target/*.jar /app/tracker-front.jar