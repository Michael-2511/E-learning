use elearning;

show tables;

CREATE TABLE Lesson (
    lessonId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Course (
    courseId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Student (
    studentId INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    studyYear INT
);

CREATE TABLE Professor (
    professorId INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    experience INT
);

CREATE TABLE Quiz (
    quizId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Question (
    questionId INT AUTO_INCREMENT PRIMARY KEY,
    statement VARCHAR(255) NOT NULL,
    correctAnswer VARCHAR(255) NOT NULL
);

CREATE TABLE CourseLesson (
    courseId INT,
    lessonId INT,
    PRIMARY KEY (courseId, lessonId),
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    FOREIGN KEY (lessonId) REFERENCES Lesson(lessonId)
);

CREATE TABLE CourseStudent (
    courseId INT,
    studentId INT,
    PRIMARY KEY (courseId, studentId),
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    FOREIGN KEY (studentId) REFERENCES Student(studentId)
);

CREATE TABLE CourseProfessor (
    courseId INT,
    professorId INT,
    PRIMARY KEY (courseId, professorId),
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    FOREIGN KEY (professorId) REFERENCES Professor(professorId)
);

CREATE TABLE CourseQuiz (
    courseId INT,
    quizId INT,
    PRIMARY KEY (courseId, quizId),
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    FOREIGN KEY (quizId) REFERENCES Quiz(quizId)
);

CREATE TABLE QuizQuestion (
    quizId INT,
    questionId INT,
    PRIMARY KEY (quizId, questionId),
    FOREIGN KEY (quizId) REFERENCES Quiz(quizId),
    FOREIGN KEY (questionId) REFERENCES Question(questionId)
);