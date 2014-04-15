require 'twitter-text'

module ApplicationHelper

  include Twitter::Autolink

  def html_link(text)
    text = auto_link(text)
    text ? text.html_safe : ''
  end

# hacked version of the activesupport mail_to method, this one supports bcc
#
  def mail_to(email, *args)
    options = args.extract_options!.to_options!

    name = args.shift || email.to_s
    html_options = (options.delete(:html) || {}).to_options!

    extras = ''
    options.each do |key, val|
      extras << "#{key}=#{CGI.escape(val).gsub("+", "%20")}&" unless val.blank?
    end
    extras = "?" << extras.gsub!(/&?$/,"") unless extras.empty?

    email_address = email.to_s
    email_address_obfuscated = email_address.dup
    email_address_obfuscated.gsub!(/@/, html_options.delete("replace_at")) if html_options.has_key?("replace_at")
    email_address_obfuscated.gsub!(/\./, html_options.delete("replace_dot")) if html_options.has_key?("replace_dot")

    string = ''
    encode = html_options.delete("encode").to_s
    if encode == "javascript"
      "document.write('#{content_tag("a", name || email_address_obfuscated, html_options.merge({ "href" => "mailto:"+email_address+extras }))}');".each_byte do |c|
        string << sprintf("%%%x", c)
      end
      "<script type=\"#{Mime::JS}\">eval(unescape('#{string}'))</script>"
    elsif encode == "hex"
      email_address_encoded = ''
      email_address_obfuscated.each_byte do |c|
        email_address_encoded << sprintf("&#%d;", c)
      end

      protocol = 'mailto:'
      protocol.each_byte { |c| string << sprintf("&#%d;", c) }

      email_address.each_byte do |c|
        char = c.chr
        string << (char =~ /\w/ ? sprintf("%%%x", c) : char)
      end
      content_tag "a", name || email_address_encoded, html_options.merge({ "href" => "#{string}#{extras}" })
    else
      content_tag "a", name || email_address_obfuscated, html_options.merge({ "href" => "mailto:#{email_address}#{extras}" })
    end
  end
  alias_method('mailto', 'mail_to')

end
