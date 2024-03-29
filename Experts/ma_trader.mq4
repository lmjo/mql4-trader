int take_profit = 3 ;
int order ;
int total_orders = 10 ;
int timer = 1 ;

double action_price

int OnInit()
{
//--- create timer
   EventSetTimer(timer) ;
    
//---
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
void OnTimer()
  {

   double MaC = iMA(NULL,0,14,0,MODE_EMA,PRICE_CLOSE,0) ;
   double MaP = iMA(NULL,0,14,0,MODE_EMA,PRICE_CLOSE,15) ;
   
   Comment( MaP, " ", MaC ) ; 
   
   if ( OrdersTotal() < total_orders ) 
      { 
      if ( MaC > MaP )
         { 
         
            action_price = Ask ;
            order = OrderSend( Symbol(), OP_BUY, 0.01, action_price, 0, 0, action_price + take_profit * Point, NULL, 0, 0, NULL ) ;
            Comment(MaP, " ", MaC, " ", "Buy", "Order: ", order)  ; 
                        
            
         }
      else
         { 
         
            action_price = Bid ; 
            order = OrderSend( Symbol(), OP_SELL, 0.01, action_price, 0, 0, action_price - take_profit * Point, NULL, 0, 0, NULL ) ;
            Comment(MaP, " ", MaC, " ", "Sell", "Order: ", order) ; 
         
         }
      
      }
   
  }
