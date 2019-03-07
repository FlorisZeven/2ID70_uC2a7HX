SELECT c.CourseName, Grade FROM  all_courses_passed as acp JOIN CourseOffers as co ON co.CourseOfferId = acp.CourseOfferId JOIN Courses as c ON c.CourseId = co.CourseId WHERE acp.StudentId = %1% AND acp.DegreeId = %2% ORDER BY co.Year, co.Quartile, co.CourseOfferId;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT StudentId FROM q6 WHERE TimesExcelent > %1% ORDER BY StudentId;
SELECT 0;
SELECT 0;