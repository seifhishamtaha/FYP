
void OnTick()
  {
//---

   string signal = "";
   
   double TenkanSenValue = iIchimoku(_Symbol,_Period,9,26,52,MODE_TENKANSEN,0);
   double KijunSenValue = iIchimoku(_Symbol,_Period,9,26,52,MODE_KIJUNSEN,0);
   double SenkouSpanAValue = iIchimoku(_Symbol,_Period,9,26,52,MODE_SENKOUSPANA,-26);
   double SenkouSpanBValue = iIchimoku(_Symbol,_Period,9,26,52,MODE_SENKOUSPANB,-26);
   double ChikouSpanValue = iIchimoku(_Symbol,_Period,9,26,52,MODE_CHIKOUSPAN,26);
   
   Comment(
      "TenkanSen Value: ",TenkanSenValue,"\n",
      "KijunSen Value: ",KijunSenValue,"\n",
      "SenkouSpanA Value: ",SenkouSpanAValue,"\n",
      "SenkouSpanB Value: ",SenkouSpanBValue,"\n",
      "ChikouSpan Value: " ,ChikouSpanValue,"\n" 
   );
   
   if(SenkouSpanBValue>SenkouSpanAValue)(signal = "buy");
   if(SenkouSpanBValue<SenkouSpanAValue)(signal = "sell");
   
      

  
   if(signal=="buy" && OrdersTotal()==0)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   if(signal=="sell" && OrdersTotal()==0)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal);
  
  
  
  
  
  }
  
  
  
//+------------------------------------------------------------------+
