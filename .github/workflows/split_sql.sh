git config --global user.email "jhkim0228@tangunsoft.com"
git config --global user.name "TSjhkim"

git clone https://github.com/TSjhkim/actions1.git
cd actions1

find . -type f -name "*.sql" | while IFS= read -r file; do
    awk -v RS=';' '{print > ("/home/tmp_" NR ".sql")}' "$file"
done
