#ifndef FEES
#define FEES

#include <string>
#include <iostream>
#include <vector>

struct Spaceport {
  /*ADD TYPE HERE*/ char spaceportType; // Example: 'X', 'Y', 'A'
  /*ADD TYPE HERE*/ double fee; // Examples: 100, 229.99
};

// Reads a map representation from the given input stream, finding all of
// the spaceports visited and inserting their symbols into the 'stops' vector.
// Note that the stops vector may contain duplicates if more than one spaceport
// of the same type is visited.
void readMap(std::istream &in, std::vector<char> &stops);

// Reads the information for each spaceport type from the given input stream
// and appends each to the 'spaceports' vector. (You may assume there are no
// duplicate entries for the same spaceport type in the input data.)
void readFees(std::istream &in, std::vector<Spaceport> &spaceports);

// Returns the fee for the given spaceport type according to the entries
// in the spaceports vector. If there is no entry, returns a default fee of 100.
double getFee(char spaceportType, const std::vector<Spaceport> &spaceports);

#endif // FEES