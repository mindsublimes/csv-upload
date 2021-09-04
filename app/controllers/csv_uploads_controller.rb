require 'csv'

class CsvUploadsController < ApplicationController
  def index; end

  def upload
    session[:details] = []
    CSV.foreach(params[:file], quote_char: nil, col_sep: "\t", row_sep: "\r\r\n") do |row|
      next if row == ["name,password"]
      row = row[0].split(",")
      user = User.new(name: row[0], password: row[1])
      if user.save
        session[:details] << "#{user.name} was successfully saved"
      else
        session[:details] << user.errors.messages[:base][0]
      end
    end
    redirect_to root_path
  end

end
