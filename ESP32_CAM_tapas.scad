$fn=50;


altcaja=12;
rotate([180,0,0]) translate([0,0,-altcaja]){
    difference(){ 
        postes();
        translate([0,0,-20]) cube(50,center=true);
        scale(1.02) esp32cam();
    }
    difference(){ 
        
        caja_exterior();
        caja_interior();
        translate([0,0,-20]) cube(50,center=true);
        esp32cam();
    }
}
//color("red") esp32cam();

translate([40,0,0]) {
    difference(){ 
        postes();
        translate([0,0,30]) cube(50,center=true);
        scale(1.02) esp32cam();
    }
    difference(){ 
        
        caja_exterior();
        caja_interior();
        translate([0,0,30]) cube(50,center=true);
        esp32cam();
    }
  
    
}
/////////////////////////////////////////////////////////////////

module caja_exterior(){
    hull(){
        chaflan=3;
        grosor=12;
        largo=31/2-chaflan/2;
        ancho=44/2-chaflan/2;
        
        translate([-largo,ancho,0]) cylinder(altcaja,chaflan,chaflan);
        translate([-largo,-ancho,0]) cylinder(altcaja,chaflan,chaflan);
        translate([largo,-ancho,0]) cylinder(altcaja,chaflan,chaflan);
        translate([largo,ancho,0]) cylinder(altcaja,chaflan,chaflan);
    } 

}

module caja_interior(){
    chaflan=3;
    grosor=altcaja-2;
    largo=27/2-chaflan/2;
    ancho=40/2-chaflan/2;
    hull(){

        
        translate([-largo,ancho,1]) cylinder(grosor,chaflan,chaflan);
        translate([-largo,-ancho,1]) cylinder(grosor,chaflan,chaflan);
        translate([largo,-ancho,1]) cylinder(grosor,chaflan,chaflan);
        translate([largo,ancho,1]) cylinder(grosor,chaflan,chaflan);
    } 

}
module postes(){
        chaflan=3;
        grosor=12;
        largo=30/2-chaflan/2;
        ancho=43/2-chaflan/2;  
    
    translate([-largo,ancho,0]) cylinder(grosor,chaflan,chaflan);
    translate([-largo,-ancho,0]) cylinder(grosor,chaflan,chaflan);
    translate([largo,-ancho,0]) cylinder(grosor,chaflan,chaflan);
    translate([largo,ancho,0]) cylinder(grosor,chaflan,chaflan);
}


module esp32cam(){
    translate([0,0,4]){
        hull(){
            chaflan=3;
            grosor=2;
            largo=27/2-chaflan/2;
            ancho=40/2-chaflan/2;
            
            translate([-largo,ancho,0]) cylinder(grosor,chaflan,chaflan);
            translate([-largo,-ancho,0]) cylinder(grosor,chaflan,chaflan);
            translate([largo,-ancho,0]) cylinder(grosor,chaflan,chaflan);
            translate([largo,ancho,0]) cylinder(grosor,chaflan,chaflan);
        } 
        //camara
        translate([0,11,0]) cylinder(9,8/2,8/2);
    }
}





















