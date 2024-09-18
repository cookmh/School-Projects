// Members: Mitchell Cook (cookmh@umich.edu), Peter Jaskoski (pjask@umich.edu)
// Lab Section: 032
// Date: 4/20/2020

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <cmath>

using namespace std;

// Structure for storing data of all the planets

struct Planet{
    int id;
    int row;
    int col;
    char symbol;
    string name;
    bool visited = false;
};

// Function to read in data from the two files and store it as a vector of structures 

vector<Planet> read_data(ifstream locfile, ifstream namesfile){
    vector<Planet> planetinfo;
    Planet ptemp;
    Planet ntemp;
    int rows, cols, srow, scol, erow, ecol;
    locfile >> rows >> cols >> srow >> scol >> erow >> ecol;
    while(locfile >> ptemp.row >> ptemp.col >> ptemp.symbol >> ptemp.id){
            if( 0 >= ptemp.row ||  ptemp.row > rows){
                cout << ptemp.id << " out of range - ignoring" << endl;
            }
            else if( 0 >= ptemp.col || cols < ptemp.col ){
                cout << ptemp.id << " out of range - ignoring" << endl;
            }
            else{
                 planetinfo.push_back(ptemp);
            }
    }   
    while(namesfile >> ntemp.id >> ntemp.name){
        for(int i = 0; i < planetinfo.size(); ++i){
            if(planetinfo.at(i).id == ntemp.id){
                planetinfo.at(i).name = ntemp.name;
            }
        }
    }   
    
    return planetinfo;
}

// Function to create the map of the planet locations based on the data from our planet vector struct, and reading in from the locations file

vector<vector<char> > create_map(vector<Planet> planetinfo, ifstream locfile){
    int rows, cols, srow, scol, erow, ecol;
    locfile >> rows >> cols >> srow >> scol >> erow >> ecol;

    vector<char> row(cols, '.');
    vector<vector<char> > map(rows,row);

    map.at(srow - 1).at(scol - 1) = 'S';
    map.at(erow - 1).at(ecol - 1) = 'E';

    for(int i = 0; i < planetinfo.size(); ++i){
        map.at(planetinfo.at(i).row - 1).at(planetinfo.at(i).col - 1) = planetinfo.at(i).symbol;
    }   

    return map;       
} 

// Fucntion to print the map of planets to the output file          
void print_map(vector<vector<char> > map, int rows, int cols, ofstream& output){
    for (int i = 0; i < rows; ++i){
        for (int j = 0; j < cols; ++j){
            output << map.at(i).at(j);
        }   output << endl;
    }
}

// Function to coreect the errors in the planet name data. Removes the "XX" and replaces with "" , as well as removes "_" and replaces with " ".
 void errorCorrection(vector<Planet>& planetinfo){
     for(int i = 0; i < planetinfo.size(); ++i){
        while(planetinfo.at(i).name.find("XX") != planetinfo.at(i).name.npos){
            int replacementIndex = planetinfo.at(i).name.find("XX");
            planetinfo.at(i).name.erase(replacementIndex, 2);
        }
         while(planetinfo.at(i).name.find("_") != planetinfo.at(i).name.npos){
            int replacementIndex = planetinfo.at(i).name.find("_");
            planetinfo.at(i).name.replace(replacementIndex,1," " );
        }
    }
}

// Calcuates the distance between the current postion and the potential position. Returns the distance between them.
double calculate_dist(int xcur, int ycur, int xpot, int ypot){
    double distance = sqrt((pow((xcur - xpot),2)) + (pow((ycur - ypot),2)));
    return distance;
}

// Fuction to take the distances between all possible desitnations and find the one that is the closest. 
// Assigns the next locations based on the location of the planet with the shortest distance and prints out this location to the output file.
void find_closest(vector<Planet>& planetinfo, int& currow, int& curcol, ofstream& output){
    int minID;
    int newrow;
    int newcol;
    double minimumdist = 5000;
    for(int i = 0; i < planetinfo.size(); ++i){
        
        double distance = calculate_dist(currow, curcol, planetinfo.at(i).row, planetinfo.at(i).col);

        if(planetinfo.at(i).visited != true){
            if(distance < minimumdist){
                minimumdist = distance;
                minID = planetinfo.at(i).id;
                newrow = planetinfo.at(i).row;
                newcol = planetinfo.at(i).col;
            }

            else if(distance == minimumdist && planetinfo.at(i).id < minID){
                minimumdist = distance;
                minID = planetinfo.at(i).id;
                newrow = planetinfo.at(i).row;
                newcol = planetinfo.at(i).col;
            }
        }
    } 
    currow = newrow;
    curcol = newcol;

    string planetname;
    for(int j = 0; j < planetinfo.size(); ++j){
        if(minID == planetinfo.at(j).id){
            planetinfo.at(j).visited = true;
            planetname = planetinfo.at(j).name;
        }
    }

    output << "Go to " << planetname << " at " << currow << " " << curcol << endl;
}      

int main()
{   
    // initialize the output file 
    ofstream output("journey.txt");

    string locfile;
    string namesfile;

    // Prompt the user to input the two filenames 
    cout << "Enter Locations Filename: ";
    cin >> locfile;

    cout << "Enter Names Filename: ";
    cin >> namesfile;

    // Opens and verifies that the two files open properly. 
    ifstream locations(locfile);
    if(!locations.good()){
        cout << "Input file could not be opened" << endl;
        return 1;
    }

    ifstream names(namesfile);
    if(!names.good()){
        cout << "Input file could not be opened" << endl;
        return 1;
    }

    vector<Planet> planetinfo;

    // Calls the functions to read in the data 
    planetinfo = read_data(ifstream(locfile), ifstream(namesfile));
    errorCorrection(planetinfo);


    int rows, cols, srow, scol, erow, ecol;
    locations >> rows >> cols >> srow >> scol >> erow >> ecol;

    vector<vector<char> > map = create_map(planetinfo, ifstream(locfile));
   
    // Closes the files after the data has been read and stored
    locations.close();
    names.close();

    // Calling the fucnction to create the map 
    print_map(map, rows, cols, output);


    output << "Start at " << srow << " " << scol << endl;
    
    // Loop to run the function that finds the closest planets until all of the planets have been visited 
    // Outputs to journey.txt
    int currow = srow;
    int curcol = scol;
    int visitedplanets = 0;
    while(visitedplanets < planetinfo.size()){
            find_closest(planetinfo, currow, curcol, output);
            
            ++visitedplanets;
        }   

    output << "End at " << erow << " " << ecol << endl; 
    
    output.close();
}

       
        

    



    

