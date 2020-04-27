$fn = 100;
// Units are in mm
ball_diameter = 3.2;
ball_period = 1;
chain_diameter = 1;
thickness = 2;
length = 28;

module Side() {
translate( [ 0, 1, 0 ] ) difference() {
    difference() {
    minkowski() {
    polyhedron( points=[ [ 0, 0, 0 ], [ length / 4, length / 4, 0 ], [ ball_diameter / 2, length, 0 ], [ -(length/4), length/4, 0 ], [ 0, length/4, length/4 ], [ -( ball_diameter / 2), length, 0 ], [ ball_diameter / 2, length, ball_diameter / 2 ], [ -( ball_diameter / 2 ), length, ball_diameter / 2 ] ],
                faces=[ [ 0, 4, 1 ], [ 1, 4, 6, 2 ], [ 5, 7, 4, 3 ], [ 0, 3, 4 ],
                        [ 0, 1, 2, 5, 3 ], [ 6, 4, 7 ], [ 2, 6, 7, 5 ] ] );
    sphere( 1 );
    }
    translate( [ 0, 0, -1 ] ) cube( [ 1000, 1000, 2 ], center=true );
}
    translate( [ 0, length - ball_diameter / 2, 0 ] ) {
    union() {
        sphere( ball_diameter / 2 );
        translate( [ 0, -(ball_diameter + ball_period ), 0 ] ) {
            sphere( ball_diameter / 2 );
            }
        translate( [ 0, -(ball_diameter*2 + ball_period), 0 ] ) rotate( [ -90, 0, 0 ] )
            cylinder( h=15, r1=chain_diameter / 2, r2=chain_diameter / 2 );
        };
    };
}
}

color( "LightSlateGray" ) Side();
%color( "LightSlateGray" ) rotate( [ 0, 180, 0 ] ) Side();