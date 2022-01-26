module github.com/l3v11/gclone

go 1.17

replace github.com/jlaffaye/ftp => github.com/rclone/ftp v1.0.0-210902f

require (
	github.com/rclone/rclone v1.57.0
	github.com/spf13/cobra v1.2.1
	github.com/stretchr/testify v1.7.0
	golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
	google.golang.org/api v0.60.0
)
