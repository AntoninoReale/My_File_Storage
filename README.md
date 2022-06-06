## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/AntoninoReale/My_File_Storage/blob/main/Diagrams/Week-13-ELK%20Stack%20Network%20Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/AntoninoReale/My_File_Storage/tree/main/Ansible

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.
- _Load balancers protect availability, but directing requests to the available server
- The advantage of a Jump Box is that it minimises the potential attack routes by directing remote connections to the cloud network though a single Virtual Machine.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file sustems of teh VMs on the network as well as watch syste metrics such as CPU usage; attempted SSH logins: sudo escalation failures; etc.
- Filebeat is used to monitor log files
- Metricbeat is used to collect opertating system and service statistics on the monitoired virtual machine/system

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| Web 1    |Web Server| 10.0.0.5   | Linux            |
| Web 2    |Web Server| 10.0.0.6   | Linux            |
| Elk-VM   |Monitoring| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 14.202.16.151

Machines within the network can only be accessed by Jech other.
- The JumpBox can acess ELK-VM using SSH via white listed IP 14.202.16.151 


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 14.202.16.151        |
|  Web 1   | No                  | 10.0.0.1-254         |
|  Web 2   | No                  | 10.0.0.1.254         |
|  ELK-VM  | No                  | 10.1.0.1-254         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Automated build and deplyment which ensures consitent and quick builds
- Configuration can be scipted to enusure 

The playbook implements the following tasks:
- Installs Docker ELK installation play. 
- Installs Python
- Installs Docker's Python Module
- Increase virtual memory to support the ELK stack
- Download and launch the Docker ELK container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 10.0.0.5
- Web 2 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects logs from the Virtual Machines and sends it to ELK for analysis
- Metricbeat collects system metric from the opperating system and services running on the Virtual Machines

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to the Anisble Docker Continer.
- Update the Ansible hosts file (found /etc/ansible/hosts) to include the following
[webservers]   
10.0.0.4 ansible_python_interpreter=/usr/bin/python3  
10.0.0.5 ansible_python_interpreter=/usr/bin/python3  
[elkservers]  
10.1.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to http://elk-server-ip:5601/app/kibana to check that the installation worked as expected.

- Which file is the playbook?  
install-elk.yml
Where do you copy it?  
/etc/ansible
- Which file do you update to make Ansible run the playbook on a specific machine?  
Asible hosts
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?  
within hosts speficy the secction and IP address to run python on 
- Which URL do you navigate to in order to check that the ELK server is running?  
http://"elk-server-ip":5601/app/kibana


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
1) Start an ssh session with the Jump Box ~$ ssh sysadmin@Jump Box Public IP
2) Start the Ansible Docker container ~$ sudo docker start "Ansible Container Name"
3) Attach a shell to the Ansible Docker container with the command ~$ sudo docker attach "Ansible Container Name"
4) Edit the Ansible hosts file to include the Webserver(s) and Elk Server
5) Run the playbooks with the following commands:
- ansible-playbook /etc/ansible/install-elk.yml
- ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
- ansible-playbook /etc/ansible/roles/metricbeat-playbook.yml
6) After running the playbooks and observing no errors in the output, navigate to Kibana to check that the installation worked as expected by viewing Filebeat and Metricbeat data and reports in the Kibana Dashboard  
Kibana can be accessed at http://"elk-server-ip":5601/app/kibana

