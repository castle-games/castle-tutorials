# Tutorial 1

Welcome to the first in a series of tutorials about making games on Castle! In this series we'll first get started with the basics: getting Castle setup, and learning how to draw graphics and react to user input, which form the basis of games. After that, we'll get into the unique social features offered by Castle's platform: such as displaying user avatars in your game, allowing your game to make posts, save data in Castle's database, and making your game multiplayer.

## Learning goals

Here's a list of things that we can hope to learn in this first tutorial:

- Installing and setting up Castle
- Software you will need other than Castle itself
- Starting a new project
- Drawing shapes
- Reacting to input
- Drawing images
- Publishing your game to Castle

## Installing and setting up Castle

*You can skip this step if you've already installed Castle and have a user account.*

You can download the latest release of Castle from Castle's [home page](https://castle.games/).

If you're on **Windows**, this will give you a file named like 'Castle-\<version\>-Setup.exe', which you can launch and follow the instructions to install Castle.

For **macOS**, you will get a file like 'Castle-\<version\>.zip'. Extract this and put the 'Castle.app' file inside in your macOS Applications folder. Putting it in the Applications folder is necessary for auto-updates to work properly.

From now on, Castle can automatically check for updates, prompt you and update itself. You won't have to repeat the installation process on this computer!

When you first launch Castle, you will see the following screen:

!['Sign-in' screen](sign-in.png)

Follow the instructions to create an account (or sign in if you happen to have an account already). Having an account on Castle allows users to have profiles for their games, interact in chat and play multiplayer games.

You should now be ready to explore and play games on Castle. You probably came to this tutorial to learn how to make your own games, so let's learn how to do that!

## Software you will need other than Castle itself

### Code editor

Currently, games for Castle are made using the [Lua](https://www.lua.org/start.html) programming language. If you're familiar with programming already, the language should be easy to learn while making games on Castle. To write Lua code, you will need a code editor. The Castle team recommends [VS Code](https://code.visualstudio.com/) with the [https://marketplace.visualstudio.com/items?itemName=trixnz.vscode-lua](vscode-lua) extension. If you're already familiar with a code editor that supports Lua, you could continue using it! Vim, Notepad++, Sublime Text, Emacs are all popular code editors that have Lua support. In some cases these editors may need a plugin or some additional setup to enable syntax highlighting for Lua.

### Image editor (optional)

Usually game elements are displayed using images. For example, if you're making a Pac-Man clone, you may want to draw an image for Pac-Man, one image for each kind of ghost, and so on. For this you will need an image editor. Any editor that exports common file formats such as JPEG or PNG will do (PNG is recommended to to retain image quality).

You can do without an image editor if you find pre-made images on the web, or if you want to just render abstract shapes such as circles and rectangles which you can do with pure code.

Now that we've gotten that out of the way, let's actually start our Castle game project!

## Starting a new project

In Castle's sidebar, click 'Create' to navigate to the Create screen:

![Click 'Create'](click-create.png)

On the Create screen, you will be presented with many options for starting a new project or opening an existing one. These include templates that start your game with some pre-existing code and images. In this tutorial we want to learn how to write our own code to start things off, so let's click on the 'blank' option:

![Click 'blank'](click-blank.png)

On the next screen, you will have a chance to set your project's name. You may also want to navigate to a different directory to save your project's files in. Under this directory, Castle will create a *new directory* for your project, and the project's files wil reside within that new directory. Projects usually involve at least one '.castle' file and one '.lua' file, if not more files, so it makes sense to have a separate directory per-project. Once you've picked the options you want, click 'Create Project':

!['Create Project' screen](create-project.png)

Once you do this, you will be greeted with the following screen, where you can click 'Open Project' to launch your project in it's current form:

![Ready to start making new project](open-new-project.png)

The initial version of your project should look like this:

![Initial new project](initial-new-project.png)

We're now ready to start writing some code! Open the 'main.lua' file under the project directory in your code editor and check out the current state of the code: 

![Initial code](initial-code.png)

This code will make sense to you real soon--or it may make sense to you already! The project is currently only showing text, so let's start by making it draw some shapes!

## Drawing shapes