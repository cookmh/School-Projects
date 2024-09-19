/* 
 * brakeCoef.cpp
 * Names: Peter Jaskoski (pjask), Mitchell Cook (cookmh)
 * ENGR 101 Lab Session: 032
 * Date: 3/23/2020
 */

#include <iostream>
#include <cmath>
using namespace std;

int main() {

  // defines input variables
  double vel ;
  double cd ;
  double runlegnth ; 
  // IO for user input
  cout << "v0 (m/s): " ;
  cin >> vel ;
  cout << "c_d (1/m): " ;
  cin >> cd;
  cout << "runwayLength (m): ";
  cin >> runlegnth;
  //defines wokring variables
  double a;
  double pos;
  double deltat;
  double blow ;
  double bhigh ;
  double bmid;
  double v;

  deltat = 0.00001;
  // sets initial search bounds
  blow = 0;
  bhigh = pow(vel, 2)/(2*runlegnth) ;

  // while loop operation for binary search 
  while ((bhigh-blow) > 0.000001) {
    // redefines working varibales every iteration
    v = vel;
    pos = 0;
    bmid = (bhigh+blow)/2 ;

    // loop for shuttle motion simulation
    while (v > 0) {
      a = - bmid - (cd * pow(v, 2)) ; 
      v = v + (a * deltat);
      pos = pos + (v * deltat) ;
    }
    // redefines search bounds based on predicted shuttle motion
    if (pos < runlegnth) {
      bhigh = bmid;
      // blow = blow
    }

    if (pos >= runlegnth) {
      blow = bmid ;
      // bhigh = bhigh
    }
    
  }
  // outputs final b value after loop has completed
  cout << "b_optimal = " << bmid << endl;
  
  return 0;
}
