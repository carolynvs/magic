// +build windows

package main

import "os"

const fileExtension string = ".ps1"

func getUserHomeDir() string {
	return os.Getenv("USERPROFILE")
}

func getShell() string {
	return "powershell"
}
