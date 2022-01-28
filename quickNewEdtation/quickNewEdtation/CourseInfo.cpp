//
//  CourseInfo.cpp
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#include "CourseInfo.hpp"
CourseInfo::CourseInfo(){
    this->courseFestivalhref = nullptr;
    this->courseFestivaltextValue = nullptr;
}
CourseInfo:: CourseInfo(const CourseInfo & c){
    this->courseFestivalhref = c.courseFestivalhref;
    this->courseFestivaltextValue = c.courseFestivaltextValue;
    cout<<"Copy Constructor called"<<endl ;
}

CourseInfo::CourseInfo(string href ,string tValue):courseFestivalhref(href),courseFestivaltextValue(tValue){
    cout<<"Copy Initailister Constructor called"<<endl ;
}

CourseInfo& CourseInfo:: operator= (const CourseInfo& a){
//    if (*this !=a) {
//        this->courseFestivalhref = a.courseFestivalhref;
//        this->courseFestivaltextValue = a.courseFestivaltextValue;
//    }
    this->courseFestivalhref = a.courseFestivalhref;
    this->courseFestivaltextValue = a.courseFestivaltextValue;
    return *this;
}

CourseInfo::~CourseInfo(){
    
}
