// Members: Mitchell Cook (cookmh@umich.edu)
// Lab Section: 032
// Date: 4/24/2020

#include <string>
#include <iostream>
#include <vector>

#include "fees.h"

using namespace std;

// Reads a map representation from the given input stream, finding all of
// the spaceports visited and inserting their symbols into the 'stops' vector.
// Note that the stops vector may contain duplicates if more than one spaceport
// of the same type is visited. The stops listed in the vector must be ordered
// in the same order that they are encountered when reading the input.
void readMap(istream &in, vector<char> &stops) {
  // HINT: read each line of the map into a string as a single "word"
  // and then iterate through each character in the word using indexing.

  // YOUR CODE HERE

  string word;
  while( in >> word){
    for(int i = 0; i < word.size() - 1; ++i){
      
      if(word == "Start") return;

      else{

      }
      
      if(word.at(i) != 'S' && word.at(i) != 'E' && word.at(i) != '.'){
        stops.push_back(word.at(i));
      }
    }
  }
}

// Reads the information for each spaceport type from the given input stream
// and appends each to the 'spaceports' vector. (You may assume there are no
// duplicate entries for the same spaceport type in the input data.)
void readFees(istream &in, vector<Spaceport> &spaceports) {
  
  // YOUR CODE HERE

  Spaceport temp;

  while(in >> temp.spaceportType >> temp.fee){
    spaceports.push_back(temp);
  }
}

// Returns the fee for the given spaceport type according to the entries
// in the spaceports vector. If there is no entry, returns a default fee of 100.
double getFee(char spaceportType, const vector<Spaceport> &spaceports) {

  // YOUR CODE HERE

  double typefee;
  for(int i = 0; i < spaceports.size(); ++i){
    if(spaceportType == spaceports.at(i).spaceportType){
      typefee = spaceports.at(i).fee;
      return typefee; 
    } 
  }
  return 1;
}