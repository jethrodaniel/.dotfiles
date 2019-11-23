# Start the ssh-agent.
#
# In sh, this is
#
# ```
# $ ssh-agent
# SSH_AUTH_SOCK=/tmp/ssh-xxxxx/agent.xxx; export SSH_AUTH_SOCK;
# SSH_AGENT_PID=xxxx; export SSH_AGENT_PID;
# echo Agent pid xxxx;
#
# $ eval `ssh-agent`
# ```
#
function sshsetup
  set SSH_AUTH_SOCK (echo (ssh-agent) | awk '{print $1}' | sed 's/SSH_AUTH_SOCK=//g' | sed 's/;//')
end
