grep 'meow'[a-z]* -n kitty_ipsum_1.txt | sed -r 's/([0-9]+).*/\1/'


echo -e "\n\n~~ kitty_ipsum_2.txt info ~~" >> kitty_info.txt
echo -e "\nNumber of lines:" >> kitty_info.txt
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt 
echo -e "\nNumber of words:" >> kitty_info.txt
wc -w < kitty_ipsum_2.txt >> kitty_info.txt 
echo -e "\nNumber of characters:" >> kitty_info.txt
wc -m < kitty_ipsum_2.txt >> kitty_info.txt 
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt
grep 'meow'[a-z]* -o kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep 'meow'[a-z]* -n kitty_ipsum_2.txt | sed -r 's/([0-9]+).*/\1/' >> kitty_info.txt
echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt
grep 'cat'[a-z]* -o kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep 'cat'[a-z]* -n kitty_ipsum_2.txt | sed -r 's/([0-9]+).*/\1/' >> kitty_info.txt

./translate.sh kitty_ipsum_1.txt | grep -E 'dog[a-z]*|woof[a-z]*' --color
./translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
diff kitty_ipsum_1.txt  doggy_ipsum_1.txt --color
