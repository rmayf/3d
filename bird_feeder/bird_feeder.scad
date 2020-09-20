// Units are in milimeters

THICKNESS = 2;
RADIUS = 30;
OUTSIDE_WIDTH=93;
MARGIN = 2;
TRIANGLE_BASE = 5;

HEIGHT = 36 + MARGIN;
INNER_DIAMETER = 70 + MARGIN;
OUTER_DIAMETER = 95 + MARGIN;


module Ring( diameter ) {
    linear_extrude( THICKNESS ) {
        difference() {
            circle( diameter + THICKNESS );
            circle( diameter );
        }
    }
};

translate( [ 0, 0, HEIGHT ] ) 
Ring( INNER_DIAMETER );

Ring( OUTER_DIAMETER );

// Triangle
for( i = [ 0:3 ] ) {
    rotate( [ 0, 0, 30 + ( 120 * i ) ] )
    translate( [ -OUTER_DIAMETER, 0, 0 ] )
    rotate( [ 0, -58, 0 ] )
    linear_extrude( THICKNESS )
    polygon( points=[ [ 0, TRIANGLE_BASE ], [ 0, -TRIANGLE_BASE ], [ 46, 0 ] ] );
}