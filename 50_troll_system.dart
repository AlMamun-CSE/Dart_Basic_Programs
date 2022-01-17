//example
#include <iostream>
#include <ctime>
using namespace std;

long TicketNum(){

        int i = 0,j = 0;

        i = rand() % 9 + 1;       //First number should not be 0.
        for (int k = 1; k < 4; k++)
        {
        {
            i = i*10 + rand()%10;    //Generate the next 3 digits.
        }
        for (int k = 0; k < 4; k++)
        {
            j = j*10 + rand()%10;      //Generate the 4 digits of the lower part.
        }
        long res = i * j;

        return res;
     }
}
long ticket_num = TicketNum();

int n1 = 100;
int total_earn_all_counter;
int heavy_ticket_price = 0;
int medium_ticket_price = 0;
int light_ticket_price = 0;

//.................Heavy Duty.......................
class Heavy_Duty{

public:

string heavy_queue[100];
int front1 = -1, rear1 = -1;
void HeavyInsert(){

    string vehicle_num;

    if (rear1 == n1 - 1)
        cout << "System length crush...!" << endl;
    else
    {
        if (front1 == -1)
            front1 = 0;
        cout << "Insert the Vehicles Number : ";
        cin >> vehicle_num;
        cout << "Ticket Number : "<< ticket_num++ << endl;;

        rear1++;
        int defaultPriceHeavy = 800; //default Price
        heavy_ticket_price += 800; //heavy_ticket_price = heavy_ticket_price + 800;
        cout << "Ticket Price : "<<defaultPriceHeavy<<endl;

        //date
        const int MAXLEN = 80;
        char s[MAXLEN];
        time_t t = time(0);
        strftime(s, MAXLEN, "%d/%m/%Y", localtime(&t));
        cout << "Date : "<< s << '\n';
        heavy_queue[rear1] = vehicle_num;
    }
}
void HeavyDisplay()
{
    if (front1 == -1)
        cout << "Heavy Counter is empty" << endl;
    else
    {
        cout << "Heavy Counter Total Earn : ";
        cout << heavy_ticket_price << endl;
        cout << "Heavy Counter elements are : ";
        for (int i = front1; i <= rear1; i++)
        cout << heavy_queue[i] << "; ";
        cout << endl;
    }
}
};

//....................Medium Duty.......................

class Medium_Duty{

public:

string medium_queue[100];
int front2 = -1, rear2 = -1;

void MediumInsert(){

    string vehicle_num;

    if (rear2 == n1 - 1)
        cout << "System length crush!" << endl;
    else
    {
        if (front2 == -1)
            front2 = 0;
        cout << "Insert the Vehicles Number : ";
        cin >> vehicle_num;
        cout <<""<< endl;
        cout << "Ticket Number : "<< ticket_num++ << endl;;
        rear2++;
        //default Price
        int defaultPriceMedium = 500;
        medium_ticket_price+=500;
        cout << "Ticket Price : "<< defaultPriceMedium << endl;;
        const int MAXLEN = 80;
        char s[MAXLEN];
        time_t t = time(0);
        strftime(s, MAXLEN, "%d/%m/%Y", localtime(&t));
        cout << "Date : "<< s << '\n';;
        medium_queue[rear2] = vehicle_num;
    }
}
void MediumDisplay()
{
    if (front2 == -1)
        cout << "Medium Duty is empty" << endl;
    else
    {
        cout << "Medium Duty Total Earn : ";
        cout << medium_ticket_price << endl;
        cout << "Medium Duty elements are : ";
        for (int i = front2; i <= rear2; i++)
            cout << medium_queue[i] << "; ";
        cout << endl;
    }
}
};

//.....................Light Duty.......................

class Light_Duty{

public:

string light_queue[100];
int front3 = -1, rear3 = -1;

void LightInsert(){
    string vehicle_num;

    if (rear3 == n1 - 1)
        cout << "System length crush!" << endl;
    else
    {
        if (front3 == -1)
            front3 = 0;
        cout << "Insert the Vehicles Number : ";
        cin >> vehicle_num;
        cout << "Ticket Number : "<< ticket_num++<< endl;
        rear3++;
        //default Price
        int defaultPriceLight = 300;
        light_ticket_price+=300;
        cout << "Ticket Price : "<< defaultPriceLight << endl;
        //date
        const int MAXLEN = 80;
        char s[MAXLEN];
        time_t t = time(0);
        strftime(s, MAXLEN, "%d/%m/%Y", localtime(&t));
        cout << "Date : "<< s << '\n';
        light_queue[rear3] = vehicle_num;
    }
}
void LightDisplay(){
    if (front3 == -1)
        cout << "Light Duty is empty" << endl;
    else
    {
        cout << "Light Duty Total Earn : ";
        cout << light_ticket_price << endl;
        cout << "Light Duty elements are : ";
        for (int i = front3; i <= rear3; i++)
        cout << light_queue[i] << "; ";
        cout << endl;
    }
}

};
void totalEarnAllCounter(){
    total_earn_all_counter = heavy_ticket_price + medium_ticket_price + light_ticket_price;
    cout << "Total earn from all counter : "<< total_earn_all_counter << endl;
}

// ...................Main.......................

int main()
{
    Heavy_Duty hd;
    Medium_Duty md;
    Light_Duty ld;
    cout << "~~ Welcome to Padma Bridge Toll System ~~" << endl;
    cout << "Go To Line-" << endl;
    cout << "   (1) Heavy Duty " << endl;
    cout << "   (2) Medium Duty" << endl;
    cout << "   (3) Light Duty " << endl;
    cout << "   (4) Individual Counter Details" << endl;
    cout << "   (5) Total Earning  From All Counter" << endl;

    int ch;
    do
    {
        cout << "Enter your choice : ";
        cin >> ch;
        switch (ch)
        {
        case 1:
            hd.HeavyInsert();
            break;
        case 2:
            md.MediumInsert();
            break;
        case 3:
            ld.LightInsert();
            break;
        case 4:
            cout << "  (1) Heavy Counter Details " << endl;
            cout << "  (2) Medium Counter Details " << endl;
            cout << "  (3) Light Counter Details " << endl;

            int ch;
            cout << "Enter your choice : ";
            cin >> ch;

            switch(ch){
                case 1:
                    hd.HeavyDisplay();
                    break;
                case 2:
                    md.MediumDisplay();
                    break;
                case 3:
                    ld.LightDisplay();
                    break;
            }
            break;
        case 5:
            totalEarnAllCounter();
            break;
        default:
            cout << "Invalid choice" << endl;
        }
    cout <<""<< endl;
    cout << "Go To Line " << endl;
    cout << "   (1) Heavy Duty " << endl;
    cout << "   (2) Medium Duty " << endl;
    cout << "   (3) Light Duty " << endl;
    cout << "   (4) Individual Counter Details " << endl;
    cout << "   (5) Total Earning From All Counter " << endl;
    cout <<""<< endl;
    } while (ch != 6);
    return 0;
}
