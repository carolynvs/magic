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
	fmt.Println(magicString)
	color.Unset()
}

func getUserMagicString() string {
	scriptPath := getMagicFilePath()
	if _, err := os.Stat(scriptPath); err == nil {
		shellPath := getShell()
		shellArgs := []string{scriptPath}
		output, err := exec.Command(shellPath, shellArgs...).Output()
		if err != nil {
			fmt.Fprintln(os.Stderr, "There was an error retrieving the user's magic string: ", err)
			os.Exit(1)
		}
		return string(output)
	}

	magicTxt := os.Getenv("MAGIC_TEXT")
	if magicTxt == "" {
		magicTxt = "🎵  Oh oh it's magic! 🎵"
	}

	return magicTxt
}

func getMagicFilePath() string {
	return filepath.Join(getUserHomeDir(), "magic"+fileExtension)
}
