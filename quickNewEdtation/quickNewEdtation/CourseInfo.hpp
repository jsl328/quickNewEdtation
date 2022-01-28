//
//  CourseInfo.hpp
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#ifndef CourseInfo_hpp
#define CourseInfo_hpp

//#include <stdio.h>
#include <iostream>
using namespace::std;
using std::string;

class CourseInfo {
    
    string courseSection;//课程分段
    string courseFestival;//课程分段的标题
    string courseFestivalhref;//table标签里的a标签的href
    string courseFestivaltextValue;//table标签里的a标签的textvalue
    
public:
    CourseInfo();
    CourseInfo(string href ,string tValue);
    CourseInfo(const CourseInfo&);
    CourseInfo& operator= (const CourseInfo& a);
    ~CourseInfo();
};

#endif /* CourseInfo_hpp */
