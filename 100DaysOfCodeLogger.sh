name=`whoami`
greetingMessage="Hi $name. Lets log todays work :)"
weekDays=("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday")
day=`date +%u`
currDate=`date +%b-%d-%y`
echo "How many days has it been? \c"
read numDays
content="\n\n### Day ${numDays}: ${currDate} ${weekDays[day]}"
echo "What is today's progress? \c"
read progress
content="${content} \n**Today's Progress**: ${progress}"
echo "Any thoughts about this? \c"
read thoughts
content="${content} \n\n**Thoughts**: ${thoughts}"
echo "Do you want to add any link to the work? (y/N) \c"
read answer
if [ ${answer} = "y" ]
    then
        echo "Text for link: \c"
        read textForLink
        echo "Url: \c"
        read url
        content="${content} \n\n**Link To Work**: [${textForLink}](${url})"
    else
        echo "Cool!!!"
fi
echo ${content} >> ~/Work/Github/100-days-of-code/summa.md
echo "Log Added."

while [ "$#" -gt "0" ]
do
  case $1 in
    -c)
        cd ~/Work/Github/100-days-of-code/
        git add .
        git commit -m "Day ${numDays} log"
        echo "Commit Done"
        ;;
    -p)
        cd ~/Work/Github/100-days-of-code/
        git push
        echo "Pushed"
        break
        ;;
    *)
        break
        ;;
  esac
  shift
done  
