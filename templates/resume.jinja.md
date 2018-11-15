# \VAR{contact.name}
\VAR{contact.location}
\VAR{contact.email}
\VAR{contact.phone}
\VAR{contact.linkedin}
\VAR{contact.github}
\VAR{contact.twitter}

## Summary

\BLOCK{for item in summary}
- \VAR{item}
\BLOCK{endfor}

## Skills Base

\BLOCK{for key, value in skills.items()}
- \VAR{key}: \VAR{value}
\BLOCK{endfor}

## Experience

\BLOCK{for job in work}
### \VAR{job.title} @ \VAR{job.employer}

- \VAR{job.dates}
- _\VAR{job.location}_

- **Description**: \VAR{job.description}
- **Technologies**: \VAR{job.technologies}
- **Activities**:
\BLOCK{for item in job.activities}
  - \VAR{item}
\BLOCK{endfor}
\BLOCK{if job.projects}
- **Projects**:
\BLOCK{for item in job.projects}
  - \VAR{item}
\BLOCK{endfor}
\BLOCK{endif}

\BLOCK{endfor}

## Education

\BLOCK{for degree, schools in education.items()}
- **\VAR{degree}**
\BLOCK{for school in schools}
  - \VAR{school.dates} _\VAR{school.school}_ at \VAR{school.location}
\BLOCK{endfor}

\BLOCK{endfor}

## Additional  Training

\BLOCK{for course in training}
- \VAR{course.year} **\VAR{course.title}** at _\VAR{course.school}_
\BLOCK{endfor}

## Languages

\BLOCK{for key, value in languages.items()}
- **\VAR{key}**: _\VAR{value}_
\BLOCK{endfor}

## Volunteering

\BLOCK{for action in volunteering}
- \VAR{action.year} **\VAR{action.title}**: _\VAR{action.description}_
\BLOCK{endfor}