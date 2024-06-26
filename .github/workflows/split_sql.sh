git config --global user.email "jhkim0228@tangunsoft.com"
git config --global user.name "TSjhkim"

git clone https://github.com/TSjhkim/actions1.git
cd actions1

export SQL_FILES_PATH=$(pwd)
find . -type f -name "*.sql" | while IFS= read -r file; do
    count=1
    awk -v RS=';' '{ 
        if (tolower($0) ~ /create/) {
            print > ("create_" count ".sql")
        } else {
            print > ("other_" count ".sql")
        }
        count++
    }' "$file"
done

# export SQL_FILES_PATH=$(pwd)
# find . -type f -name "*.sql" | while IFS= read -r file; do
#     awk -v RS=';' '{print > ("./tmp_" NR ".sql")}' "$file"
# done
