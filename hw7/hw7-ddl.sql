# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

IF OBJECT_ID('skills', 'U') IS NOT NULL
    DROP TABLE skills;
CREATE TABLE skills (
    skills_id INT NOT NULL PRIMARY KEY,
    skills_name VARCHAR(255) NOT NULL,
    skills_description VARCHAR(255) NOT NULL,
    skills_tag VARCHAR(255) NOT NULL,
    skills_url VARCHAR(255),
    skills_time_commitment INT
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_committment) VALUES
    (1, 'network security', 'protect networks from threats', 'Cybersecurity Skills', 'securenet.com', 22),
    (2, 'programming', 'write code like a pro', 'Tech Skills', 'codingmaster.com', 20),
    (3, 'graphic design', 'create stunning visuals', 'Creative Skills', 'designwizard.com', 15),
    (4, 'data analysis', 'analyze data like a pro', 'Analytics Skills', 'dataninja.com', 25),
    (5, 'public speaking', 'communicate with confidence', 'Communication Skills', 'speakup.com', 12),
    (6, 'foreign language proficiency', 'speak multiple languages', 'Language Skills', 'polyglot.com', 30),
    (7, 'problem solving', 'solve complex problems', 'Problem-Solving Skills', 'brainy.com', 18),
    (8, 'time management', 'optimize your schedule', 'Time Management Skills', 'timemaster.com', 10);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_last_name varchar(256) NOT NULL,
    people_first_name varchar(255),
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(255),
    people_date_joined date default(current_date) NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_last_name people_email, people_linkedin_url, people_discord_handle, people_phone_number, people_date_joined) values 

    (1, 'Van', 'Person 1', 'van.person1@example.com', 'linkedin.com/van.person1', 'van#1234', '+1234567890', '2023-01-01'),
    (2, 'Alice', 'Person 2', 'alice.person2@example.com', 'linkedin.com/alice.person2', 'Alice#5678', '+2345678901', '2023-02-15'),
    (3, 'Bob', 'Person 3', 'bob.person3@example.com', 'linkedin.com/bob.person3', 'Bob#9101', '+3456789012', '2023-03-20'),
    (4, 'Eva', 'Person 4', 'eva.person4@example.com', 'linkedin.com/eva.person4', 'Eva#1122', '+4567890123', '2023-04-25'),
    (5, 'Michael', 'Person 5', 'michael.person5@example.com', 'linkedin.com/michael.person5', 'Michael#3344', '+5678901234', '2023-05-30'),
    (6, 'Sophia', 'Person 6', 'sophia.person6@example.com', 'linkedin.com/sophia.person6', 'Sophia#5566', '+6789012345', '2023-06-15');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE peopleskills (
    id int not null auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date default (current_date),
    primary key (id) )

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 INSERT into peopleskills (skills_id, people_id, date_acquired ) values
  (1, 1, '2023-01-15'), (3, 1, '2023-01-15'), (6, 1, '2023-01-15'),
  (3, 2, '2023-02-28'), (4, 2, '2023-02-28'), (5, 2, '2023-02-28'),
  (1, 3, '2023-03-10'), (5, 3, '2023-03-10'),
  (3, 5, '2023-05-20'), (6, 5, '2023-05-20'),
  (2, 6, '2023-06-30'), (3, 6, '2023-06-30'), (4, 6, '2023-06-30'),
  (3, 7, '2023-07-15'), (5, 7, '2023-07-15'), (6, 7, '2023-07-15'),
  (1, 8, '2023-08-05'), (3, 8, '2023-08-05'), (5, 8, '2023-08-05'), (6, 8, '2023-08-05'),
  (2, 9, '2023-09-18'), (5, 9, '2023-09-18'), (6, 9, '2023-09-18'),
  (1, 10, '2023-10-10'), (4, 10, '2023-10-10'), (5, 10, '2023-10-10');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    roles_id int,
    roles_name varchar(255),
    roles_sort_priority int,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles ( roles_id, roles_name, roles_sort_priority) values
(1, 'Designer', 10), (2, 'Developer', 20), (3, 'Recruit', 30), 
(4, 'Team Lead', 40), (5, 'Boss', 50), (6, 'Mentor', 60);
SELECT * FROM roles


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment
CREATE TABLE peopleroles(
    id int auto_increment NOT NULL,
    people_id int NOT NULL,
    roles_id int NOT NULL,
    date_assigned date default(current_date) NOT NULL,
    PRIMARY KEY (id)
)

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(people_id, roles_id) values 
(1, 2), (2, 5), (2, 6), (3, 2), 
(3,4), (4,3), (5,3), (6, 2), 
(6,1), (7, 1), (8, 1), (8,4), 
(9,2), (10, 2), (10,1);

SELECT * FROM peopleroles