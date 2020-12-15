/* TODO 
*  . Change starting shapes to get a different mesh pattern for Left and Right prints
*  . Include solid ring around perimeter for better gluing surface (and also 40mm is only inner diameter)
*/
resize( [ 40, 0, 0 ], auto=[true,true,false] )
difference() {
   cylinder( h=1, r=100 );
   include <penrose.scad>;
}
