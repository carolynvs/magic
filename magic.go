package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/fatih/color"
)

func main() {
	magicString := getUserMagicString()
	color.Set(color.FgGreen)
	fmt.Print(magicString)
	color.Unset()
}

func getUserMagicString() string {
	scriptPath := getMagicFilePath()
	if _, err := os.Stat(scriptPath); os.IsNotExist(err) {
		return "🎵  Oh oh it's magic! 🎵\n"
	}

	shellPath := getShell()
	shellArgs := []string{scriptPath}
	output, err := exec.Command(shellPath, shellArgs...).Output()
	if err != nil {
		fmt.Fprintln(os.Stderr, "There was an error retrieving the user's magic string: ", err)
		os.Exit(1)
	}

	return string(output)
}

func getMagicFilePath() string {
	return filepath.Join(getUserHomeDir(), "magic"+fileExtension)
}
