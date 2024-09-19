// Members: Mitchell Cook (cookmh@umich.edu)
// Lab Section: 032
// Date: 4/24/2020

#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include <iomanip>

#include "fees.h"

using namespace std;

int main() {

  // Ensure consistent numeric outputs (do not remove/modify)
  cout.precision(6);

  // YOUR CODE HERE

    string mapfile;
    string feesfile;

    
    cout << "Enter Map Filename: ";
    cin >> mapfile;

    ifstream map(mapfile);
    if(!map.good()){
        cout << "Error: " << mapfile << " could not be opened." << endl;
        return 1;
    }


    cout << "Enter Fees Filename: ";
    cin >> feesfile;

    ifstream fees(feesfile);
    if(!fees.good()){
        cout << "Error: " << feesfile << " could not be opened." << endl;
        return 1;
    }



    vector<char> stops;
    readMap(map,stops);

    vector<Spaceport> spaceports;
    readFees(fees, spaceports);



    double sum;
    for(int i = 0; i < stops.size(); ++i){

      double feetype = getFee(stops.at(i),spaceports);
  
      cout << "Spaceport Type " << stops.at(i) << ": " << feetype << endl;
      sum += feetype;
    } 

    cout << "Total: " << sum;

}