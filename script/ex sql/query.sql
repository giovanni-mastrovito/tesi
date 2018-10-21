--select only text for a specific project (comment_id e text) (in this case project 12)

SELECT commit_comments.comment_id,body FROM commit_comments JOIN commits ON commit_comments.commit_id=commits.id WHERE commits.project_id=12
