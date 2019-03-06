CREATE MATERIALIZED VIEW all_courses_passed(StudentId, degreeId, CourseId, grade) AS
(
    SELECT co.CourseId, srtd.StudentId, srtd.degreeId, cr.grade
      FROM CourseRegistrations as cr
      JOIN CourseOffers as co ON cr.CourseOfferId = co.CourseOfferId
      JOIN StudentRegistrationsToDegrees as srtd ON cr.StudentRegistrationId = srtd.StudentRegistrationId
     WHERE cr.grade > 4
     ORDER BY StudentId, DegreeId
);

CREATE INDEX acp ON (StudentId, degreeId, CourseId, grade);


CREATE MATERIALIZED VIEW high_gpa(StudentRegistrationId, avg_grade) AS
(
    SELECT StudentRegistrationId, avg(Grade)
      FROM CourseRegistrations
    GROUP BY StudentRegistrationId
    HAVING min(Grade) > 4 AND avg(Grade) >= 9.0
);