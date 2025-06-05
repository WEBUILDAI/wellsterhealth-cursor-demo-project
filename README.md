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
cd ruby-on-rails-demo
```

### Step 2: Install Ruby (macOS with Homebrew)

```bash
# Install Ruby via Homebrew
brew install ruby

# Add Ruby to your PATH
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Verify Ruby installation
ruby --version
# Should show: ruby 3.4.4 or similar
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
# Install Rails 7.1
gem install rails -v "~> 7.1.0"

# Verify Rails installation
rails --version
# Should show: Rails 7.1.x.x
```

### Step 6: Install Project Dependencies

```bash
# Navigate to project directory
cd ruby-on-rails-demo

# Install all required gems
bundle install
```

### Step 7: Start the Application

```bash
# Start the Rails server
rails server

# Alternative command
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
ruby-on-rails-demo/
├── app/
│   ├── controllers/          # Application controllers
│   │   ├── auth_controller.rb      # Authentication logic
│   │   └── todos_controller.rb     # Todo CRUD operations
│   ├── views/               # HTML templates
│   │   ├── auth/                   # Login page
│   │   └── todos/                  # Todo list page
│   └── assets/              # CSS, JS, images
├── config/
│   ├── routes.rb            # URL routing configuration
│   └── database.yml         # Database configuration
├── Gemfile                  # Ruby dependencies
└── README.md               # This file
```

## 🔧 Troubleshooting

### Ruby Version Issues

If you get Ruby version errors:

```bash
# Check your Ruby version
ruby --version

# Make sure you're using the correct PATH
which ruby
which rails

# On macOS, ensure Homebrew Ruby is first in PATH:
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
```

### Permission Errors (macOS/Linux)

```bash
# If you get permission errors with gem install:
gem install rails --user-install

# Or use a Ruby version manager (recommended):
brew install rbenv
rbenv install 3.1.0
rbenv global 3.1.0
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
