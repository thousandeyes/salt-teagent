# Saltstack module: teagent
This is a Saltstack module for the ThousandEyes Enterprise Agent.

## Usage
Copy the **thousandeyes** folder to the corresponding Saltstack *file_roots* directory.
Below are several use cases with different install options for the ThousandEyes Enterprise Agent.

The configuration settings required have to be specified in the *te-agent.conf.yml* file with YAML syntax.


Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
    <th>Possible values</th>
  </tr>
  <tr>
    <td><tt>te_agent:</tt></td>
    <td>String</td>
    <td>Manage ThousandEyes agent</td>
    <td><tt>'installed'</tt></td>
    <td><tt>'installed','removed','purged'</tt></td>
  </tr>
  <tr>
    <td><tt>browserbot:</tt></td>
    <td>String</td>
    <td>Manages Browserbot</td>
    <td><tt>-</tt></td>
    <td><tt>'installed','removed','purged'</tt></td>
  </tr>
  <tr>
    <td><tt>set_repo:</tt></td>
    <td>String</td>
    <td>Manages ThousandEyes repository</td>
    <td><tt>'managed'</tt></td>
    <td><tt>'managed','absent'</tt></td>
  </tr>
  <tr>
    <td><tt>agent_utils:</tt></td>
    <td>String</td>
    <td>Manages agent utilities</td>
    <td><tt>-</tt></td>
    <td><tt>'installed','removed','purged'</tt></td>
  </tr>
  <tr>
    <td><tt>international_langs:</tt></td>
    <td>String</td>
    <td>Manages language pack</td>
    <td><tt>-</tt></td>
    <td><tt>'installed','removed','purged'</tt></td>
  </tr>
  <tr>
    <td><tt>account_token:</tt></td>
    <td>String</td>
    <td>Account token for the agent</td>
    <td><tt>sample value (equals a disabled agent)</tt></td>
  </tr>
  <tr>
    <td><tt>log_path:</tt></td>
    <td>String</td>
    <td>Agent log path</td>
    <td><tt>'/var/log'</tt></td>
  </tr>
  <tr>
    <td><tt>proxy_host:</tt></td>
    <td>String</td>
    <td>Proxy hostname</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>proxy_port:</tt></td>
    <td>String</td>
    <td>Proxy port</td>
    <td><tt>'0'</tt></td>
  </tr>
</table>



* Default settings

```
account_token       : '<account-token>'
```

* Set the proxy (http proxy, no auth)

```
account_token       : '<account-token>'
proxy_host          : 'proxy.example.com'
proxy_port          : '8080'
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
