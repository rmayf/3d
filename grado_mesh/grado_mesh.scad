/*
module rhomb( angle, color_ ) {
   LEN = 30;
   x = sin(angle)*LEN;
   y = cos(angle)*LEN;
   color( color_ )
   polygon( points=[ [0,-y], [-x,0], [0,y], [x,0], ] );
}

module thin_rhomb() {
   rhomb( 18, "yellow" );
}

module fat_rhomb() {
   rhomb( 36, "red" );
}

fat_rhomb();
translate( [ -27, 0, 0 ] )
rotate( [ 0, 0, -55 ] )
thin_rhomb();
*/

//include <penrose/example1.scad>;
resize( [ 40, 0, 0 ], auto=[true,true,false] )
difference() {
   cylinder( h=1, r=100 );
   include <penrose.scad>;
}
