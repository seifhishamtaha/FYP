
void OnTick()
  {
//---
   string signal = "";
   
   double OSMAValue = iOsMA(_Symbol,_Period,12,26,9,PRICE_CLOSE,0);
   double LastOSMAValue = iOsMA(_Symbol,_Period,12,26,9,PRICE_CLOSE,1);
   
   
   if(LastOSMAValue<0 && OSMAValue>0)(signal = "buy");
   if(LastOSMAValue>0 && OSMAValue<0)(signal = "sell");
   
      

  
   if(signal=="buy" && OrdersTotal()==0)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   if(signal=="sell" && OrdersTotal()==0)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal);
  }
//+------------------------------------------------------------------+
