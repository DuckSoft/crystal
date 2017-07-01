# 本脚本用于各个子章节文件的自动生成
sc=1
fileroot="vol1/cp01/"
while true
do
	cp=1
	echo "第 0${sc} 节一共有多少小节？"
	echo "键入 0 以结束自动生成"
	read cp
	
	if [ $cp -eq 0 ]
       	then
		echo "结束自动生成."
		unix2dos sc*.tex
		break
	else
		touch sc0$sc.tex
		read -p "节名: " scname

		echo "\\section{${scname}}" > sc0$sc.tex
		echo "" >> sc0$sc.tex
		for ((i=1; i<=cp; ++i))
		do
			scname=""
			read -p "第${i}章名: " scname
			echo "\\subsection{${scname}}" > sc0${sc}_0$i.tex
			echo "\\input{${fileroot}sc0${sc}_0$i.tex} %${scname}" >> sc0$sc.tex
		
			iconv -f gbk -t utf-8 sc0${sc}_0$i.tex > sc0${sc}_0${i}_.tex
			cp -rf  sc0${sc}_0${i}_.tex sc0${sc}_0${i}.tex
			rm sc0${sc}_0${i}_.tex
		done
		iconv -f gbk -t utf-8 sc0$sc.tex > sc0${sc}_.tex
		cp -rf sc0${sc}_.tex sc0$sc.tex
		rm sc0${sc}_.tex
	fi
	sc=$[$sc+1]
done

