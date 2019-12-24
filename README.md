# Rake::TestTask raises an error when the test path includes non-ascii charactors

### The error

  When a test file path includes smone non-ascii charactors,
  rake test task ```Rake::TestTask``` fails with a message

  *File does not exist: [test_target_file_name]*

  It seems the task can't find a file on non-ascii path.

### Environment

  * Windows 10 Pro
  * ruby 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]
  * rake 13.0.1

### How to reproduce

  1. clone this repo.
  1. open a command prompt. move to this directory.
  1. type the commands below.

    > cd あいうえお
    > bundle exec rake

  (samle folder structure)

      あいうえお
      │  Gemfile
      │  Gemfile.lock
      │  Rakefile
      │  
      ├─lib
      │      target.rb
      │      
      └─test
              target_test.rb


### Details

<details>
<summary>bundle exec rake</summary>
<pre>
C:/Ruby26-x64/bin/ruby.exe -w -I"lib;lib;test" -I"C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib" "C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader.rb" "test/target_test.rb"

File does not exist: target

rake aborted!
Command failed with status (1): [ruby -w -I"lib;lib;test" -I"C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib" "C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader.rb" "test/target_test.rb" ]

Tasks: TOP => default => tsk
(See full trace by running task with --trace)
</pre>
</details>

<details>
<summary>bundle exec rake --trace</summary>
<pre>
** Invoke default (first_time)
** Invoke tsk (first_time)
** Execute tsk
C:/Ruby26-x64/bin/ruby.exe -w -I"lib;lib;test" -I"C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib" "C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader.rb" "test/target_test.rb"

File does not exist: target

rake aborted!
Command failed with status (1): [ruby -w -I"lib;lib;test" -I"C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib" "C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader.rb" "test/target_test.rb" ]
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/testtask.rb:130:in `block (3 levels) in define'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/file_utils.rb:57:in `sh'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/file_utils.rb:104:in `ruby'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/testtask.rb:117:in `block (2 levels) in define'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/file_utils_ext.rb:58:in `verbose'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/testtask.rb:111:in `block in define'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `block in execute'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `each'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `execute'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
C:/Ruby26-x64/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:199:in `invoke_with_call_chain'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:243:in `block in invoke_prerequisites'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:241:in `each'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:241:in `invoke_prerequisites'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:218:in `block in invoke_with_call_chain'
C:/Ruby26-x64/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:199:in `invoke_with_call_chain'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:188:in `invoke'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:160:in `invoke_task'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block (2 levels) in top_level'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `each'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block in top_level'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:125:in `run_with_threads'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:110:in `top_level'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:83:in `block in run'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:186:in `standard_exception_handling'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:80:in `run'
C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/exe/rake:27:in `<top (required)>'
C:/Ruby26-x64/bin/rake:23:in `load'
C:/Ruby26-x64/bin/rake:23:in `<main>'
Tasks: TOP => default => tsk
</pre>
</details>


<details>
<summary>(ok case) ascii charator only path </summary>
<pre>
C:\rake_test_task_non_ascii_path\abcde>bundle exec rake
C:/Ruby26-x64/bin/ruby.exe -w -I"lib;lib;test" -I"C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib" "C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader.rb" "test/target_test.rb"
Loaded suite C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_test_loader
Started
.
Finished in 0.000892 seconds.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
1 tests, 1 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
----------------------------------------------------------------------------------------------------------------------------------------------------------------
1121.08 tests/s, 1121.08 assertions/s
</pre>
</details>
