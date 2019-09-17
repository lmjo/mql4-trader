input double TakeProfit     = 20;
input double Lots           = 0.01;
input double TrailingStop   = 30;
input double MACDOpenLevel  = 3;
input double MACDCloseLevel = 2;

input int    MATrendPeriod  = 26;

double MaC ;
double MaP ;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
{
    EventSetTimer(1) ;
    return(INIT_SUCCEEDED) ;
}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{

    EventKillTimer();

}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+




/*
int get_moving_averages(int lag)
{

   MaCurrent  = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,lag);
   //MaPrevious = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,lag);
   
   return(MaCurrent) ;

}
*/



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void onTimer()
  {


   MaC = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,0) ;
   MaP = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,15) ;
   
   Comment( MaP, " ", MaC ) ;
   Comment("Lawrence") ;
   
  }
