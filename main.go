// Command jsonc2json strips comments from json with comments
package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/muhammadmuzzammil1998/jsonc"
)

func main() {
	b, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		log.Fatalf("failed to read from stdin: %v", err)
	}
	fmt.Printf("%s\n", jsonc.ToJSON(b))
}
