## Stories

```
As a Visitor with no account
When I visit the root page,
I see a link to signup or log in with Google oAuth.
When I click the sign up link, I am routed through Google's system
Then I am redirected to my dashboard
And I see a prompt to add a new topic or project to research.
```

```
As a User
When I visit the root page
I login
Then I am redirected to my user dashboard
And I see a prompt to add a new topic or project to research.
```

```
As a User
When I visit my dashboard
I see a prompt to add new questions to the topic
and I see a list of existing topics
When I click on a topic, I am taken to its show page
```

```
As a User
When I visit my dashboard and click "Add New Topic" (or something)
I see a form to name the topic
When I submit the form, I am taken to the new topic's show page
And I see a prompt to add new questions to the topic.
```

```
As a User
When I visit a topic show page
I see a list of questions associated with the topic
And a "Search" button next to each question.
When I click the search button,
I am redirected to a search results index page
I see a list of search results for the question.
```

```
As a User
When I execute a search for a question
And I select a search result,
I am redirected to a search result show page,
this page has the iframe for the search result,
I am also able to
 - Save the page
 - Return to search results
 - Close the search/browse pane
 - Add, edit, or delete notes
 - Add, edit, or delete questions
```

```
As a User on a search result show page
When I save the page, I am taken to a source show page
And I see a preview of the saved page
And all the questions I added
And the topic/question that led to the source.
I am also able to
 - Add, edit, or delete questions
 - Add, edit, or delete notes
 - Navigate back to the source webpage (url)
 - return to the question index (topic show)
```
