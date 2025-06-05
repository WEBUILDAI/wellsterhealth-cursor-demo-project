# Rails Todo App 📝

A simple, beautiful Todo application built with Ruby on Rails 7.1. Features session-based storage, password authentication, and a modern responsive UI.

![Todo App Screenshot](https://via.placeholder.com/800x400/667eea/ffffff?text=Rails+Todo+App)

## ✨ Features

- 🔐 **Simple Authentication** - Password-based login (password: `1234`)
- 📝 **Todo Management** - Add and delete todo items
- 💾 **Session Storage** - Todos stored in browser session (no database required)
- 🎨 **Modern UI** - Beautiful gradient design with responsive layout
- 🚀 **Rails 7.1** - Built with the latest stable Rails version

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed on your system:

- **macOS, Linux, or Windows**
- **Git** - [Download here](https://git-scm.com/downloads)
- **Homebrew** (macOS) - [Install here](https://brew.sh/)

## 🚀 Installation & Setup

### Step 1: Clone the Repository

```bash
git clone <your-repository-url>
cd wellsterhealth-cursor-demo-project
```

### Step 2: Install Ruby (macOS with rbenv - Recommended)

```bash
# Install rbenv and ruby-build via Homebrew
brew install rbenv ruby-build

# Add rbenv to your shell configuration
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Install Ruby 3.4.4 (latest stable version)
rbenv install 3.4.4
rbenv global 3.4.4

# Verify Ruby installation
ruby --version
# Should show: ruby 3.4.4 (2025-05-14 revision a38531fd3f) +PRISM [arm64-darwin24]
```

### Step 3: Install Ruby (Linux/Ubuntu)

```bash
# Update package manager
sudo apt update

# Install Ruby and development tools
sudo apt install ruby-full build-essential zlib1g-dev

# Verify installation
ruby --version
```

### Step 4: Install Ruby (Windows)

1. Download RubyInstaller from [https://rubyinstaller.org/](https://rubyinstaller.org/)
2. Run the installer and follow the setup wizard
3. Open Command Prompt and verify: `ruby --version`

### Step 5: Install Rails

```bash
# Update RubyGems to latest version
gem update --system

# Install Rails 7.1 (current stable version)
gem install rails -v "~> 7.1.0"

# Verify Rails installation
rails --version
# Should show: Rails 7.1.5.1 or similar
```

### Step 6: Install Project Dependencies

```bash
# Navigate to project directory
cd wellsterhealth-cursor-demo-project

# Install all required gems
bundle install
```

### Step 7: Setup Database & Start Application

```bash
# Run database migrations (if any)
bin/rails db:migrate

# Start the Rails server
bin/rails server

# Alternative commands
rails server
rails s
```

The application will be available at: **http://localhost:3000**

## 🎯 Usage

1. **Access the App**: Open http://localhost:3000 in your browser
2. **Login**: Enter password `1234` and click "Login"
3. **Add Todos**: Type your todo item and click "Add Todo"
4. **Delete Todos**: Click the "Delete" button next to any todo item
5. **Logout**: Click the "Logout" button in the top right

## 📁 Project Structure

```
wellsterhealth-cursor-demo-project/
├── app/
│   ├── controllers/          # Application controllers
│   │   ├── concerns/               # Controller concerns
│   │   ├── auth_controller.rb      # Authentication logic
│   │   └── todos_controller.rb     # Todo CRUD operations
│   ├── views/               # HTML templates
│   │   ├── auth/                   # Login page
│   │   ├── todos/                  # Todo list page
│   │   └── layouts/               # Application layouts
│   ├── models/              # Data models
│   ├── assets/              # CSS, JS, images
│   └── helpers/             # View helpers
├── config/
│   ├── routes.rb            # URL routing configuration
│   ├── database.yml         # Database configuration
│   └── environments/        # Environment-specific settings
├── db/                      # Database files and migrations
├── bin/                     # Executable scripts
├── Gemfile                  # Ruby dependencies
├── Gemfile.lock            # Locked gem versions
├── .gitignore              # Git ignore patterns
└── README.md               # This file
```

## 🔧 Troubleshooting

### Ruby Version Issues

If you get Ruby version errors:

```bash
# Check your Ruby version
ruby --version
# Should show: ruby 3.4.4, not 2.6.x (system Ruby)

# Make sure you're using rbenv Ruby
which ruby
which rails
# Should show paths with .rbenv in them

# If still using system Ruby, reload your shell:
source ~/.zshrc
rbenv global 3.4.4
rbenv rehash
```

### Permission Errors (macOS/Linux)

```bash
# If you get permission errors with gem install:
gem install rails --user-install

# With rbenv (already configured if you followed the setup):
rbenv rehash
which ruby
which rails

# Make sure you're using rbenv Ruby, not system Ruby:
ruby --version  # Should show 3.4.4, not 2.6.x
```

### Port Already in Use

```bash
# If port 3000 is busy, use a different port:
rails server -p 3001

# Then access: http://localhost:3001
```

### Bundle Install Fails

```bash
# Clear gem cache and retry:
bundle clean --force
bundle install

# Or update bundler:
gem update bundler
bundle install
```

## 🎨 Customization

### Change the Password

Edit `app/controllers/auth_controller.rb`:

```ruby
def authenticate
  if params[:password] == "your_new_password"  # Change this
    session[:authenticated] = true
    redirect_to todos_path, notice: "Successfully logged in!"
  else
    redirect_to login_path, alert: "Invalid password!"
  end
end
```

### Modify Styles

The CSS is embedded in the view files:
- Login styles: `app/views/auth/login.html.erb`
- Todo styles: `app/views/todos/index.html.erb`

## 🛡️ Security Note

⚠️ **This is a demo application** with simplified authentication. For production use:

- Use proper user authentication (devise gem)
- Store todos in a database
- Add CSRF protection
- Use environment variables for secrets
- Implement proper session management

## 📈 Next Steps

Want to enhance this app? Consider:

- 🗄️ **Add Database**: Migrate from session to PostgreSQL/MySQL
- 👥 **Multi-user**: Add user registration and authentication
- ✅ **Todo Status**: Add completed/pending states
- 🏷️ **Categories**: Organize todos by category
- 📱 **API**: Add JSON API endpoints
- 🎨 **Themes**: Add dark/light mode toggle

## 📖 Learning Resources

- [Rails Guides](https://guides.rubyonrails.org/)
- [Ruby Documentation](https://ruby-doc.org/)
- [Rails Tutorial](https://www.railstutorial.org/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Happy coding!** 🚀

Made with ❤️ using Ruby on Rails
