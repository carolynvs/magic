// +build !windows

package main

import "os"

const fileExtension string = ".sh"

func getUserHomeDir() string {
	return os.Getenv("HOME")
}

func getShell() string {
	return os.Getenv("SHELL")
}
