# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_queue/version'

Gem::Specification.new do |gem|
  gem.name          = "sms_queue"
  gem.version       = SmsQueue::VERSION
  gem.authors       = ["Christoph Ko\314\210nig"]
  gem.email         = ["christoph.koenig@sales-lentz.lu"]
  gem.description   = %q{Provides mass sms sending capability to your application. A batch sms sending job is splitted into single jobs for each recipient and pushed into a queue. The queue will be processed in background to not affect your applications response time. The final sms sending will be done via an third-party sms gateway}
  gem.summary       = %q{Provides mass sms sending capability to your application. Uses a queue to process the sending via an third-party sms gateway.}
  gem.homepage      = "https://github.com/SalesLentz/sms_queue"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
