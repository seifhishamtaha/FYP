
void OnTick()
  {
//---
   string signal = "";
   
   double SARValue = iSAR(_Symbol,_Period,0.2,0.2,0);
   double ForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,0);
   double LastForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,13);
   
   
   if(LastForceIndexValue<0 && ForceIndexValue>0)if(SARValue<Bid)(signal = "buy");
   if(LastForceIndexValue>0 && ForceIndexValue<0)if(SARValue>Ask)(signal = "sell");

         
   if(signal=="sell" && OrdersTotal()<1)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   if(signal=="buy" && OrdersTotal()<1)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   
   Comment("The current signal is: ",signal);
  }
//+------------------------------------------------------------------+
