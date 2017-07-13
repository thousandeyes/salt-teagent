# Saltstack module: teagent
This is a Saltstack module for the ThousandEyes Enterprise Agent.

## Usage
Copy the te-agent folder to the corresponding Saltstack *file_roots* directory.
Below are several use cases with different install options for the ThousandEyes Enterprise Agent.

The configuration settings required have to be specified in the *te-agent.conf.yml* file with YAML syntax.


 * Default settings

  ```
  account_token       : '<account-token>'
  ```

 * Enable browserbot

  ```
  account_token       : '<account-token>'
  browserbot          : true
  ```

 * Install the ThousandEyes Agent Utilities

  ```
  account_token       : '<account-token>'
  agent_utils         : true
  ```

 * Enable browserbot and install the international language packages

  ```
  account_token       : '<account-token>'
  browserbot          : true
  international_langs : true
  ```


 * Set the log path location

  ```
  account_token       : '<account-token>'
  log_path            : '/var/log'
  ```

 * Set the proxy (http proxy, no auth)

  ```
  account_token       : '<account-token>'
  proxy_host          : 'proxy.example.com',
  proxy_port          : '8080',
  ```

 * Don't check the dependencies and don't add the ThousandEyes repository

  ```
  account_token       : '<account-token>'
  set_repo            : false
  ```

 * Other options
  ```
  log_file_size       : ''
  proxy_user          : ''
  proxy_pass          : ''
  proxy_bypass_list   : ''
  ```

## License
This program is free software: you can redistribute it and/or modify  
it under the terms of the GNU General Public License as published by  
the Free Software Foundation, either version 3 of the License, or  
(at your option) any later version.

This program is distributed in the hope that it will be useful,  
but WITHOUT ANY WARRANTY; without even the implied warranty of  
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License  
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Contact
If you have questions or comments, please send them to  
opensource+salt@thousandeyes.com, or to the following address:

ThousandEyes, Inc.  
301 Howard Street #1700  
San Francisco, CA  94105  
Attn: ThousandEyes Open Source Projects  
