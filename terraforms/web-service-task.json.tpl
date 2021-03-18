[
  {
    "name": "demo2-first-task",
    "image": "${REPOSITORY_URL}:latest",
    "cpu": 1,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080
      }
    ],
    "environment": []
  }
]