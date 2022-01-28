

/******************** Log ********************/

function qpic_log(content, logType) {
    if (logType == 1 || logType == null) {
        console.log(content);
    } else if (logType == 2) {
        setTimeout(function() { alert(content); }, 1);
    } else {
        
    }
};

function qpic_logObject(object, logType) {
    qpic_log(JSON.stringify(object), logType);
    // qpic_log(object, logType);
};

showCatalog = (td) => {
    let docxStr = td.innerHTML;//a的innerHTML内容
    let reg = /<.+>/gi,//拿去a便签
    nodeArr = docxStr.match(reg),//a标签的数组
    hrefArr = [],//截取出来的href属性
    codeArr = [],//截取的a标签内容
    catalogAryList = [],//目录总数据
    hrefReg = /(<a\b[^>]+\bhref=")(\S*)("[^>]*>)(.*?)(<\/a>)/gi,
    // spanValueReg =/<span(.*?)>(\S*)<\/span>/gi,
    catalogObj ={};
    /*
        //这个就是最终返回的数据,数据接口如下:
        catalogObj = [{catalogAry:[{id:'',href:'',title:''},...]},{catalogObj:[{id:'',href:'',title:''},...]},{...}]
    */
    if (nodeArr !== null && nodeArr !== [] && nodeArr !== undefined) {
        for (let key in nodeArr) {
            let str = nodeArr[key];
            if (str.indexOf("#") >= 0) {
                hrefArr.push((hrefReg.exec(str))[2]);//放下载url
                // codeArr.push((hrefReg.exec(str))[4].innerHTML);//放标题,没搞定
            }else{
                hrefArr.push((hrefReg.exec(str))[2]);
                // codeArr.push((hrefReg.exec(str))[4].innerHTML);//放标题,没搞定
            }
        }
        // qpic_logObject("codeArr"+hrefArr,2);
        hrefArr.map((item, index) => {
            catalogAryList.push({
                id: index,
                href: item,//链接
                title: codeArr[index]//内容为空
            })
        })
        catalogObj.catalogAry = catalogAryList;
    } else {
       qpic_logObject('empty',2);
    }
    // qpic_logObject(catalogObj,2);
}

function getAOfTable() {
    //  var text = ".abc";
    // var reg1 = /\b\.abc\b/;
    // var reg2 = /^\.abc$/;
    // qpic_log(reg1.test(text) , 2); //false
    // qpic_log(reg2.test(text) , 2);//true

    // return;
    var otagsA = document.getElementById("js_content");
    var alls = [];
    if (otagsA) {
        var tables = otagsA.getElementsByTagName('table')[2];//先获取第三部分
        var tres  = tables.getElementsByTagName('tr');
        for (var i = 0; i < tres.length; i++) {
            var tdes  = tres[i].getElementsByTagName('td');
             // qpic_logObject(tdes,2);
            for (var j = 0; j < tdes.length; j++) {
                alls.push(showCatalog(tdes[j]));
            }
        }
    } else {
        qpic_logObject("没找到",2);
    }
    return alls;
}
