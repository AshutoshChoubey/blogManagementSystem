// ------------------------------script that i added at Unify---------------//

function getElementOfTextForScript( d_text ){
    var script = document.createElement("script");
    script.type = 'text/javascript';
    script.text = d_text;
    return  script;
   } 
function getElementOfMeta( content ){
var meta = document.createElement("meta");
meta.name = 'referrer';
meta.content = content;
return  meta;
} 
   getElementOfMeta("unsafe-url");
   getElementOfTextForScript("function shareasaleShopifyGetCookie(cname) {\r\n    var name=cname+\"=\";\r\n    var decodedCookie=decodeURIComponent(document.cookie);\r\n    var ca=decodedCookie.split(\';\');\r\n    for(var i in ca) {\r\n        var c=ca[i];\r\n        while(c.charAt(0)==\' \') {\r\n            c=c.substring(1);\r\n        }\r\n        if(c.indexOf(name)==0) {\r\n            return c.substring(name.length, c.length);\r\n        }\r\n    }\r\n    return\"\";\r\n}\r\nvar shareasaleShopifySSCID=shareasaleShopifyGetCookie(\'shareasaleShopifySSCID\');\r\nvar shareasaleShopifyUrl=\"https:\/\/shareasale.com\/sale.cfm?v=3%2E2&amount={{_ORDER_TOTAL_}}&tracking={{_ORDER_ID_}}&transtype=sale&merchantID=93752&currency=USD&skulist=&pricelist=&quantitylist=&couponcode={{_PROMO_CODE_}}&newcustomer=&sscidmode=6&sscid=\"+shareasaleShopifySSCID;\r\nvar shareasaleShopifyPixelImg=new Image();\r\nshareasaleShopifyPixelImg.id=\"_SHRSL_img_1\";\r\nshareasaleShopifyPixelImg.src=shareasaleShopifyUrl;\r\nshareasaleShopifyPixelImg.width=1;\r\nshareasaleShopifyPixelImg.height=1;\r\ndocument.body.appendChild(shareasaleShopifyPixelImg);\r\nvar shareasaleShopifyPixelImgFound=document.querySelector(\'#_SHRSL_img_1\');\r\nvar shareasaleShopifyPixelSecondChance=document.createElement(\'script\');\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'type\', \'text\/javascript\');\r\nshareasaleShopifyPixelSecondChance.src=\'https:\/\/shareasale-analytics.com\/j.js\';\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'defer\', 1);\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'async\', 1);\r\nshareasaleShopifyPixelImgFound.parentNode.insertBefore(shareasaleShopifyPixelSecondChance, shareasaleShopifyPixelImgFound.nextSibling);");
   getElementOfMeta("origin");

// ------------------------------script that i added at Unify---------------//
