// Units are in milimeters


MARGIN = 2;
HEIGHT = 36;

RING_DIMENSIONS = [ 4, 4 ];

THICKNESS = 2;
RADIUS = 30;
TRIANGLE_BASE = 5;

INNER_RADIUS = 35 + MARGIN;
OUTER_RADIUS = 60;

SLANT_ANGLE = 70;
TOP_JOINT_DIMENSIONS = [ OUTER_RADIUS - ( cos( SLANT_ANGLE ) * HEIGHT ), 4, 4 ];
SLANT_DIMENSIONS = [ 4, 4, ( ( HEIGHT + TOP_JOINT_DIMENSIONS[ 2 ] ) / sin( SLANT_ANGLE ) ) ];


module Ring( diameter, height=0 ) {
   rotate_extrude( $fn=100 ) {
      translate( [ diameter, height, 0 ] ) square( RING_DIMENSIONS );
   }
};

module Arch() {
   // Top
   difference() {
      translate( [ 0, 0, HEIGHT ] )
      cube( TOP_JOINT_DIMENSIONS );

      cylinder( h=1000, r=INNER_RADIUS, $fn=100);
   };

   // Slant
   difference() {
      translate( [ OUTER_RADIUS, 0, 0 ] )
      rotate( [ 0, SLANT_ANGLE - 90, 0 ] )
      cube( SLANT_DIMENSIONS );

      translate( [ 0, 0, HEIGHT + TOP_JOINT_DIMENSIONS[ 2 ] ] ) cube( 1000 );
   };
};

// Connectors
module Connectors() {
   for( i = [ 0:3 ] ) {
      rotate( [ 0, 0, 120 * i ] ) {
          children();
      }
   }
};

// Object Complete
*Ring( INNER_RADIUS, height=HEIGHT );
*Connectors() { Arch(); }
*Ring( OUTER_RADIUS );

// Object Exploded
translate( [ 0, 0, HEIGHT + TOP_JOINT_DIMENSIONS[ 2 ] ] ) rotate( [ 180, 0, 0 ] ) {
   Ring( INNER_RADIUS, height=HEIGHT );
   difference() {
      Connectors() { Arch(); }

      Ring( OUTER_RADIUS );
   };
}
translate( [ 300, 0, 0 ] )  Ring( OUTER_RADIUS );
