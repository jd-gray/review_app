[![Build Status](https://semaphoreci.com/api/v1/projects/eaf43b34-367b-43c3-a7ad-83b36e556a83/2005923/badge.svg)](https://semaphoreci.com/jd-gray-projects/review_app)

# Meal Reviewer

This application is built for users to review meals and has a few requirements:
- Ratings are thumbs up/thumbs down
- A meal can only be reviewed once per user
- If a user votes thumbs down, a comment is required

## Getting Started

Clone the repository:

```
git clone https://github.com/jd-gray/review_app.git
```

Create, migrate, and seed your database:

``` 
rails db:setup
```

Run test tests:
```
rails test
```

Run your local rails server:

```
rails s
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
