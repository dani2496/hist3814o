pages=$(curl 'http://search.canadaian.ca/search?q=ottawa*&field=$so=score&df=1914&dt=1918&fmt=json' | jq '.pages')
echo "Pages:"$pages
$(seq 1 $pages)
curl 'http://search.canadiana.ca/search/'${i}'?q=montenegr*&field=&so=score&df=1914&dt=1918&fmt=json' | jq '.docs[] | {key}' >> results.txt
curl 'http://search.canadiana.ca/search/'${i}'?q=montenegr*&field=&so=score&df=1914&dt=1918&fmt=json' | jq '.docs[] | {key}' >> results.txt
sed -e 's/\"key\": \"//g' results.txt | tr -d "\"" | tr -d "{" | tr -d "}" | tr -s " " | sed '/^\s*$/d' | tr -d ' ' > cleanlist.txtawk '$0="search.canadiana.ca/view/"$0' cleanlist.txt| awk '{print $0 "/1?r=0&s=1&fmt=json&api_text=1"}' > urlstograb.txt
wget -i urlstograb.txt -O output.txt
