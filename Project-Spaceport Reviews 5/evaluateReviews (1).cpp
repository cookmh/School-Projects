// Members: Mitchell Cook (cookmh@umich.edu), Peter Jaskoski (pjask@umich.edu)
// Lab Section: 032
//Date: 4/8/2020#include <string>

// Add any #includes for C++ libraries here.
// We have already included iostream as an example.
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <algorithm>
#include <cctype>
#include <functional>

// The #include adds all the function declarations (a.k.a. prototypes) from the
// reviews.h file, which means the compiler knows about them when it is compiling
// the main function below (e.g. it can verify the parameter types and return types
// of the function declarations match the way those functions are used in main() ).
// However, the #include does not add the actual code for the functions, which is
// in reviews.cpp. This means you need to compile with a g++ command including both
// .cpp source files. For this project, we will being using some features from C++11,
// which requires an additional flag. Compile with this command:
//     g++ --std=c++11 evaluateReviews.cpp reviews.cpp -o evaluateReviews
#include "reviews.h"

using namespace std;

const double SCORE_LIMIT_TRUTHFUL = 3;
const double SCORE_LIMIT_DECEPTIVE = -3;


int main(){
    // create output file
    ofstream output("report.txt");
    // open keywordWeights.txt and gives error message if unsuccessfully opened.
    ifstream kwghts("keywordWeights.txt");
    if(!kwghts.good()){
        cout << "Error: keywordWeights.txt could not be opened." << endl;
        return 1;
    }

    
    // define vectors that are in the functions
    vector<string> keywords;
    vector<double> weights;
    // header of the output file
    output << "review score category" << endl;

    int i;
    int truth = 0;
    int decep = 0;
    int uncat = 0;
    double highestscore = 0;
    int filehighest = 0;
    double lowestscore = 0;
    int filelowest = 0;
    // run entire program for 100 iterations
    for(i = 0; i < 100; ++i){
        // create variable for the current review file that is having data extracted from it
        string filename = makeReviewFilename(i);
        ifstream reviewtxt(filename);
        // break the for loop once you run out of files
        if(!reviewtxt.good()){
            break;
        }
        // obtain keywords and weights vectors
        readKeywordWeights(kwghts,keywords,weights);

        // obtain reviewWords vector
        vector<string> reviewWords;
        readReview(reviewtxt,reviewWords);

        // calculate score for the review file 
        double score;
        score = reviewScore(reviewWords, keywords, weights);
        
       // if the the score is a new high/low out of all previous files, set highest/lowest score to that score
        if(score > highestscore){
            highestscore = score;
            filehighest = i;
        }
        if(score < lowestscore){
            lowestscore = score;
            filelowest = i;
        }

        // determines what category the review belongs in based on the score
        string category;
        if(score > SCORE_LIMIT_TRUTHFUL){
            category = "truthful";
            truth += 1;

            }
        else if(score < SCORE_LIMIT_DECEPTIVE){
            category = "deceptive";
            decep += 1;
        }
        else{
            category = "uncategorized";
            uncat += 1;
        }

        // outputs review num, score, and category into the report
        output << i << " " << score << " " << category << endl; 
    }

    output << endl;
    
    // outputs number of reviews, true reviews, decep reviews, and uncat reviews into the report
    output << "Number of reviews: " << i << endl;
    output << "Number of truthful reviews: " << truth << endl;
    output << "Number of deceptive reviews: " << decep << endl;
    output << "Number of uncategorized reviews: " << uncat << endl;

    output << endl;
    // outputs highest and lowest score of all reviews into the report
    output << "Review with highest score: " << filehighest << endl;
    output << "Review with lowest score: " << filelowest << endl;

    output.close();






   
    





    


   




    // TODO: implement the main program

}



