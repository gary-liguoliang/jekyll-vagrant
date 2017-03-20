## Envrioment requirments
 - VirtualBox v5.1.0
 - Vagrant v1.9.2

Vagrant will create a Ubuntu 14 instance and install Ruby 2.3.1 with Jekyll. 

### Usage

assume the working directory is: `c:\tmp`
 1. `git clone git@github.com:guoliang-dev/jekyll-vagrant.git` 
 2. `cd jekyll-vagrant`
 3. `vagrant up`, it may take few mintues to start the VM.
 4. `ssh vagrant@localhost -p 2222` with `vagrant/vagrant` and execute: 
 
    ```bash 
    cd /vagrant  # /vagrant is the share folder pointing to folder jekyll-vagrant in the host. 
    jekyll new my-awesome-site
    cd my-awesome-site
    bundle exec jekyll serve --host 0.0.0.0
    ```
 5. access your jekyll web app from host: http://127.0.0.1:8040

You may edit your jekyll project `my-awesome-site` on your host:  `c:\tmp\jekyll-vagrant\my-awesome-site`. 

if you need to specify Jekyll environment , use export to set on your VM:
```bash
 export JEKYLL_ENV=development
 export JEKYLL_ENV=production
 ```

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
