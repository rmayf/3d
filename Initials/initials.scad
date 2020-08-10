module Name( str_ ) {
    translate( [ 0, 0, 3 ] )
    cylinder( h=1, r=11, center="true" );
    linear_extrude( height=3 ) {
        text(str_, font="PTMono:Bold", halign="center", valign="center");
    }
}

Name( "JS" );
translate( [ 0, 30, 0 ] )
    Name( "MM" );
translate( [ 0, 60, 0 ] )
    Name( "RM" );