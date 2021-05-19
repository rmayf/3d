$fn=100;

union() {
   resize( [ 40, 0, 0 ], auto=[true,true,false] ) {
      difference() {
         cylinder( h=1, r=90 );
         include <penrose.scad>;
      }
   }
   difference() {
      cylinder( h=1, r=21 );
      cylinder( h=1, r=20 );
   }
}
