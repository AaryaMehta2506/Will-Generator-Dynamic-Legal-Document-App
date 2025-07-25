## Problem Statement

> Please find the format for a Will. We have to create a dynamic version of the Will generation.  
> If you are a front-end developer, show the flow of the web application.  
> If you are a full stack or backend developer, show the full application.  
> The app should ask the user to fill in the blank details in a GUI.  
> Then all the asset details should be stored in respective tables.  
> Finally, we send all these details to an LLM to generate a PDF or HTML output.  
> Use your imagination and LLMs to create the most user-friendly and forward-looking interface.

---

## Features

- Simple form to collect:
  - Testator info
  - Beneficiaries (Name, Age, PAN, etc.)
  - Movable assets (bank accounts, insurance, stocks, mutual funds, jewellery)
  - Immovable assets (house, land)
  - Guardian, Witnesses, Executors
- Auto-generates structured legal Will in **HTML** and **PDF**
- Stores all assets in corresponding **MySQL tables**
- Ready to be enhanced using **LLMs (Large Language Models)** for smarter document creation

---

## Tech Stack

| Layer       | Technology          |
|-------------|---------------------|
| Backend     | Python (Flask)      |
| Frontend    | HTML + Jinja2       |
| Database    | MySQL (XAMPP)       |
| PDF Engine  | `xhtml2pdf`         |

---

## How It Works

1. **User fills in a dynamic HTML form**
2. Data is saved to **MySQL database**
3. Flask renders the data into a pre-written legal Will template
4. Final Will is generated as both:
   - HTML preview
   - Downloadable PDF (`xhtml2pdf`)

---

## Folder Structure
```
will_generator/
│
├── main.py               # Flask app entry
├── will_generator.py     # HTML generation logic
├── templates/
│   └── form.html         # Will input form
├── static/
│   └── generated_will.pdf
├── requirements.txt
├── README.md
└── sql/
    └── schema.sql        # MySQL tables
```

---

## Database Schema (MySQL)

Create tables using:

```sql
CREATE TABLE beneficiaries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  relationship VARCHAR(50),
  pan_aadhar VARCHAR(20),
  residence VARCHAR(200),
  age INT
);

CREATE TABLE bank_accounts (...);
CREATE TABLE insurance_policies (...);
CREATE TABLE stocks (...);
CREATE TABLE mutual_funds (...);
CREATE TABLE jewellery (...);
CREATE TABLE houses (...);
CREATE TABLE lands (...);
-- Adjust according to your form field names
```

## Installation & Run Locally
1. Clone this repo
   `git clone https://github.com/yourusername/will-generator.git`

2. Set up XAMPP and import `sql/schema.sql`

3. Start Flask app
   `python main.py`

4. Access in browser at
   `http://localhost:5000`

## 🤝 Contributing
Contributions are welcome!
Feel free to fork the repository, improve the game, and open a pull request. Let's grow this classic game together!

## 📄 License
This project is licensed under the [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)

## 👩‍💻 Author
**Aarya Mehta**  
🔗 [GitHub Profile](https://github.com/AaryaMehta2506)
