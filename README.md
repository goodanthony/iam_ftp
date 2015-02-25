# Iam::Ftp

Thanks to Ruby’s 'net/ftp' library this gem would come in handy if you want to upload files or directories to an remote server with FTP.

## Installation

$ gem install iam_ftp


## Usage

require 'iam_ftp'

to initialize

connect = IamFtp::FtpCalls.new({:ftp_host => "ftp.iamfree.com", :ftp_username => "me@iamfree.com", :ftp_password => "i dont know"})

To upload an entire directory to server FTP

connect.upload_directory_to_ftp_server("/Users/me/Documents/work/iamnotfree/my-site/", "/home/www/")


If the server is a shared host like Godaddy.com hosting: leave second parameter blank

connect.upload_directory_to_ftp_server("/Users/me/Documents/work/iamnotfree/my-site/", "")


To upload a file one by one(firsly the directory, then the remote directory, then the file name)

connect.upload_file_to_ftp_server("/Users/me/Documents/work/iamnotfree/my-site", "", "/Users/me/Documents/work/iamnotfree/my-site/messages.html")


If it is too hard to type the file path. Just  locate the file in "finder" and drag it to your terminal. That would get your file path on to the terminal.

To list all the files in your FTP server

connect.list_all_files

## Contributing

1. Fork it ( https://github.com/iamfree-com/iam_ftp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
