void OnTick()
  {
//---
   string signal = "";
   
   double SARValue = iSAR(_Symbol,_Period,0.2,0.2,0);
   
   if(SARValue<Bid)(signal = "buy");
   if(SARValue>Ask)(signal = "sell");
   
      
   if(signal=="buy" && OrdersTotal()<3)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+50*_Point,NULL,0,0,Green));
   
   if(signal=="sell" && OrdersTotal()<3)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,0,Ask-50*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal);
   
  }
//+------------------------------------------------------------------+
