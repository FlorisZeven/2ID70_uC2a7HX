CREATE MATERIALIZED VIEW all_courses_passed(StudentId, DegreeId, CourseOfferId, Grade) AS
(
    SELECT srtd.StudentId, srtd.degreeId, cr.CourseOfferId, cr.grade
      FROM CourseRegistrations as cr
      JOIN StudentRegistrationsToDegrees as srtd ON cr.StudentRegistrationId = srtd.StudentRegistrationId
     WHERE cr.grade > 4
);

CREATE INDEX acp_studentid_degreeid ON all_courses_passed(StudentId, DegreeId);


