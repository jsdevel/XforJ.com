(function(){
var oldVal="";
var $code = $('#Code');
var defaultValue="people.cousins.show({\n\
  cousins:[\n\
    {\n\
      name:\"Bill\",\n\
      hobbies:[\n\
         \"fishing\",\n\
         \"sports\"\n\
      ]\n\
    },\n\
    {\n\
      name:\"Sherry\",\n\
      hobbies:[\n\
         \"sewing\",\n\
         \"scrapbooking\"\n\
      ]\n\
    },\n\
    {\n\
      name:\"adam\",\n\
      hobbies:[\n\
         \"programming\",\n\
         \"sports\"\n\
      ]\n\
    }\n\
  ]\n\
}, {tryMe:true});";
try {
   oldVal = localStorage['sampleCode'];   
   if(!!oldVal){
      $code.val(oldVal);
   } else {
      $code.val(defaultValue);
      localStorage['sampleCode'] = defaultValue;
   }
} catch(e){
   $code.val(defaultValue);
}
$('#Run').click(function(){
   try{
      localStorage['sampleCode'] = $code.val();
   } catch(e){

   }
});
})();