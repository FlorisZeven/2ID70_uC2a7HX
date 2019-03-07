CREATE MATERIALIZED VIEW all_courses_passed(StudentId, DegreeId, CourseOfferId, Grade) AS
(
    SELECT srtd.StudentId, srtd.degreeId, cr.CourseOfferId, cr.grade
      FROM CourseRegistrations as cr
      JOIN StudentRegistrationsToDegrees as srtd ON cr.StudentRegistrationId = srtd.StudentRegistrationId
     WHERE cr.grade > 4
);

CREATE INDEX acp_studentid_degreeid ON all_courses_passed(StudentId, DegreeId);


CREATE MATERIALIZED VIEW gpa_active_complete(StudentId, DegreeId, GPA, complete) AS
(
    SELECT acp.StudentId, acp.DegreeId, avg(Grade) as GPA, case when sum(ECTS) > TotalECTS then 1 else 0 end as complete
      FROM all_courses_passed as acp JOIN Degrees as d ON d.DegreeId = acp.DegreeId
      JOIN CourseOffers as co ON co.CourseOfferId = acp.CourseOfferId
      JOIN Courses as c ON c.CourseId = co.CourseId
    GROUP BY acp.StudentId, acp.DegreeId, TotalECTS
);



