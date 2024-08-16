package main

import (
	"flag"
	"fmt"
	"math/rand"
	"strings"
	"time"
)

const (
	upperChars   = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	lowerChars   = "abcdefghijklmnopqrstuvwxyz"
	digitChars   = "0123456789"
	specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?"
)

func generatePassword(length int, useUpper, useLower, useDigits, useSpecial bool) string {
	var chars string
	if useUpper {
		chars += upperChars
	}
	if useLower {
		chars += lowerChars
	}
	if useDigits {
		chars += digitChars
	}
	if useSpecial {
		chars += specialChars
	}

	if chars == "" {
		chars = upperChars + lowerChars + digitChars
	}

	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	var password strings.Builder
	for i := 0; i < length; i++ {
		password.WriteByte(chars[r.Intn(len(chars))])
	}
	return password.String()
}

func main() {
	length := flag.Int("l", 12, "Length of the password")
	useUpper := flag.Bool("u", false, "Use uppercase letters")
	useLower := flag.Bool("w", false, "Use lowercase letters")
	useDigits := flag.Bool("d", false, "Use digits")
	useSpecial := flag.Bool("s", false, "Use special characters")

	flag.Parse()

	password := generatePassword(*length, *useUpper, *useLower, *useDigits, *useSpecial)
	fmt.Printf("Generated password: %s\n", password)
}
