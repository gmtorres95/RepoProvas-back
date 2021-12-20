# RepoProvas (back-end)

<img src="https://github.com/gmtorres95/RepoProvas-front/blob/main/public/logo192.png" />

Share and search for old exams to help you study.  
Check the this application in production [here](https://repoprovas-one.vercel.app)  
Link of the API: https://apirp.herokuapp.com/

## Technologies

<div styles="display: flex">
  <img src="https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Express.js-404D59?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white" />
</div>

## How to use the API

### GET /categories

With this route you can get a list categories for the exams.  
<details>
  <summary>This route will return a JSON like this one:</summary>

  ```bash
  [
    {
      "id": 1,
      "category": "P1"
    },
    {
      "id": 2,
      "category": "P2"
    },
    ...
  ]
  ```
</details>

### GET /disciplines

With this route you can get a list of subjects with all the teachers.
<details>
  <summary>This route will return a JSON like this one:</summary>

  ```bash
  [
    {
      "id": 1,
      "discipline": "Fundamentos da Computacao",
      "teachers": [
        {
          "id": 7,
          "name": "Clarinha Caeiro"
        }
      ]
    },
    {
      "id": 3,
      "discipline": "Calculo I",
      "teachers": [
        {
          "id": 3,
          "name": "Sophie Aires"
        },
        {
          "id": 41,
          "name": "Eduard Teves"
        },
        {
          "id": 42,
          "name": "Eurico Filgueiras"
        }
      ]
    },
    ...
  ]
  ```
</details>

### GET /teachers

With this route you can get a list of teachers and their exams. 
<details>
  <summary>This route will return a JSON like this one:</summary>

  ```bash
  [
    {
      "id": 1,
      "name": "Zelia Barreto",
      "exams": [
        {
          "id": 5,
          "name": "2021.1",
          "category_id": 1,
          "teacher_id": 1,
          "discipline_id": 5,
          "link": "https://www.exams.com/5.pdf",
          "discipline": {
            "id": 5,
            "discipline": "Algoritmos",
            "semester_id": 1
          },
          "category": {
            "id": 1,
            "category": "P1"
          }
        },
        {
          "id": 1,
          "name": "2021.1",
          "category_id": 1,
          "teacher_id": 1,
          "discipline_id": 4,
          "link": "https://www.exams.com/1.pdf",
          "discipline": {
            "id": 4,
            "discipline": "Laboratorio de CC",
            "semester_id": 1
          },
          "category": {
            "id": 1,
            "category": "P1"
          }
        },
        ...
      ]
    },
    ...
  ]
  ```
</details>

### GET /semesters

With this route you can get a list of semesters and disciplines.
<details>
  <summary>This route will return a JSON like this one:</summary>

  ```bash
  [
    {
      "id": 1,
      "semester": "1",
      "disciplines": [
        {
          "id": 6,
          "discipline": "Laboratorio de Programacao I",
          "semester_id": 1,
          "exams": [
            {
              "id": 8,
              "name": "2021.1",
              "category_id": 4,
              "teacher_id": 1,
              "discipline_id": 6,
              "link": "https://www.exams.com/8.pdf",
              "category": {
                "id": 4,
                "category": "2ch"
              },
              "teacher": {
                "id": 1,
                "name": "Zelia Barreto"
              }
            },
            ...
          ]
        }
      ]
    },
    ...
  ]
  ```
</details>

### POST /exams

With this route you can post an exam.
<details>
  <summary>Send a JSON like this one:</summary>

  ```bash
  {
    "name": "2020.1",
    "category_id": 2,
    "teacher_id": 2,
    "discipline_id": 9,
    "link": "https://www.exams.com/9.pdf"
  }
  ```
</details>

## How to run

### Install the application

```bash
# Clone this repository
$ git clone https://github.com/gmtorres95/RepoProvas-back

# Install the dependencies
$ npm i
```

### Configure the .env file

Use the .env.example file

### Run the application

```bash
$ npm run start
```
