// Units are in milimeters

THICKNESS = 2;
RADIUS = 30;
OUTSIDE_WIDTH=93;
MARGIN = 2;
TRIANGLE_BASE = 5;

HEIGHT = 36 + MARGIN;
INNER_DIAMETER = 70 + MARGIN;
OUTER_DIAMETER = 95 + MARGIN;


module Ring( diameter, thickness ) {
    linear_extrude( thickness ) {
        difference() {
            circle( diameter + thickness, $fn=100 );
            circle( diameter, $fn=100 );
        }
    }
};



translate( [ 0, 0, HEIGHT ] ) Ring( INNER_DIAMETER, THICKNESS  );

Ring( OUTER_DIAMETER, THICKNESS );


// Triangle
for( i = [ 0:3 ] ) {
    rotate( [ 0, 0, 30 + ( 120 * i ) ] )
    difference() {
    // Wedge
    intersection() {
        translate( [ 0, 0, -35 ] ) sphere( OUTER_DIAMETER + 7, $fn=100 );
        cube( 100000 );
    }
    translate( [ 0, 0, -35 ] ) sphere( OUTER_DIAMETER + 7 - THICKNESS, $fn=100 );
    THINGY=71;
    translate( [ OUTER_DIAMETER, 0, 0 ] ) sphere( THINGY );
    translate( [ 0, OUTER_DIAMETER, 0 ] ) sphere( THINGY );
    translate( [ 0, 0, HEIGHT ] ) cube( 150 );
}
}






