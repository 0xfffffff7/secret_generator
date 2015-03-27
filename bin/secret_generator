require 'openssl'

if ARGV[0] == nil then
	hostname = `hostname`.chop
	p "hostname = " + hostname
else
	hostname = ARGV[0]
	p "hostname = " + hostname
end

key = OpenSSL::PKey::RSA.new 2048
file = File.new("secret.key", "w")
file.write(key.to_pem)
file.close

request = OpenSSL::X509::Request.new
  request.version = 0 
  request.subject = OpenSSL::X509::Name.new([
  ['C', "test", OpenSSL::ASN1::PRINTABLESTRING],
  ['ST', "test", OpenSSL::ASN1::PRINTABLESTRING],
  ['L', "test", OpenSSL::ASN1::PRINTABLESTRING],
  ['O', "test", OpenSSL::ASN1::UTF8STRING],
  ['OU', "test", OpenSSL::ASN1::UTF8STRING],
  ['CN', hostname, OpenSSL::ASN1::UTF8STRING],
  ['emailAddress', "test@hostname", OpenSSL::ASN1::UTF8STRING]
  ])  

  request.public_key = key.public_key
  request.sign(key, OpenSSL::Digest::SHA1.new)

name = OpenSSL::X509::Name.parse "CN=" + hostname + "/DC=" + hostname
 
cert = OpenSSL::X509::Certificate.new
cert.serial = 0
cert.version = 2
cert.not_before = Time.now
cert.not_after = Time.now + 600
cert.subject = request.subject
cert.public_key = request.public_key
cert.subject = name
cert.sign key, OpenSSL::Digest::SHA1.new

file = File.new("public.key", "w")
file.write(cert.to_pem)
file.close





