# ���ű����ڸ������½��ļ����Զ�����
sc=1
fileroot="vol1/cp01/"
while true
do
	cp=1
	echo "�� 0${sc} ��һ���ж���С�ڣ�"
	echo "���� 0 �Խ����Զ�����"
	read cp
	
	if [ $cp -eq 0 ]
       	then
		echo "�����Զ�����."
		unix2dos sc*.tex
		break
	else
		touch sc0$sc.tex
		read -p "����: " scname

		echo "\\section{${scname}}" > sc0$sc.tex
		echo "" >> sc0$sc.tex
		for ((i=1; i<=cp; ++i))
		do
			scname=""
			read -p "��${i}����: " scname
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

