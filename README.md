# Intel-Assembly-Language-Programming-Exercises

This project contains solutions to programming exercises from [Assembly Language for x86 Processors (7th Edition) by Kip Irvine](https://www.amazon.com/Assembly-Language-x86-Processors-7th/dp/0133769402). Each solution has been documented to the best of my ability, but please let me know if you find any issues or have any feedback.

## Getting Started

### Prerequisites

[Click here](http://kipirvine.com/asm/gettingstartedvs2015/Irvine.zip) to download the Irvine32 library used in the programs. Unzip the downloaded file into a directory named Irvine on Drive C.
When installing Visual Studio, be sure to select Visual C++ under the *Programming Languages* category. If you forget to do this, you can always rerun the install file and modify the existing installation.

### Installing

Step 1: Start Visual Studio and select **File** > **Open** > **Open from Source Control**.

Step 2: When the Team Explorer opens select **Clone** under **Local Git Repositories**. Enter the following URL:

```
https://github.com/avivbrook/Intel-Assembly-Language-Programming-Exercises.git
```

Step 3: Click **Clone** and then double click **Intel-Assembly-Language-Programming-Exercises.sln** in the Solution Explorer.

Step 4: Select all the asm files using shift-click. Right-click and select **Properties**. Go to **Configuration Properties** > **General** and set **Excluded from Build** to **Yes**. To run one of the programs, simply right-click the specific file you want to run and change **Excluded from Build** to **No**.

Step 5: Right-click the project (**Intel-Assembly-Language-Programming-Exercises**) in the Solution Explorer and select **Properties**. Go to **Microsoft Macro Assembler** > **General** and set **Include Paths** to **C:\Irvine**.

Step 6: In the same window, go to **Microsoft Macro Assembler** > **Listing File** and set **Assembled Code Listing File** to **$(ProjectName).lst**.

Step 7: Go to **Linker** > **General** and set **Additional Library Directories** to **C:\Irvine**.

Step 8: Go to **Linker** > **Input** and add **irvine32.lib;** to the beginning of **Additional Dependencies** so that the final value will be **irvine32.lib;kernel32.lib;...etc...**.

Step 9: Go to **Linker** > **Debugging** and set **Generate Debug Info** to **Yes (/DEBUG)**.

Step 10: Go to **Linker** > **System** and set **SubSystem** to **Console (/SUBSYSTEM:CONSOLE)**.

Step 11: Go to **Linker** > **Advanced** and set **Randomized Base Address** to **No (/DYNAMICBASE:NO)** and **Image Has Safe Exception Handlers** to **No (/SAFESEH:NO)**.

Step 12: Click **Apply** and **OK** to close the window.

Try pressing F10 or F11 to enter debugging mode. If everything's working fine, congratulations -- the project works!

## Author

* **Aviv Brook** - *Based on exercises from Kip Irvine's book.* - [avivbrook](https://github.com/avivbrook)