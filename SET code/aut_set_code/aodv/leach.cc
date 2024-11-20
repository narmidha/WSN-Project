#include <stdio.h>
#include <string.h>
#include <math.h>
#include "agent.h"
#include <god.h> 
#include "diffusion/hash_table.h"
#include "mobilenode.h" 
class MyAgent : public Agent {
public:
        MyAgent();
       
protected:
        int command(int argc, const char*const* argv);
private:
        int    my_var1;
        double my_var2;
        void   MyPrivFunc(void);
};


static class MyAgentClass : public TclClass {
public:
        MyAgentClass() : TclClass("Agent/MyAgentOtcl") {}
        TclObject* create(int, const char*const*) {
                return(new MyAgent());
        }
} class_my_agent;


MyAgent::MyAgent() : Agent(PT_UDP) {
     
}


int MyAgent::command(int argc, const char*const* argv) {
      if(argc== 2) {
           if(strcmp(argv[1], "call-my-priv-func") == 0) {
                  MyPrivFunc();
                  return(TCL_OK);
           }
      }
      return(Agent::command(argc, argv));
}


void MyAgent::MyPrivFunc(void) {
      Tcl& tcl = Tcl::instance();


{

{
struct node
{
    unsigned random[20];
    unsigned from[20];
}
rt[10];
{
    
    int clusters=3,i,j,k,count=0;
int cost[3][3]={{11,12,13},{14,15,9},{6,17,23}};
    //printf("\nEnter the number of Clusters : ");
    //scanf("%d",&clusters);//Enter the clusters
    //printf("\nEnter the cost  :\n");

    for(i=0;i<clusters;i++)
    {
        for(j=0;j<clusters;j++)
        {
            //scanf("%d",&cost[i][j]);
            cost[i][i]=0;
            rt[i].random[j]=cost[i][j];//initialise the randomance equal to cost matrix
            rt[i].from[j]=j;
        }
    }
        do
        {
            count=0;
            for(i=0;i<clusters;i++)
            for(j=0;j<clusters;j++)
            for(k=0;k<clusters;k++)
                if(rt[i].random[j]>cost[i][k]+rt[k].random[j])
                {
                    rt[i].random[j]=rt[i].random[k]+rt[k].random[j];
                    rt[i].from[j]=k;
                    count++;
                }
        }while(count!=0);
        for(i=0;i<clusters;i++)
        {
            printf("\n\n The Gateway Nodes are \n For CH",i+1);
            for(j=0;j<clusters;j++)
            {
{ if (rt[i].random[j]==0)
{
printf("\n");
}
else
{
               printf("\t\n %d ",rt[i].random[j]);
            }
}
}
        }
    printf("\n\n");
}
}
}
}
