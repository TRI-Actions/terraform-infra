import subprocess


 
account_diff = subprocess.run("git diff origin/master --name-only terraform/modules | awk -F/ '{ print $3 }' | sort | uniq", shell=True, stdout=subprocess.PIPE, text=True).stdout
for i in range(0,len(account_diff)):
  remove_init = "rm -rf .terraform"

  # init
  init = "terraform init -no-color -input=false -get=true"

  validate = "terraform validate -no-color"
  # plan -target
  module = subprocess.run(f"head -n 1 terraform/${account_diff[i]}.tf | awk '{{ print $2 }}' | tr -d '\"'", shell=True, stdout=subprocess.PIPE, text=True).stdout
  plan = f"terraform plan -target = 'module.{module}' -out=plan.out"
