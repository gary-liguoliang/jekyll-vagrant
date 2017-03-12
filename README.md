## Envrioments 
 - VirtualBox v5.1.0
 - Vagrant v1.9.2

Vagrant will create a Ubuntu 14 instance and install Ruby 2.3.1 with Jekyll. 


### issues encountered
 - Latest VirtualBox 1.5.16 doesn't work well with Vagrant 1.9.2 and the latest ubuntu/trusty64(v20170307.0.1)
     
     fixed by isntalling VirtualBox 1.5.1
 - Ubuntu `apt-get` provides `1.9.3`, but Jekyll requires `2.0`
     
     fixed by adding `setup-ruby.sh`
     
 - user `vagrant` cannot install `gem`: permission required 

      fixed by adding `sudo usermod -a -G rvm vagrant`
      
 - cannot access Jekyll website via the forwarded port: 
    
    ```
   $ curl -v http://127.0.0.1:8040
   curl: (56) Recv failure: Connection was reset
   ```
    fixed by setting host: `bundle exec jekyll serve --host 0.0.0.0`
