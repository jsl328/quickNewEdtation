

/******************** Log  Start ********************/

function qpic_log(content, logType) {
    if (logType == 1 || logType == null) {
        console.log(content);
    } else if (logType == 2) {
        setTimeout(function() { alert(content); }, 1);
    } else {
        
    }
};

function qpic_logObject(object, logType) {
    if (typeof(object) == "object") {
        qpic_log(JSON.stringify(object), logType);
    }else if(typeof(object) == "function") {
        // qpic_log(JSON.stringify(object), logType);
    } else {
        qpic_log(object, logType);
    }
};
/******************** Log End ********************/

//获取a便签的href和title
showCatalog = (td) => {

    //String reg2 ="http://mp.weixin.qq.com/s.*?(?=textvalue)";//网址
    //String reg3="(?<=textvalue=\").*?(?=\")";//对应课名

    let docxStr = td.innerHTML;//a的innerHTML内容
    let reg = /<.+>/gi,//拿去a便签
    reg1  = /'http://mp.weixin.qq.com/s.*?(?=textvalue)'/,
    nodeArr = docxStr.match(reg),//a标签的数组
    hrefArr = [],//截取出来的href属性
    codeArr = [],//截取的a标签内容
    catalogAryList = [],//目录总数据
    hrefReg = /(<a\b[^>]+\bhref=")(\S*)("[^>]*>)(.*?)(<\/a>)/gi,
    // spanValueReg =/<span (.*?)>(.*?)<\/span>/gi,
    // spanValueReg =/<span[^>]*>([\s\S]*?)<\/span>/gi,
    // str.match(/<span[^>]*>([\s\S]*?)<\/span>/)[1]
    spanValueReg = /<span[^>]*>([\s\S]*?)<\/span>/;
    catalogObj ={};
    /*
        //这个就是最终返回的数据,数据接口如下:
        catalogObj = [{catalogAry:[{id:'',href:'',title:''},...]},{catalogObj:[{id:'',href:'',title:''},...]},{...}]
    */
    if (nodeArr !== null && nodeArr !== [] && nodeArr !== undefined) {
        for (let key in nodeArr) {
            let str = nodeArr[key];
            if (str.indexOf("#") >= 0) {
                let href = hrefReg.exec(str);
                hrefArr.push(href[2]);//放下载url
                // qpic_logObject(href[4],2);
                // let span = spanValueReg.exec(href[4]);
                let span = href[4].match(spanValueReg);
                qpic_logObject(span[1],2);
                if (span[1] !== null && span[1] !== undefined ) {
                    codeArr.push(span[1]);//放标题,没搞定
                }
                // qpic_logObject(codeArr,2);
            }else{
                qpic_logObject("没有符合条件的节点",2);
            }
        }
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
    /*
{"catalogAry":
[{"id":0,"href":"http://mp.weixin.qq.com/s?__biz=Mzg3ODEwNTQ4NQ==&amp;mid=2247517329&amp;idx=6&amp;sn=9949ea453276c573e9da3d75d1d3fa52&amp;
chksm=cf1a0273f86d8b655948fd5166bf797f0e7fc9cb341ece790e84f18babdf8a1024948964fec7&amp;scene=21#wechat_redirect","title":"style=\"font-size: 15px;\""}]}
    */
    return catalogObj;
}

//测试案例
function getreversionTest(){
    let text = ".abc";
    let reg1 = /\b\.abc\b/;
    let reg2 = /^\.abc$/;
    qpic_logObject(reg1.test(text) , 2); //false
    qpic_logObject(reg2.test(text) , 2);//true
}

//外部函数，获取table节点下所有td下的a便签
function getAOfTable() {
    var otagsA = document.getElementById("js_content");
    var alls = [];
    if (otagsA) {
        //因为第三部分的地址比较少，所以先获取第三部分
        var tables = otagsA.getElementsByTagName('table')[2];
        var tres  = tables.getElementsByTagName('tr');
        for (var i = 0; i < tres.length; i++) {
            var tdes  = tres[i].getElementsByTagName('td');
            for (var j = 0; j < tdes.length; j++) {
                alls.push(showCatalog(tdes[j]));
            }
        }
    } else {
        qpic_logObject("没找到",2);
    }
    // qpic_logObject("hhhhhhh__" + alls,2);
    return alls;
}
