require 'net/ftp'
require 'fileutils'


module IamFtp

 class  FtpCalls

   attr_accessor :ftp_host, :ftp_username, :ftp_password

   class << self
     attr_accessor :logger
   end

   def initialize(ftp_info_hash)
     @ftp_host = ftp_info_hash[:ftp_host].to_s
     @ftp_username = ftp_info_hash[:ftp_username].to_s
     @ftp_password = ftp_info_hash[:ftp_password].to_s
     @connection = nil
   end


   def ftp_connect
     @connection = Net::FTP.new(ftp_host)
     @connection.passive =true
     @connection.login(ftp_username, ftp_password)
   end


   def ftp_close
     puts "Connection closing.."
     @connection.close
   end


   def list_all_files

     Net::FTP.open(ftp_host) do |ftp|
       ftp.login(ftp_username, ftp_password )
        ftp.passive = true
        a = ftp.nlst
        b = ftp.nlst('**/*.*')
        c = ftp.nlst('**/**/*.*')
        d = ftp.nlst('**/**/**/*.*')
        e = ftp.nlst('**/**/**/**/*.*')


        ftp.close

        file_list = a+ b + c + d + e
        file_list
      end

    end

    def is_ftp_file?(ftp, file_name)
      ftp.chdir(file_name)
      ftp.chdir('..')
      false

      rescue

      true
    end

    def get_ready_and_upload_the_file(local_file_path, remote_file_path, filename)
      filename.gsub!("#{local_file_path}/", '')
      local = File.join local_file_path, filename
      remote = "#{remote_file_path}/#{filename}".gsub(/\/+/, '/')

     if File.directory?(local)
       @connection.mkdir remote rescue Net::FTPPermError
       puts "Created Remote Directory #{local}"
     elsif File.file?(local)
       @connection.putbinaryfile local, remote
       puts "Pushed file #{remote}"
     end

    end


    def upload_directory_to_ftp_server(local_file_path, remote_file_path)
      ftp_connect

      Dir.glob(File.join(local_file_path, '**', '*')) do |filename|
        get_ready_and_upload_the_file(local_file_path, remote_file_path, filename)
      end

      ftp_close

    end


    def upload_file_to_ftp_server(local_file_path, remote_file_path, filename)
      ftp_connect

      get_ready_and_upload_the_file(local_file_path, remote_file_path, filename)

      ftp_close
    end

  end


end
