/*
 * SJCAM PRO8  MOUNT
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
$fn=100; 
 import ("c:\\Users\\david\\Downloads\\gopro_flat_mount.stl");
 translate ([-25,-7,-20]) {
 difference()
     {
     cube ([50,7,40]);
     translate ([25,6,20])
     rotate ([90,0,0])
         cylinder(d=18.2,h=5);
     }
 }