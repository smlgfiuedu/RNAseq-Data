To clean up RNA-Seq dataset, you need follow below steps, download and install some tools:

a. HISAT2 (https://ccb.jhu.edu/software/hisat2/manual.shtml), updated to https://daehwankimlab.github.io/hisat2/
b. htseq-count (http://htseq.readthedocs.io/en/release_ ... stall.html)
c. ftp://ftp.ensembl.org/pub/release-91/gtf/homo_sapiens/



1. Download HISAT2 from HISAT2 website [url] https://daehwankimlab.github.io/hisat2/[/url]. At right hand of the page, you could find a “Releases” section and then download the version you need.

2. Extract it in a directory, for example: ~/ HISAT2

3. Download index from same web page: [url]https://ccb.jhu.edu/software/hisat2/manual.shtml[/url]. In the “Indexes” section, you could see lots of index, then you select one. I use “genome”. Then you download it and extract it to your local directory, for example: ~/ grch38.

4. Create an array of SRR files 
[code]
my_array=(SRR files)
for i in "${my_array[@]}";
do
   ~/HISAT2/hisat2 -x ~/grch38/genome --sra-acc $i -S ~/${i}_SAM.sam
   python3 -m HTSeq.scripts.count -m intersection-nonempty -s no -i gene_id ~/${I}_SAM.sam ~/Homo_sapiens.GRCh38.104.gtf -o ~/${I}_SAM_Outputfile.samout > ~/${I}_SAM_Outputfile_Counts.txt
done
[/code]

You need to change the following items:
1. ~/${i}_SAM.sam: is the directory which your .sam file is in.
2. ~/grch38/genome: is the index you extracted. need to change it to the actual directory.
3. ~/...: need to change it to actual directory


