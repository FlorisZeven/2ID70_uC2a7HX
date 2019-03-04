

CREATE UNLOGGED TABLE Degrees(
	 DegreeId smallint
	,Dept char(50)
	,DegreeDescription char(200)
	,TotalECTS smallint
	,CONSTRAINT degreeId_key PRIMARY KEY (DegreeId, TotalECTS)
);

CREATE UNLOGGED TABLE Students(
	 StudentId int
	,StudentName char(50)
	,Address char(200)
	,BirthyearStudent smallint
	,Gender char(1)
	,CONSTRAINT studentid_key PRIMARY KEY (StudentId, Gender)
);

CREATE UNLOGGED TABLE StudentRegistrationsToDegrees(
	 StudentRegistrationId int
	,StudentId int
	,DegreeId int
	,RegistrationYear smallint
	,CONSTRAINT studentregistrationid_key PRIMARY KEY (StudentRegistrationId, StudentId, DegreeId)
);

CREATE UNLOGGED TABLE Teachers(
	 TeacherId int
	,TeacherName char(50)
	,Address char(200)
	,BirthyearTeacher smallint
	,Gender char(1)
	,CONSTRAINT teacherid_key PRIMARY KEY (TeacherId)
);

CREATE UNLOGGED TABLE Courses(
	 CourseId int
	,CourseName char(50)
	,CourseDescription char(200)
	,DegreeId int 
	,ECTS smallint
	,CONSTRAINT courseid_key PRIMARY KEY (CourseId, DegreeId, ECTS)
);

CREATE UNLOGGED TABLE CourseOffers(
	 CourseOfferId int
	,CourseId int
	,Year smallint
	,Quartile smallint
	,CONSTRAINT courseoffers_key PRIMARY KEY (CourseOfferId, CourseId)
);

CREATE UNLOGGED TABLE CourseRegistrations(
	 CourseOfferId int
	,StudentRegistrationId int 
	,Grade smallint
);

CREATE UNLOGGED TABLE TeacherAssignmentsToCourses(
	 CourseOfferId int
	,TeacherId int 
	,CONSTRAINT teacherassignmentstocourses_key PRIMARY KEY (CourseOfferId, TeacherId)
);

CREATE UNLOGGED TABLE StudentAssistants(
	 CourseOfferId int
	,StudentRegistrationId int 
	,CONSTRAINT studentassistants_key PRIMARY KEY (CourseOfferId, StudentRegistrationId)
);
