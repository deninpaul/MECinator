#include <bits/stdc++.h>

int nrep, nhostel, nplace, nregion, nhouse,nschool, nrel, ngen, nclas, nds, nspecs, nsinger, ndancer, nprogrammer;

using namespace std;
struct per
{
    per *next = NULL;
    per *prev = NULL;
    char name[30];
    char hostel[20];
    char clas[4];
    char gen[2];
    char place[30];
    char school[30];
    char rep[2];
    char house[2];
    char region[2];
    char ds[2];
    char rel[10];
    char specs[2];
    char singer[2];
    char dancer[2];
    char programmer[2];
    char skill[100];
};

per *top = NULL;
per *last = NULL;
char row[20], rowitem[20], value[30], lastrow[20], lastvalue[20];

void mkp(char name[], char hostel[], char gen[], char clas[], char place[], char rep[], char house[], char rel[],char school[], char ds[], char specs[], char singer[], char dancer[], char programmer[])
{
    per *ptr = new per;
    if (top == NULL && last == NULL)
    {
        top = ptr;
        last = ptr;
        last->next = NULL;
        last->prev = NULL;
    }
    else
    {
        last->next = ptr;
        ptr->prev = last;
        last = ptr;
        last->next = NULL;
    }

    strcpy(ptr->name, name);
    strcpy(ptr->hostel, hostel);
    strcpy(ptr->clas, clas);
    strcpy(ptr->place, place);
    if (strcmp(ptr->place, "Kasargode") == 0 || strcmp(ptr->place, "Kannur") == 0 || strcmp(ptr->place, "Kozhikode") == 0 || strcmp(ptr->place, "Wayanad") == 0 || strcmp(ptr->place, "Malapuram") == 0 || strcmp(ptr->place, "Palakad") == 0)
        strcpy(ptr->region, "N");
    if (strcmp(ptr->place, "Thrissur") == 0 || strcmp(ptr->place, "Ernakulam") == 0 || strcmp(ptr->place, "Idukki") == 0 || strcmp(ptr->place, "Kottayam") == 0 || strcmp(ptr->place, "Alapuzha") == 0 || strcmp(ptr->place, "Pathanamthitaa") == 0)
        strcpy(ptr->region, "M");
    if (strcmp(ptr->place, "Kollam") == 0 || strcmp(ptr->place, "Thiruvananthapuram") == 0)
        strcpy(ptr->region, "S");
    strcpy(ptr->house, house);
    strcpy(ptr->gen, gen);
    strcpy(ptr->rep, rep);
    strcpy(ptr->ds, ds);
    strcpy(ptr->rel, rel);
    strcpy(ptr->school,school);
    strcpy(ptr->specs, specs);
    strcpy(ptr->singer, singer);
    strcpy(ptr->dancer, dancer);
    strcpy(ptr->programmer, programmer);
    // strcpy(ptr->skill,skill);
}

void rmp(per *a)
{
    per *x, *y;
    if (a == top)
    {
        top = top->next;
        top->prev = NULL;
    }
    else if (a == last)
    {
        last = last->prev;
        last->next = NULL;
    }
    else if (a == top && a == last)
    {
        cout << "Something's wrong";
        // exit(0);
    }
    else
    {
        x = a->prev;
        y = a->next;
        x->next = y;
        y->prev = x;
    }
}

void insertData()
{
mkp("Deon Joshy", "Aneeta", "M", "CSA", "Ernakulam", "n", "T", "christian","St.George HSS", "n", "n", "y", "y", "n");
    mkp("Tom Vempala", "Aneeta", "M", "CSA", "Kottayam", "n", "T", "christian","Kendriya Vidyalaya", "n", "n", "n", "n", "y");
    mkp("Karthika R", "Vimala", "F", "CSA", "Kottayam", "n", "R", "hindu","SFS Public School", "n", "n", "n", "n", "n");
    mkp("Poorab Shenoy", "MH", "M", "CSA", "Kannur", "n", "A", "hindu","Chinmaya Vidyalaya", "n", "n", "n", "n", "n");
    mkp("Sahil Sait", "Backer", "M", "CSA", "Kannur", "n", "S", "muslim","Chavara", "n", "n", "n", "n", "n");
    mkp("Royce Elson", "RR", "M", "CSA", "Ernakulam", "n", "R", "christian","Chavara", "n", "y", "n", "y", "n");
    mkp("Sharat Jacob Jacob", "Aneeta", "M", "CSB", "Kottayam", "n", "S", "christian","The Indian School", "n", "y", "n", "n", "y");
    mkp("Gayathry S", "Nava Jyoti", "F", "CSA", "Ernakulam", "n", "D", "hindu","Saraswathi Vidyanikethan", "n", "n", "n", "y", "n");
    mkp("Roy Jose", "RR", "M", "CSA", "Ernakulam", "n", "D", "christian","SAPS", "n", "n", "n", "n", "n");
    mkp("Navaneeth S Nair", "MH", "M", "CSB", "Palakad", "n", "T", "hindu","SAPS", "n", "y", "n", "n", "n");
    mkp("Vineeth M Vinoy", "Aneeta", "M", "CSA", "Ernakulam", "n", "R", "christian","SAPS", "n", "n", "n", "y", "y");
    mkp("Anand V", "RR", "M", "CSA", "Ernakulam", "n", "T", "hindu","Kailasanadha", "n", "n", "n", "n", "n");
    mkp("Shimil Abraham", "Better Homes", "M", "CSA", "Kozhikode", "n", "R", "christian","Auxilium Nava Jyoti", "n", "n", "n", "n", "y");
    mkp("Syyed Anwar", "Some other PG", "M", "CSB", "Pathanamthitaa", "n", "R", "muslim","Kendriya Vidyalaya", "n", "n", "n", "n", "n");
    mkp("Nayana Vinod", "Udaya", "F", "CSB", "Kottayam", "n", "D", "hindu","Chavara", "n", "n", "y", "n", "y");
    mkp("Tony Augustine", "Some other PG", "M", "CSB", "Ernakulam", "y", "S", "christian","Co-operative Public School", "n", "n", "n", "n", "y");
    mkp("Gokulnath M Prabhu", "Some other PG", "M", "CSB", "Alapuzha", "n", "R", "hindu","St Joseph Public School", "n", "y", "n", "n", "n");
    mkp("Aleena Baby", "YMCA", "F", "CSB", "Idukki", "y", "D", "christian","Placid", "n", "n", "n", "y", "n");
    mkp("Sidharth S", "Some other PG", "M", "CSA", "Idukki", "y", "S", "hindu","Vimala", "n", "n", "y", "n", "y");
    mkp("Tiss Joseph", "YMCA", "F", "CSB", "Kottayam", "n", "D", "christian","Placid", "n", "n", "n", "y", "n");
    mkp("Anjali Rajendran ", "Udaya", "F", "CSA", "Kannur", "n", "D", "hindu","Chavara", "n", "n", "n", "n", "n");
    mkp("Shweta Jayan", "YMCA", "F", "CSA", "Thiruvananthapuram", "y", "T", "hindu","St. Thomas", "n", "n", "y", "y", "n");
    mkp("Arun Sojan", "Some other PG", "M", "CSB", "Kottayam", "n", "S", "christian","Good Shepherd", "n", "y", "n", "n", "y");
    mkp("Anjali Parapattu", "YMCA", "F", "CSB", "Ernakulam", "n", "A", "christian","Mar Athanasius", "n", "n", "n", "n", "n");
    mkp("Bharath Raj R", "Shamla", "M", "CSA", "Kollam", "n", "S", "hindu","SAPS", "n", "y", "y", "n", "n");
    mkp("Denin Paul", "Aneeta", "M", "CSB", "Thrissur", "n", "T", "christian","CMI", "n", "y", "n", "n", "y");
    mkp("George Sabu", "Aneeta", "M", "CSB", "Kottayam", "n", "T", "christian","Kendriya Vidyalaya", "n", "n", "n", "n", "y");
    mkp("Abiram P", "Some other PG", "M", "CSB", "Kozhikode", "n", "A", "hindu","St Thomas", "n", "n", "n", "n", "n");
    mkp("Joel Joshua", "MH", "M", "CSA", "Kasargode", "n", "A", "christian", "Chavara", "n", "y", "n", "n", "n");
    mkp("Neeraj Hari", "Some other PG", "M", "CSA", "Alapuzha", "n", "T", "hindu","Kendriya Vidyalaya", "n", "y", "n", "n", "n");
    mkp("Akhil Prem", "Some other PG", "M", "CSB", "Kannur", "y", "D", "hindu","Bharatiya Vidya Bhavan", "n", "n", "n", "n", "n");
    mkp("Jomey J James", "MH", "M", "CSB", "Thiruvananthapuram", "n", "A", "christian","KE", "n", "y", "n", "n", "n");
    mkp("Gopika G", "Vimala", "F", "CSB", "Kottayam", "n", "R", "hindu","Govt. Girls HSS", "n", "n", "n", "n", "n");
    mkp("Ashish Mathew Philip", "MH", "M", "CSB", "Thiruvananthapuram", "n", "A", "christian","SAPS", "n", "n", "y", "n", "y");
    mkp("Sebin Davis", "MH", "M", "CSB", "Ernakulam", "n", "A", "christian","SAPS", "n", "n", "n", "n", "y");
    mkp("Abraham Jacob", "MH", "M", "CSA", "Kannur", "y", "A", "christian","SAPS", "n", "y", "n", "n", "n");
    mkp("Deepak Sembakam", "Aneeta", "M", "CSA", "Kottayam", "y", "R", "christian","SAPS", "n", "n", "n", "n", "n");
    mkp("Balu U R", "MH", "M", "CSB", "Malapuram", "y", "A", "hindu","Govt. HSS", "n", "n", "n", "n", "n");
    mkp("Vikas P Nambiar", "MH", "M", "CSB", "Kannur", "y", "A", "hindu","St.Vincent", "n", "n", "n", "n", "n");
    mkp("Nikita Menon", "Udaya", "F", "CSB", "Thrissur", "n", "S", "hindu","Sacred Heart CMI Public School", "n", "n", "y", "n", "y");
    mkp("Ansaf Muhammed", "MH", "M", "CSB", "Kannur", "y", "A", "muslim","Kendriya Vidyalaya", "n", "y", "n", "n", "n");
    mkp("Jerin Tom", "RR", "M", "CSA", "Kottayam", "n", "T", "christian","Placid", "n", "n", "n", "n", "n");
    mkp("Anjana Sudevan", "YMCA", "F", "CSA", "Kozhikode", "n", "S", "hindu","Silver Hills", "n", "y", "n", "n", "n");
    mkp("Nihitha  S", "Nava Jyoti", "F", "CSA", "Idukki", "n", "T", "hindu","Vimala", "n", "n", "n", "n", "n");
    mkp("Meghana O P", "Nava Jyoti", "F", "CSB", "Ernakulam", "n", "T", "hindu","", "n", "n", "n", "y", "y");
    mkp("Jagath Jijo", "Sky Blue", "M", "CSB", "Kottayam", "n", "T", "hindu","Chavara", "n", "y", "n", "n", "y");
    mkp("Faheem P P ", "Shamla", "M", "CSA", "Malapuram", "n", "D", "muslim","Hyderabad", "n", "n", "n", "n", "n");
    mkp("Ashwin Girish", "MH", "M", "CSA", "Pathanamthitaa", "y", "A", "hindu","", "n", "n", "n", "n", "n");
    mkp("Sreeram Vinaykumar", "MH", "M", "CSA", "Kozhikode", "n", "A", "hindu","SAPS", "n", "n", "n", "n", "n");
    mkp("Muflih Ali K P", "Better Homes", "M", "CSB", "Kozhikode", "n", "S", "muslim","Spring Valley", "n", "n", "n", "n", "n");
    mkp("Sreelal K", "Some other PG ", "M", "CSB", "Malapuram", "n", "R", "hindu","", "n", "n", "n", "n", "n");
    mkp("Nithin Antony", "Aneeta", "M", "CSB", "Alapuzha", "n", "T", "christian","Holy Family", "n", "n", "n", "n", "n");
    mkp("Govind Gayathri", "Aneeta", "M", "CSA", "Thiruvananthapuram", "y", "A", "hindu","Kendriya Vidyalaya", "n", "n", "y", "n", "y");
    mkp("Alen J Ninan", "RR", "M", "CSB", "Malapuram", "n", "S", "christian","Placid", "n", "n", "n", "n", "n");
    mkp("Sunny James", "MH", "M", "CSB", "Kottayam", "n", "A", "christian","Placid", "n", "n", "n", "n", "n");
    


    ///DS
    mkp("Gokul Sagar", "NIL", "M", "CSA", "Ernakulam", "n", "T", "hindu","KE", "y", "n", "n", "n", "n");
    mkp("Khushi Shah", "NIL", "F", "CSA", "Ernakulam", "n", "S", "hindu","Navy Children School", "y", "n", "n", "n", "n");
    mkp("Hemanth R", "NIL", "M", "CSA", "Ernakulam", "n", "A", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    mkp("Aneetta Mary Sajan", "NIL", "F", "CSA", "Ernakulam", "n", "R", "christian","Navy Children School ", "y", "y", "n", "n", "n");
    mkp("Muhammed Abnan M S ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "muslim","SAPS", "y", "y", "n", "n", "n");
    mkp("Kevin Abraham", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","Toc H", "y", "y", "n", "n", "n");
    mkp("Pranav Jayashankar", "NIL", "M", "CSA", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "n", "y", "n", "y");
    mkp("Alan Phlipose N.V ", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","RCJPS", "y", "n", "n", "n", "n");
    mkp("Anagha S Menon", "NIL", "F", "CSA", "Ernakulam", "n", "T", "hindu","Chinmaya Vidyalaya", "y", "n", "n", "n", "n");
    mkp("Elizabeth Mary Mathew", "NIL", "F", "CSA", "Ernakulam", "n", "D", "christian","Chinmaya Vidyalaya", "y", "n", "n", "n", "y");
    mkp("Noel Eldho", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Mary's", "y", "y", "n", "n", "n");
    mkp("Vishruth S", "NIL", "M", "CSA", "Ernakulam", "n", "S", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    mkp("Ebin Bigi", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Chavara", "y", "y", "n", "n", "n");
    mkp("Angela Tony", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Toc H", "y", "n", "n", "n", "n");
    mkp("Jessica jolly", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Choice school", "y", "n", "n", "n", "n");
    mkp("Nikhil George Mathew ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Assisi Vidyaniketan Public school ", "y", "y", "n", "n", "n");
    mkp("Deepaklal T A", "NIL", "M", "CSA", "Ernakulam", "n", "D", "hindu","Infant Jesus", "y", "n", "n", "n", "n");
    mkp("Joel Joseph Jude", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Sebastian's hss, palluruthi", "y", "n", "n", "n", "n");
    mkp("Anitha S Menon", "NIL", "F", "CSA", "Ernakulam", "n", "S", "hindu","Saraswathi Vidyanikethan", "y", "y", "n", "n", "n");
    mkp("Ashique Ali P S", "NIL", "M", "CSA", "Ernakulam", "n", "D", "muslim","Sacred Heart CMI Public School", "y", "y", "n", "n", "n");
    mkp("Arjun Sudheer ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "hindu","Choice School", "y", "y", "n", "n", "n");
    mkp("Jabira Farhath ", "NIL", "F", "CSA", "Ernakulam", "n", "D", "muslim","SNDP HSS Aluva", "y", "n", "n", "n", "n");
    mkp("Diya Naushad", "NIL", "F", "CSA", "Ernakulam", "n", "R", "muslim","Bhavan's Vidya Mandir", "y", "n", "n", "y", "n");
    mkp("PJ Aravind", "NIL", "M", "CSB", "Ernakulam", "y", "R", "hindu","KE", "y", "n", "n", "n", "n");
    mkp("Gouri Hariharan", "NIL", "F", "CSB", "Ernakulam", "n", "R", "hindu","Gregorian Public School", "y", "n", "n", "y", "n");
    mkp("Vaishnav R", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "n", "y", "y", "n");
    mkp("Navaneeth R", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    mkp("Rahul S Kumar", "NIL", "M", "CSB", "Ernakulam", "n", "A", "hindu","S. T Vincent", "y", "n", "n", "y", "n");
    mkp("Adarsh R", "NIL", "M", "CSB", "Ernakulam", "n", "D", "hindu","Kendriya Vidyalaya", "y", "n", "n", "n", "n");
    mkp("Joseph Dominic Mathew", "NIL", "M", "CSB", "Ernakulam", "y", "R", "christian","St. Joseph's HSS Pulicunnu", "y", "n", "n", "n", "n");
    mkp("Amith Raveendranath", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "y", "y", "y", "n");
    mkp("Nikhil P S", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","SNDPHSS Udayamperoor", "y", "n", "n", "n", "n");
    mkp("Arjun Sarma", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","Toc H", "y", "n", "y", "y", "n");
    mkp("Steve Sam Jacob", "NIL", "M", "CSB", "Ernakulam", "n", "R", "christian","RCJPS", "y", "n", "y", "n", "n");
    mkp("Pranoy Santhosh M", "NIL", "M", "CSB", "Ernakulam", "y", "D", "hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    mkp("Aldrin Jenson", "NIL", "M", "CSB", "Ernakulam", "n", "T", "christian","Kendriya Vidyalaya", "y", "n", "y", "y", "y");
    mkp("Muhammed Razeen V", "NIL", "M", "CSB", "Ernakulam", "n", "R", "muslim","Bhavan's Vidya Mandir", "y", "n", "n", "n", "y");
    mkp("Nevin Manoj", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Greets Public School", "y", "n", "n", "n", "n");
    mkp("V S Sreeram ", "NIL", "M", "CSB", "Ernakulam", "y", "R", "hindu","Rajashree S M Memorial School ", "y", "n", "y", "n", "n");
    mkp("Pranav H. Nair ", "NIL", "M", "CSB", "Ernakulam", "n", "D", "hindu","RCJPS", "y", "y", "n", "n", "y");
    mkp("Tony Augustine", "NIL", "M", "CSB", "Ernakulam", "y", "S", "christian","Co-operative Public School", "y", "n", "n", "n", "n");
    mkp("Adithya Anilkumar", "NIL", "M", "CSB", "Ernakulam", "n", "A", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    mkp("Thomas john", "NIL", "M", "CSB", "Ernakulam", "n", "S", "christian","Peters Senior Secondary School", "y", "n", "n", "n", "n");
    mkp("Tobin abraham", "NIL", "M", "CSB", "Ernakulam", "y", "D", "christian","RCJPS", "y", "n", "n", "n", "y");
    mkp("Gautham S Baiju", "NIL", "M", "CSB", "Ernakulam", "n", "T", "hindu","RCJPS", "y", "n", "n", "n", "n");
    mkp("Aravind P Sabu", "NIL", "M", "CSB", "Ernakulam", "n", "T", "hindu","Choice School", "y", "n", "y", "y", "n");
    mkp("Krishnendu Nambiar", "NIL", "F", "CSB", "Ernakulam", "n", "T", "hindu","Navy Children School", "y", "n", "y", "y", "n");
    mkp("Devanarayan J", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Vidyodaya  ", "y", "n", "n", "n", "y");
    mkp("Farhath Sulthana Jamal", "NIL", "F", "CSB", "Ernakulam", "y", "D", "muslim","St. Paul's Bethany Public School ", "y", "y", "n", "n", "n");
    mkp("Vishnu Vinod","NIL","M","CSA","Ernakulam","n","R","hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    mkp("Dona Yeldo","NIL","F","CSA","Ernakulam","y","A","christian","MA, Puthenkurish", "y", "n", "n", "y", "n");
    mkp("Arti Bhatia","NIL","F","CSA","Ernakulam","n","T","hindu","Kendriya Vidyalaya", "y", "n", "n", "y", "y");
    mkp("Thomas SJ","NIL","M","CSA","Ernakulam","n","R","christian","Saraswathi Vidyanikethan", "y", "y", "n", "n", "n");

}

int count()
{
    int i;
    per *ptr;
    for (i = 0, ptr = top; ptr != NULL; ptr = ptr->next)
        i++;
    return i;
}
void findrow()
{
    per *ptr;
    ptr = top;
    int max = 10000, half = count() / 2;
    //cout<<half;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->hostel, ptr->hostel) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nhostel != 0) && strcmp(ptr->hostel, "NIL") != 0)
        {
            max = abs(half - c);
            strcpy(row, "hostel");
            strcpy(value, ptr->hostel);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->house, ptr->house) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max)&& (nhouse != 0))
        {
            max = abs(half - c);
            strcpy(row, "house");
            strcpy(value, ptr->house);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->school, ptr->school) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nschool != 0))
        {
            max = abs(half - c);
            strcpy(row, "school");
            strcpy(value, ptr->school);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->clas, ptr->clas) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max)&& (nclas != 0))
        {
            max = abs(half - c);
            strcpy(row, "clas");
            strcpy(value, ptr->clas);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->gen, ptr->gen) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (ngen != 0))
        {
            max = abs(half - c);
            strcpy(row, "gen");
            strcpy(value, ptr->gen);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->region, ptr->region) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nregion != 0))
        {
            max = abs(half - c);
            strcpy(row, "region");
            strcpy(value, ptr->region);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->ds, ptr->ds) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max)  && (nds != 0))
        {
            max = abs(half - c);
            strcpy(row, "ds");
            strcpy(value, ptr->ds);
        }
        ptr = ptr->next;
    }

    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->rel, ptr->rel) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nrel != 0))
        {
            max = abs(half - c);
            strcpy(row, "rel");
            strcpy(value, ptr->rel);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->rep, ptr->rep) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) &&  (nrep != 0))
        {
            max = abs(half - c);
            strcpy(row, "rep");
            strcpy(value, ptr->rep);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->place, ptr->place) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nplace != 0))
        {
            max = abs(half - c);
            strcpy(row, "place");
            strcpy(value, ptr->place);
        }
        ptr = ptr->next;
    }
    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->specs, ptr->specs) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nspecs != 0))
        {
            max = abs(half - c);
            strcpy(row, "specs");
            strcpy(value, ptr->specs);
        }
        ptr = ptr->next;
    }

    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->singer, ptr->singer) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max)  && (nsinger != 0))
        {
            max = abs(half - c);
            strcpy(row, "singer");
            strcpy(value, ptr->singer);
        }
        ptr = ptr->next;
    }

    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->dancer, ptr->dancer) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (ndancer != 0))
        {
            max = abs(half - c);
            strcpy(row, "dancer");
            strcpy(value, ptr->dancer);
        }
        ptr = ptr->next;
    }

    ptr = top;
    while (ptr != NULL)
    {
        per *pp = top;
        int c = 0;
        while (pp != NULL)
        {
            if (strcmp(pp->programmer, ptr->programmer) == 0)
                c++;
            pp = pp->next;
        }
        if ((abs(half - c) <= max) && (nprogrammer != 0))
        {
            max = abs(half - c);
            strcpy(row, "programmer");
            strcpy(value, ptr->programmer);
        }
        ptr = ptr->next;
    }

    if (strcmp(lastrow, row) == 0 && strcmp(lastvalue, value) == 0)
    {
        cout << "Insufficient Data" << endl;
        strcpy(row, "done");
    }
   // strcpy(lastrow, row);
   //strcpy(lastvalue, value);
   //cout<<"Best row: "<<row<<endl<<"Value: "<<value<<endl<<"delta: "<<max<<endl;
}

int main()
{
    char choice;
    char x, da[14], regg[10] = "North";
    per *person, *ppp;
    do
    {
        nrep = 1;
        nhostel = 1;
        nds = 1;
        nplace = 1;
        nregion = 1;
        nhouse = 1;
        nclas = 0;
        nschool=1;
        ngen = 1;
        nrel = 1;
        nspecs = 1;
        nsinger = 1;
        ndancer = 1;
        nprogrammer = 1;
        strcpy(da, "the person");
        top = NULL;
        last = NULL;
        insertData();
        if (rand() % 2 == 0)
        {
            cout << "Does " << da << " study in CSA?" << endl;
            cin >> x;
            if (x == 'y')
            {
                for (person = top; person != NULL; person = person->next)
                {
                    if (strcmp(person->clas, "CSB") == 0)
                    {
                        rmp(person);
                    }
                }
            }
            else
            {
                for (person = top; person != NULL; person = person->next)
                {
                    if (strcmp(person->clas, "CSA") == 0)
                    {
                        rmp(person);
                    }
                }
            }
        }
        else
        {
            cout << "Is " << da << " a student of CSB?" << endl;
            cin >> x;
            if (x == 'y')
            {
                for (person = top; person != NULL; person = person->next)
                {
                    if (strcmp(person->clas, "CSA") == 0)
                    {
                        rmp(person);
                    }
                }
            }
            else if(x =='n')
            {
                for (person = top; person != NULL; person = person->next)
                {
                   if (strcmp(person->clas, "CSB") == 0)
                    {
                        rmp(person);
                    }
                }
            }
        }
        while (count() != 1)
        {
           for(ppp=top;ppp!=NULL;ppp=ppp->next)
                cout<<ppp->name<<endl;
            findrow();
            if (strcmp(row, "done") == 0)
                break;
            else if (strcmp(row, "clas") == 0)
            {
                cout << "Does " << da << " stay at " << value << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nclas = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->clas, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }

                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->clas, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nclas = 0;
                }
            }
            else if (strcmp(row, "gen") == 0)
            {
                if (strcmp(value, "M") == 0)
                    strcpy(regg, "Male");
                else
                    strcpy(regg, "Female");
                cout << "Is " << da << " a " << regg << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    ngen = 0;
                    if (strcmp(regg, "Male") == 0)
                        strcpy(da, "he");
                    else
                        strcpy(da, "she");
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->gen, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    ngen = 0;
                    if (strcmp(regg, "Male") == 0)
                        strcpy(da, "she");
                    else
                        strcpy(da, "he");
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->gen, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    ngen = 0;
                }
            }
            else if (strcmp(row, "hostel") == 0)
            {
                if (strcmp(value, "Some other PG") == 0)
                    cout << "Does " << da << " stay at any PG other than RR"<<endl;
                else
                    cout << "Does " << da << " stay at " << value << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nhostel = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->hostel, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }

                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->hostel, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nhostel = 0;
                }
            }
            else if (strcmp(row, "rel") == 0)
            {
                cout << "Is " << da << " a " << value << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nrel = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->rel, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->rel, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nrel = 0;
                }
            }
            else if (strcmp(row, "school") == 0)
            {
                cout << "Did " << da << " study 12th at " << value << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nschool = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->school, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->school, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nschool = 0;
                }
            }
            else if (strcmp(row, "place") == 0)
            {
                cout << "Is " << da << " from " << value << " ?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nplace = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->place, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->place, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nplace = 0;
                }
            }
            else if (strcmp(row, "region") == 0)
            {
                if (strcmp(value, "M") == 0)
                    strcpy(regg, "Middle");
                else if (strcmp(value, "N") == 0)
                    strcpy(regg, "North");
                else
                    strcpy(regg, "South");
                cout << "Is " << da << " from " << regg << " Kerala?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nregion = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->region, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->region, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nregion = 0;
                }
            }
            else if (strcmp(row, "house") == 0)
            {
                if (strcmp(value, "T") == 0)
                    strcpy(regg, "Thandava");
                else if (strcmp(value, "S") == 0)
                    strcpy(regg, "Samhara");
                else if (strcmp(value, "R") == 0)
                    strcpy(regg, "Rakshasa");
                else if (strcmp(value, "D") == 0)
                    strcpy(regg, "Dhruva");
                else
                    strcpy(regg, "Aryans");
                cout << "Is " << da << " a memeber of " << regg << " House?" << endl;
                cin >> x;
                if (x == 'y')
                {
                    nhouse = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->house, value) != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->house, value) == 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nhouse = 0;
                }
            }
            else if (strcmp(row, "rep") == 0)
            {
                cout << "Is " << da << " a repeater ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    nrep = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->rep, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    nrep = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->rep, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nrep = 0;
                }
            }
            else if (strcmp(row, "ds") == 0)
            {
                cout << "Is " << da << " a day-scholar ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    nhostel = 0;
                    nds = 0;
                    nplace = 0;
                    nregion=0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->ds, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    nds = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->ds, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nds = 0;
                }
            }
            else if (strcmp(row, "specs") == 0)
            {
                cout << "Does " << da << " wear spectacles ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    nspecs = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->specs, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    nspecs = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->specs, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
            }
            else if (strcmp(row, "singer") == 0)
            {
                cout << "Is " << da << " a singer ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    nsinger = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->singer, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    nsinger = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->singer, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nsinger = 0;
                }
            }
            else if (strcmp(row, "dancer") == 0)
            {
                cout << "Is " << da << " a dancer ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    ndancer = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->dancer, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    ndancer = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->dancer, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    ndancer = 0;
                }
            }
            else if (strcmp(row, "programmer") == 0)
            {
                cout << "Is " << da << " a really good programmer ?" << endl;
                ;
                cin >> x;
                if (x == 'y')
                {
                    nprogrammer = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->programmer, "y") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else if (x == 'n')
                {
                    nprogrammer = 0;
                    for (person = top; person != NULL; person = person->next)
                    {
                        if (strcmp(person->programmer, "n") != 0)
                        {
                            rmp(person);
                        }
                    }
                }
                else
                {
                    nprogrammer = 0;
                }
            }
            /*  for(pvalueo here  */
        }

        if (strcmp(row, "done") != 0)
        {
            cout << "\n\nYou were thinking of :" << top->name << endl
                 << endl;
        }

        cout << "Do you want to continue? (y/n)" << endl;
        cin >> choice;
    } while (choice == 'Y' || choice == 'y');

    return 0;
}
