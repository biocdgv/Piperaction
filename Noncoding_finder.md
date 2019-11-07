
# Getting those coding RNAs's, lncRNAs's and their partnerRNA transcripts 's sequences with several coding potential tools

<font size="4">This is a general script that will help you obtain a coding and non-coding transcriptome, evaluated by several coding potential tools, to be further annotated.</font>

# Content:

* [<font size="4">Required libraries</font>](#Required-libraries):
    <br>

* [<font size="4">PLEK's non-coding and coding transcripts</font>](#PLEK) 
     <br>

* [<font size="4">CPC2's non-coding and coding transcripts</font>](#CPC2)
    <br>

* [<font size="4">PORTRAIT's non-coding and coding transcripts</font>](#PORTRAIT)
    <br>

* [<font size="4">Raw Transcriptome</font>](#raw)
    <br>

* [<font size="4">Main Functions Part 1</font>](#main)
    <br>
    
* [<font size="4">FEELnc: identifying long non-coding RNAs (lncRNAs) </font>](#feel)
    <br>
    
    *  [<font size="4">Main Functions Part 2</font>](#main2)
    <br>    
    
    
*  [<font size="4"> LncRNAs's IDs and their partnerRNA transcripts from genome annotations</font>](#rna)
   <br>
   
   *  [<font size="4">Main Functions Part 3</font>](#main3)
    <br>
    
    
*  [<font size="4">References</font>](#References)
   <br>




<a id="Required-libraries"></a>

# Required libraries


```python
from csv import writer as write
import os
import pandas as pd
from Bio import SeqIO
import numpy as np
base_path= os.getcwd()
```

<div style="text-align: justify"><font size="3">At first those evaluated transcripts with PLEK, CPC2, PORTRAIT, which search for coding potential on the overall transcriptome, need to be converted into dataframes in order to be further manipulated:</font></div>

<a id="PLEK"></a>

# Non-coding and coding transcripts from PLEK (Li et al. 2014):

<font size="3">Convert PLEK's file into a dataframe:</font>


```python
PLEK=pd.read_csv('PLEK/nc_PLEK',sep='\t') 
PP=[PLEK.columns[0],PLEK.columns[2]]
PLEK.columns=['label','s','ID']
PPLEK=PLEK.append({'ID' : PP[1] , 'label' : PP[0]} , ignore_index=True)
PLEK2=PPLEK[['ID','label']]
print(PLEK2.shape)
PLEK2.tail()
```

    (424, 2)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>label</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>419</th>
      <td>&gt;rna_337</td>
      <td>Non-coding</td>
    </tr>
    <tr>
      <th>420</th>
      <td>&gt;rna_338</td>
      <td>Non-coding</td>
    </tr>
    <tr>
      <th>421</th>
      <td>&gt;rna_346</td>
      <td>Non-coding</td>
    </tr>
    <tr>
      <th>422</th>
      <td>&gt;rna_347</td>
      <td>Non-coding</td>
    </tr>
    <tr>
      <th>423</th>
      <td>&gt;idb_0</td>
      <td>Non-coding</td>
    </tr>
  </tbody>
</table>
</div>



<a id="CPC2"></a>

# Non-coding and coding transcripts from CPC2 (Kang et al. 2017):

<font size="3">Convert CPC2's file into a dataframe:</font>


```python
CPC2=pd.read_csv('CPC2/Purp_global', sep="\t",usecols=('#ID','label')) 
CPC2.columns=['ID','label']
print(CPC2.shape)
CPC2.tail()
```

    (424, 2)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>label</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>419</th>
      <td>rna_336</td>
      <td>noncoding</td>
    </tr>
    <tr>
      <th>420</th>
      <td>rna_337</td>
      <td>noncoding</td>
    </tr>
    <tr>
      <th>421</th>
      <td>rna_338</td>
      <td>noncoding</td>
    </tr>
    <tr>
      <th>422</th>
      <td>rna_346</td>
      <td>noncoding</td>
    </tr>
    <tr>
      <th>423</th>
      <td>rna_347</td>
      <td>noncoding</td>
    </tr>
  </tbody>
</table>
</div>



<a id="PORTRAIT"></a>

# Non-coding and coding transcripts from PORTRAIT (Arrial et al. 2009):

<font size="3">Convert PORTRAIT's file into a dataframe:</font>


```python
PORTRAIT= pd.read_csv('PORTRAIT/Purp_global.fasta_results_all.scores',sep=':') 
PR=[PORTRAIT.columns[0],PORTRAIT.columns[1]]
PORTRAIT.columns=['ID','label','score']
PPORTRAIT=PORTRAIT.append({'ID' : PR[0] , 'label' : PR[1]} , ignore_index=True)
PORTRAIT2=PPORTRAIT[['ID','label']]
print(PORTRAIT2.shape)
PORTRAIT2.tail()
```

    (424, 2)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>label</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>419</th>
      <td>&gt;rna_331</td>
      <td>0</td>
    </tr>
    <tr>
      <th>420</th>
      <td>&gt;rna_335</td>
      <td>1</td>
    </tr>
    <tr>
      <th>421</th>
      <td>&gt;rna_336</td>
      <td>0</td>
    </tr>
    <tr>
      <th>422</th>
      <td>&gt;rna_347</td>
      <td>0</td>
    </tr>
    <tr>
      <th>423</th>
      <td>&gt;idb_2</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



<a id="raw"></a>

# Raw Transcriptome:

<font size="3">In the next object called 'Trans', the raw transcriptome, in which it's coding potencial was analyzed, should be stored:</font>


```python
Trans=list(SeqIO.parse(os.path.join(base_path,'raw_assemblies/Purp_global.fasta'),'fasta'))
```

<a id="main"></a>

# Main Functions Part 1:

<div style="text-align: justify"><font size="3"><b>i.</b> Function to distribute coding and non-coding transcripts into separated lists. It receives each program's dataframe, previously generated, and the 'busco' parameter, either 'coding' or 'noncoding', which clarifies what you're looking for, coding or non-coding transcript list, respectively. This function returns a list with the coding or non-coding transcript's identifiers.</font></div>


```python
def decoding(dataframe,busco):
    noncoding_list=[]
    coding_list=[]
    i=0
    f=len(dataframe)
    x=(len(dataframe)-1)
    while i<f:
        a=dataframe.iloc[i]['label']           
        if a=='coding' or a==1:
            coding_list.append(dataframe.iloc[i]['ID'])
            i+=1
        else:
            noncoding_list.append(dataframe.iloc[i]['ID'])
            i+=1
    if i==f and busco=='coding':
        return coding_list
    elif i==f and busco=='noncoding':
        return noncoding_list
```

<div style="text-align: justify"><font size="3"><b>ii.</b> Function to change ID's format from PLEK and PORTRAIT, with means to be comparable with those from CPC2. The only receiving parameter is the spawned list with the function decoding(). It returns a modified list, equivalent with CPC2's IDs.</font></div>


```python
def formatting(lista):
    sepList=[]
    i=0
    n=0
    while i<len(lista):
        sepList.append(lista[i].split()[0].strip('>'))
        i=i+1
    return sepList
```

<font size="3"><b>Coding transcripts lists from each program:</b></font>


```python
cCPC2=decoding(CPC2,'coding')
cPLEK=formatting(decoding(PLEK2,'coding'))
cPORTRAIT=formatting(decoding(PORTRAIT2,'coding'))
```

<font size="3"><b>Coding transcripts lists from each program:</b></font>


```python
ncCPC2=decoding(CPC2,'noncoding')
ncPLEK=formatting(decoding(PLEK2,'noncoding'))
ncPORTRAIT=formatting(decoding(PORTRAIT2,'noncoding'))
```

<div style="text-align: justify"><font size="3"><b>iii.</b> For instance, you should find which list has the minimal length, or no length at all, in order to use it as the threshold for the function concatenate(), likeso:</font></div>


```python
def length(list1,list2,list3):
    le1=len(list1)
    le2=len(list2)
    le3=len(list3)
    if le1==0:
        if le2<le3:
            return 'Caution, list1 equals 0 and list2 has the lowest length'
        else:
            return 'Caution, list1 equals 0 and list3 has the lowest length'
    elif le2==0:
        if le1<le3:
            return 'Caution, list2 equals 0 and list1 has the lowest length'
        else:
            return 'Caution, list2 equals 0 and list3 has the lowest length'
    elif le3==0:
        if le2<le1:
            return 'Caution, list3 equals 0 and list2 has the lowest length'
        else:
            return 'Caution, list3 equals 0 and list1 has the lowest length'
    elif le1<le3 and le1<le2:   
        return 'The list1 has the lowest length'
    elif le2<le3 and le2<le1:
        return 'The list2 has the lowest length'
    else:
        return 'The list3 has the lowest length'    
```

<div style="text-align: justify"><font size="3"><b>iv.</b> Function to concatenate common coding and non-coding lists, from the three outputs of the aforementioned
programs,into two lists, duplicates presence not allowed, concatri(). It receives the three lists, but you should pay attention to their order. The only requirement whatsoever is the first list, that must be the one with the lowest length. In addition, if you noticed with the function length() a list with length 0, you should use instead, the function concadu() for the two lists with non zero length:</font></div>


```python
def concatri(list1,list2,list3):
    l1=len(list1)
    l2=len(list2)
    l3=len(list3)
    final_list=[]
    for i in range(l1):
        for x in range(l2):
            if list1[i]==list2[x]:
                for j in range(l3):
                    if list1[i]==list3[j]:
                        final_list.append(list1[i])
    return final_list 
```


```python
def concadu(list1,list2):
    l1=len(list1)
    l2=len(list2)
    final_list=[]
    for i in range(l1):
        for x in range(l2):
            if list1[i]==list2[x]:
                final_list.append(list1[i])
    return final_list 
```

<font size="3"><b>Identifying common coding transcripts from PLEK,PORTRAIT and CPC2</b></font>


```python
length(cPLEK,cPORTRAIT,cCPC2)
```




    'Caution, list1 equals 0 and list3 has the lowest length'



<font size="3">In the next object called 'Trans', the raw transcriptome, in which it's coding potencial was analyzed, should be stored:</font>


```python
cc=concadu(cCPC2,cPORTRAIT) #cc means common coding transcripts
```

<font size="3"><b>Identifying common non-coding transcripts from PLEK,PORTRAIT and CPC2</b></font>


```python
length(ncPLEK,ncPORTRAIT,ncCPC2)
```




    'The list2 has the lowest length'



<font size="3">As the list2 has the lowest length overall, you should use it with the function concatri(), as the first parameter likeso:</font>


```python
nc=concatri(ncPORTRAIT,ncPLEK,ncCPC2) #nc means common non-coding transcripts
```

<div style="text-align: justify"><font size="3"><b>v.</b> Function to identify those non-coding and coding transcripts in the raw transcriptome. It receives the raw transcriptome and the list with the coding or non-coding sequences IDs. Its output is a list with the coding and non-coding IDs and their respective sequences.</font></div>


```python
def onT(record,lista):
    transcriptome_nc=[]
    f=len(lista)
    i=0
    k=0
    while i<f:
        if  lista[i]==record[k].id:
            a='>'+record[k].id+'\n'+record[k].seq
            a.strip('Seq(')
            transcriptome_nc.append(a)
            i=i+1
            k=0
        else:
            k+=1
    return transcriptome_nc                      
```

<font size="3"><b>Function onT output:</b></font>


```python
cFin=onT(Trans,cc) #list with coding transcripts IDs and sequences.
ncFin=onT(Trans,nc) #list with non-coding transcripts IDs and sequences.
```

<div style="text-align: justify"><font size="3"><b>vi.</b> Function to convert both previously lists, cFin and ncFin, into fasta files. It receives each of these lists and a parameter, which could be: 'coding', 'noncoding' or 'other', meaning which kind of transcriptome is desired:</font></div>


```python
def toFa(lista,param):
    if param=='coding':
        f=open('Coding_global_Transcriptome.fasta','w+')
    elif param=='noncoding':
        f=open('Noncoding_global_Transcriptome.fasta','w+')
    elif param=='other':
        f=open('Other.fasta','w+')
    for i in range(len(lista)):
        f.write((str(lista[i])).strip('.'))
        f.write('\n')
    f.close()
    return 'Transcriptome assembled!'
```

<font size="3"><b>To get the coding global transcriptome:</b></font>


```python
toFa(cFin,'coding') #coding transcriptome in fasta format.
```




    'Transcriptome assembled!'



<font size="3"><b>To get the non-coding global transcriptome:</b></font>


```python
toFa(ncFin,'noncoding') #non-coding transcriptome in fasta format.
```




    'Transcriptome assembled!'



<font size="3"><b>HINT:</b> After getting the non-coding and coding transcriptome, you can continue with downstream analysis for the coding transcriptomes. However, for the non-coding transcripts, it's recommended to continue with this pipeline in order to identify their long non-coding RNAs.</font>

<a id="feel"></a>

# LncRNAs analysis from FEELnc (Wucher et al. 2017):

<font size="3">FEELnc (Wucher et al. 2017), is a software to identify and annotate long non-coding RNAs (lncRNAs) into diferent classes, and regarding their closeness with  neighboring coding genes in a reference genome or with other approaches.</font>

<font size="3">At first, you should load your FEELnc ouput into a dataframe:</font>


```python
FEEL= pd.read_csv('lncClases.txt',sep='\t') 
print(FEEL.shape)
FEEL.head()
```

    (109, 10)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>isBest</th>
      <th>lncRNA_gene</th>
      <th>lncRNA_transcript</th>
      <th>partnerRNA_gene</th>
      <th>partnerRNA_transcript</th>
      <th>direction</th>
      <th>type</th>
      <th>distance</th>
      <th>subtype</th>
      <th>location</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>g2783</td>
      <td>g2783.t1</td>
      <td>g2782</td>
      <td>g2782.t1</td>
      <td>antisense</td>
      <td>intergenic</td>
      <td>2764</td>
      <td>convergent</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>g11234</td>
      <td>g11234.t1</td>
      <td>g11235</td>
      <td>g11235.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>563</td>
      <td>same_strand</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>g10132</td>
      <td>g10132.t1</td>
      <td>g10130</td>
      <td>g10130.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>4628</td>
      <td>same_strand</td>
      <td>upstream</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>g9208</td>
      <td>g9208.t1</td>
      <td>g9207</td>
      <td>g9207.t1</td>
      <td>antisense</td>
      <td>intergenic</td>
      <td>51</td>
      <td>convergent</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>g8889</td>
      <td>g8889.t1</td>
      <td>g8890</td>
      <td>g8890.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>7114</td>
      <td>same_strand</td>
      <td>upstream</td>
    </tr>
  </tbody>
</table>
</div>



<a id="main2"></a>

# Main Functions Part 2:

<div style="text-align: justify"><font size="3"><b>vii.</b> Function to filtrate only good quality lncRNAs. It receives the dataframe and its output are those lncRNAs with the best metrics based upon the variable 'isBest' (Wucher et al. 2017):</font></div>


```python
def Filtering(df):
    data=[]
    for i in range(len(df)):
        if df['isBest'][i]== 1:
            data.append([df['isBest'][i],df['lncRNA_gene'][i],df['partnerRNA_gene'][i],
                        df['partnerRNA_transcript'][i],df['direction'][i],df['type'][i],
                        df['distance'][i],df['subtype'][i],df['location'][i]]) 
    return data
```

<font size="3"><b>Function Filtering output:</b></font>


```python
FIFEEL= pd.DataFrame(Filtering(FEEL), columns = ['isBest','lncRNA_gene','partnerRNA_gene',
                                                 'partnerRNA_transcript','direction','type','distance',
                                               'subtype','location']) 
print(FIFEEL.shape)
FIFEEL.head()
```

    (103, 9)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>isBest</th>
      <th>lncRNA_gene</th>
      <th>partnerRNA_gene</th>
      <th>partnerRNA_transcript</th>
      <th>direction</th>
      <th>type</th>
      <th>distance</th>
      <th>subtype</th>
      <th>location</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>g2783</td>
      <td>g2782</td>
      <td>g2782.t1</td>
      <td>antisense</td>
      <td>intergenic</td>
      <td>2764</td>
      <td>convergent</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>g11234</td>
      <td>g11235</td>
      <td>g11235.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>563</td>
      <td>same_strand</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>g10132</td>
      <td>g10130</td>
      <td>g10130.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>4628</td>
      <td>same_strand</td>
      <td>upstream</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>g9208</td>
      <td>g9207</td>
      <td>g9207.t1</td>
      <td>antisense</td>
      <td>intergenic</td>
      <td>51</td>
      <td>convergent</td>
      <td>downstream</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>g8889</td>
      <td>g8890</td>
      <td>g8890.t1</td>
      <td>sense</td>
      <td>intergenic</td>
      <td>7114</td>
      <td>same_strand</td>
      <td>upstream</td>
    </tr>
  </tbody>
</table>
</div>



<div style="text-align: justify"><font size="3"><b>viii.</b> Function to create a new file with specific characteristics from the output of FEELnc. It receives the filtered dataframe from the function filtering(), and the specific column's data to get.</font></div>


```python
def toTxt(df,column):
    f=open('Output_FEEL_lncRNAs.txt','w+')
    for i in range(len(df)):
        f.write(df[column][i])
        f.write('\n')
    f.close()
    return 'Dataframe to STRING'
```

<div style="text-align: justify"><font size="3"><b> Example with the function toTxt(), to get the IDs of the column 'partnerRNA_transcript' from the filtered dataframe FIFEEL:</b></font></div>


```python
toTxt(FIFEEL,'partnerRNA_transcript')
```




    'Dataframe to STRING'



<a id="rna"></a>

# Getting lncRNAs IDs's  and their partnerRNA transcripts's (PRNAs) sequences from the genome annotations:

<font size="3">First, load the fasta file from the genome annotation into a list likeso:</font>


```python
Anno=list(SeqIO.parse(os.path.join(base_path,'SeqsFromGFF/protein.fa'),'fasta'))
```

<font size="3">Then, build a new dataframe but only using the good quality FEELnc IDs created before:</font>


```python
FEELpd=pd.read_csv('Output_FEEL_lncRNAs.txt')
FF=FEELpd.columns[0]
FEELpd.columns=['partnerRNA_transcript']
PT=FEELpd.append({'partnerRNA_transcript' : FF} , ignore_index=True)
print(PT.shape)
PT.head()
```

    (103, 1)





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>partnerRNA_transcript</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>g11235.t1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>g10130.t1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>g9207.t1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>g8890.t1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>g7644.t1</td>
    </tr>
  </tbody>
</table>
</div>



<a id="main3"></a>

# Main Functions Part 3:

<div style="text-align: justify"><font size="3"><b>ix.</b> Function to  convert a specific column from the FEELnc dataframe previously chosen, into  a list in order to find their sequences in the provided reference genome.</font></div>


```python
def dftoList(df,column):
    Lista=[]
    for i in range(len(df)):
        Lista.append(df[column][i])
    return (Lista)
```

**Output function dftoList**:


```python
LiPT=dftoList(PT,'partnerRNA_transcript')
```

<div style="text-align: justify"><font size="3"><b>x.</b> Finally, a new object, ncTrans, will be generated with the next function, onG(). It looks for the specific IDs from the list brought by the function dftoList, in the genome annotation file. Its output is a new list having the desired ID's with their respective sequences alongside.</font></div>


```python
def onG(record,lista):
    transcriptome_nc=[]
    f=len(lista)
    i=0
    k=0
    while i<f:
        if  lista[i]==(record[k].id).strip('.t1') or lista[i]==(record[k].id):
            a='>'+record[k].id+'\n'+record[k].seq
            a.strip('Seq(')
            transcriptome_nc.append(a)
            k=0
            i+=1
        else:
            if k==len(Anno)-1:
                i+=1
                k=0
            else:
                k+=1       
    return transcriptome_nc          
```


```python
ncTrans=onG(Anno,LiPT)
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-13-12cbdb293a88> in <module>
    ----> 1 ncTrans=onG(Anno,LiPT)
    

    NameError: name 'LiPT' is not defined


<font size="3">Finally, you should put these IDs and sequences in a fasta file format.At the end, you should have a fasta file with either the lncRNAs sequences or the PRNAs sequences to be further analyzed. 
</font>


```python
toFa(ncTrans,'other')
```




    'Transcriptome assembled!'



<font size="3">This script was made by @biocdgv (Embudo_), with aid from the different available coding potential tools mentioned below. </font>

# References

1.Arrial, R. T., Togawa, R. C., & de M Brigido, M. (2009). Screening non-coding RNAs in transcriptomes from neglected species using PORTRAIT: case study of the pathogenic fungus Paracoccidioides brasiliensis. BMC bioinformatics, 10(1), 239.

2.Li, A., Zhang, J., & Zhou, Z. (2014). PLEK: a tool for predicting long non-coding RNAs and messenger RNAs based on an improved k-mer scheme. BMC bioinformatics, 15(1), 311.

3.Kang, Y. J., Yang, D. C., Kong, L., Hou, M., Meng, Y. Q., Wei, L., & Gao, G. (2017). CPC2: a fast and accurate coding potential calculator based on sequence intrinsic features. Nucleic acids research, 45(W1), W12-W16.

4.Wucher, V., Legeai, F., Hedan, B., Rizk, G., Lagoutte, L., Leeb, T., ... & Cirera, S. (2017). FEELnc: a tool for long non-coding RNA annotation and its application to the dog transcriptome. Nucleic acids research, 45(8), e57-e57.

5.Kumar, H., Srikanth, K., Park, W., Lee, S. H., Choi, B. H., Kim, H., ... & Jung, J. Y. (2019). Transcriptome analysis to identify long non coding RNA (lncRNA) and characterize their functional role in back fat tissue of pig. Gene, 703, 71-82.

