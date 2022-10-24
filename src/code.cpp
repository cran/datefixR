#include <Rcpp.h>
using namespace Rcpp;
#include <string>
#include <regex>

// [[Rcpp::export]]
String process_french(String date) {
  date.replace_all("le ", "");
  date.replace_all("Le ", "");
  date.replace_all("1er", "01");
  return date;
}

// [[Rcpp::export]]
void imputemonth(Nullable<String> monthImpute_) {
  if (monthImpute_.isNull()) {
    stop("Missing month with no imputation value given \n");
  } 
}

// [[Rcpp::export]]
void imputeday(Nullable<String> dayImpute_) {
  if (dayImpute_.isNull()) {
    stop("Missing day with no imputation value given \n");
  }
}


// [[Rcpp::export]]
String rm_ordinal_suffixes(String date_) {
  std::string date(date_);
  date = std::regex_replace(date, std::regex("(\\d)(st,)"), "$1");
  date = std::regex_replace(date, std::regex("(\\d)(nd,)"), "$1" );
  date = std::regex_replace(date, std::regex("(\\d)(rd,)"), "$1" );
  date = std::regex_replace(date, std::regex("(\\d)(th,)"), "$1" );
  date = std::regex_replace(date, std::regex("(\\d)(st)"), "$1");
  date = std::regex_replace(date, std::regex("(\\d)(nd)"), "$1" );
  date = std::regex_replace(date, std::regex("(\\d)(rd)"), "$1" );
  date = std::regex_replace(date, std::regex("(\\d)(th)"), "$1" );
  String date2(date);
  return date2;
}

// [[Rcpp::export]]
void checkday(Nullable<NumericVector> dayImpute) {
  if (!dayImpute.isNull()) {
    NumericVector dayImpute_(dayImpute); 
    if (!NumericVector::is_na(dayImpute_[0])) {
      if (dayImpute_[0] < 1 || dayImpute_[0] > 28) {
        stop("day.impute should be an integer between 1 and 28\n");
      }
      if (floor(dayImpute_[0]) != dayImpute_[0]) {
        stop("day.impute should be an integer\n");
        }
      }
    }
}
