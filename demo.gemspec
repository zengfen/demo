Gem::Specification.new do |s|
    s.name        = 'zf_auth_demo'
    s.version     = '0.0.0'
    s.date        = '2018-04-18'
    s.summary     = "ZfAuthDemo!"
    s.description = "A simple auth gem"
    s.authors     = ["zengfen"]
    s.email       = '1065935326@qq.com'
    s.license = ''
    s.files       = %w(
                        lib/zf_auth_demo.rb
                    )
    s.executables << 'test'
    s.homepage  =
        'http://rubygems.org/gems/zf_auth_demo'
end

Gem::Specification.new do |s|
    s.name = 'demo'
    s.version = '0.01'
    s.date = '2017-07-30'
    s.summary = 'Demo!'
    s.description = "A simple demo"
    s.authors     = ["zengfen"]
    s.email       = '1065935326@qq.com'
    s.license = ''
    s.require_paths = %w(lib)

    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- spec/*`.split("\n")
end