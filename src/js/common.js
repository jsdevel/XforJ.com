(function(){

   var hashManager = new HashManager();
   var $window = $(window);
   var $Top = $('.top-controller').click(function(){
      setTimeout(function(){
         $Top.fadeOut(500)
      },5);
   });

   //Slides
$('body').on('click', '.slides-controls .button', function(e){
   var $this=$(this);
   var $container=$this.closest('.slides');
   var $slide=$container.find($this.data('slidetoshow'));
   var $showing = $container.children('.showing');
   if($slide.hasClass('showing'))return;
   $slide.addClass('showing');
   $showing.removeClass('showing');
});
$window.scroll((function(){
   var animating = false;
   return function(e){
      if(!animating){
         animating=true;
         setTimeout(function(){
            if($window.scrollTop() > 20){
               $Top.fadeIn(500);
            } else {
               $Top.fadeOut(500);
            }
            animating=false;
         },10);
      }
   };
})());

/**
 * HashManager acts as an array of hash values.
 * 
 * @return HashManager
 */
function HashManager(){
   if(!(this instanceof HashManager)){return new HashManager(start);}

   this._hashes = [];
   this._map = {};
   
   return this;
}
HashManager.prototype = {
   constructor:HashManager,
   _hashes:null,
   length:0,
   _map:null,
   getAncestorsOf:function(hash){
      var ancestors = [];
      var index = this._map[hash];
      var i=0;
      var hashes = this._hashes;

      if(index !== void(0)){
         for(;i<index;i++){
            ancestors[i] = hashes[i];
         }
         return ancestors;
      } else {
         return ancestors;
      }
   },
   hasHashes:function(){
      return this.length > 0;
   },
   setHashes:function(hashString){
      if(typeof hashString !== 'string'){throw "hashString must be a string."};

      var hashes = this._hashes = hashString.replace(/^#|#$/g,"").split("#");
      var hashesLen = this.length = hashes.length;
      var hash;
      var i=0;
      var map = this._map = {};

      for(i;i<hashesLen;i++){
         hash = "#"+hashes[i]; 
         this[i] = hash;
         map[hash]=i;
      }

      return this;
   }
}

   //hashManager.setHashes(location.hash)
})();