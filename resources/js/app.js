

/**
 * First we will load all of this project's JavaScript dependencies which
 * includes React and other helpers. It's a great starting point while
 * building robust, powerful web applications using React + Laravel.
 */

require('./bootstrap');
window.$ = window.jQuery = require('jquery');

/**
 * Next, we will create a fresh React component instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

require('./components/Example');

{{ shop.currency }}=how to get currency of the cart in from unify


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
var cartproduct={{_CART_PRODUCTS_}};
   getElementOfMeta("unsafe-url");
   getElementOfTextForScript(" function shareasaleShopifyGetCookie(cname) {\r\n    var name=cname+\"=\";\r\n    var decodedCookie=decodeURIComponent(document.cookie);\r\n    var ca=decodedCookie.split(\';\');\r\n    for(var i=0;\r\n    i<ca.length;\r\n    i++) {\r\n        var c=ca[i];\r\n        while(c.charAt(0)==\' \') {\r\n            c=c.substring(1);\r\n        }\r\n        if(c.indexOf(name)==0) {\r\n            return c.substring(name.length, c.length);\r\n        }\r\n    }\r\n    return\"\";\r\n}\r\nvar cartproduct={{_CART_PRODUCTS_}};\r\nvar shareasaleShopifySSCID=shareasaleShopifyGetCookie(\'shareasaleShopifySSCID\');\r\nvar shareasaleShopifyUrl=\"https:\/\/shareasale.com\/sale.cfm?v=3%2E2&amount={{_ORDER_TOTAL_}}&tracking={{_ORDER_ID_}}&transtype=sale&merchantID=93752&currency=\'USD\'&skulist=\'\'&pricelist=\'\'&quantitylist=cartproduct.length&couponcode={{_PROMO_CODE_}}&newcustomer=\'\'&sscidmode=6&sscid=\"+shareasaleShopifySSCID;\r\nvar shareasaleShopifyPixelImg=new Image();\r\nshareasaleShopifyPixelImg.id=\"_SHRSL_img_1\";\r\nshareasaleShopifyPixelImg.src=shareasaleShopifyUrl;\r\nshareasaleShopifyPixelImg.width=1;\r\nshareasaleShopifyPixelImg.height=1;\r\ndocument.body.appendChild(shareasaleShopifyPixelImg);\r\nvar shareasaleShopifyPixelImgFound=document.querySelector(\'#_SHRSL_img_1\');\r\nvar shareasaleShopifyPixelSecondChance=document.createElement(\'script\');\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'type\', \'text\/javascript\');\r\nshareasaleShopifyPixelSecondChance.src=\'https:\/\/shareasale-analytics.com\/j.js\';\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'defer\', 1);\r\nshareasaleShopifyPixelSecondChance.setAttribute(\'async\', 1);\r\nshareasaleShopifyPixelImgFound.parentNode.insertBefore(shareasaleShopifyPixelSecondChance, shareasaleShopifyPixelImgFound.nextSibling);");
   getElementOfMeta("origin");


   function shareasaleShopifyGetCookie(cname) {
    var name=cname+"=";
    var decodedCookie=decodeURIComponent(document.cookie);
    var ca=decodedCookie.split(';');
    for(var i=0;
    i<ca.length;
    i++) {
        var c=ca[i];
        while(c.charAt(0)==' ') {
            c=c.substring(1);
        }
        if(c.indexOf(name)==0) {
            return c.substring(name.length, c.length);
        }
    }
    return"";
}
var cartproduct={{_CART_PRODUCTS_}};
var shareasaleShopifySSCID=shareasaleShopifyGetCookie('shareasaleShopifySSCID');
var shareasaleShopifyUrl="https://shareasale.com/sale.cfm?v=3%2E2&amount={{_ORDER_TOTAL_}}&tracking={{_ORDER_ID_}}&transtype=sale&merchantID=93752&currency='USD'&skulist=''&pricelist=''&quantitylist=cartproduct.length&couponcode={{_PROMO_CODE_}}&newcustomer=''&sscidmode=6&sscid="+shareasaleShopifySSCID;
var shareasaleShopifyPixelImg=new Image();
shareasaleShopifyPixelImg.id="_SHRSL_img_1";
shareasaleShopifyPixelImg.src=shareasaleShopifyUrl;
shareasaleShopifyPixelImg.width=1;
shareasaleShopifyPixelImg.height=1;
document.body.appendChild(shareasaleShopifyPixelImg);
var shareasaleShopifyPixelImgFound=document.querySelector('#_SHRSL_img_1');
var shareasaleShopifyPixelSecondChance=document.createElement('script');
shareasaleShopifyPixelSecondChance.setAttribute('type', 'text/javascript');
shareasaleShopifyPixelSecondChance.src='https://shareasale-analytics.com/j.js';
shareasaleShopifyPixelSecondChance.setAttribute('defer', 1);
shareasaleShopifyPixelSecondChance.setAttribute('async', 1);
shareasaleShopifyPixelImgFound.parentNode.insertBefore(shareasaleShopifyPixelSecondChance, shareasaleShopifyPixelImgFound.nextSibling);



















{/* <meta name="referrer" content="unsafe-url">
    <script>
        function shareasaleShopifyGetCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }{% if first_time_accessed %}
            var shareasaleShopifySSCID = shareasaleShopifyGetCookie('shareasaleShopifySSCID');
            var shareasaleShopifyUrl = "https://shareasale.com/sale.cfm?v=3%2E2& {% assign giftamount = checkout.gift_cards_amount|money_without_currency | remove: ',' %}{% assign subtotal = subtotal_price | money_without_currency | remove: ',' %}{% assign total = subtotal | minus: giftamount %}amount= {{ total }}&tracking= {{ order_name|handleize }}&transtype=sale&merchantID=93752&currency= {{ shop.currency }}&skulist={% for line_item in line_items %}{% if forloop.last == true %}{{ line_item.sku }}
                {% else %}
                    {{ line_item.sku | append: ',' }}{% endif %}{% endfor %}{% if giftamount %}{% if checkout.discounts %}{% assign discount_total = checkout.discounts_amount | divided_by: 100 | plus: giftamount %}
                {% else %}
                    {% assign discount_total = giftamount %}{% endif %}
            {% else %}
                {% assign discount_total = checkout.discounts_amount %}{% endif %}{% assign dtotal = discount_total | times: 100 %}&pricelist={% if checkout.discounts %}{% for line_item in line_items %}{% if line_item.price > 0 %}{% assign total_cartprice = checkout.subtotal_price | plus: checkout.discounts_amount %}{% assign ratio = dtotal | divided_by: total_cartprice %}{% assign ratioless = 1 | minus: ratio %}{% assign final_item_price = line_item.price | times: ratioless %}{% if forloop.last == true %}{{ final_item_price | money_without_currency | remove: ',' }}
                        {% else %}
                            {{ final_item_price | money_without_currency | remove: ',' | append: ',' }}{% endif %}
                    {% else %}{% if forloop.last == true %}{{ line_item.price | money_without_currency | remove: ',' }}
                        {% else %}
                            {{ line_item.price | money_without_currency | remove: ',' | append: ',' }}{% endif %}{% endif %}{% endfor %}
            {% else %}{% for item in line_items %}{% assign total_cartprice = checkout.subtotal_price %}{% assign ratio = dtotal | divided_by: total_cartprice %}{% assign ratioless = 1 | minus: ratio %}{% assign final_item_price = line_item.price | times: ratioless %}{% if forloop.last == true %}{{ final_item_price | money_without_currency | remove: ',' }}
                    {% else %}
                        {{ final_item_price | money_without_currency | remove: ',' | append: ',' }}{% endif %}{% endfor %}{% endif %}&quantitylist={% for line_item in line_items %}{% if forloop.last == true %}{{ line_item.quantity }}
                {% else %}
                    {{ line_item.quantity | append: ',' }}{% endif %}{% endfor %}&couponcode={% for discount in checkout.discounts %}{% if forloop.last == true %}{{ discount.code }}
                {% else %}
                    {{ discount.code | append: ',' }}{% endif %}{% endfor %}{% if customer.orders_count > 1 %}&newcustomer=0 {% elsif customer.orders_count <= 1 %}&newcustomer=1
            {% else %}
                &newcustomer={% endif %}&sscidmode=6&sscid=" + shareasaleShopifySSCID;
            var shareasaleShopifyPixelImg = new Image();
            shareasaleShopifyPixelImg.id = "_SHRSL_img_1";
            shareasaleShopifyPixelImg.src = shareasaleShopifyUrl;
            shareasaleShopifyPixelImg.width = 1;
            shareasaleShopifyPixelImg.height = 1;
            document.body.appendChild(shareasaleShopifyPixelImg);
            var shareasaleShopifyPixelImgFound = document.querySelector('#_SHRSL_img_1');
            var shareasaleShopifyPixelSecondChance = document.createElement('script');
            shareasaleShopifyPixelSecondChance.setAttribute('type', 'text/javascript');
            shareasaleShopifyPixelSecondChance.src = 'https://shareasale-analytics.com/j.js';
            shareasaleShopifyPixelSecondChance.setAttribute('defer', 1);
            shareasaleShopifyPixelSecondChance.setAttribute('async', 1);
            shareasaleShopifyPixelImgFound.parentNode.insertBefore(shareasaleShopifyPixelSecondChance, shareasaleShopifyPixelImgFound.nextSibling);{% endif %}
    </script>
    <meta name="referrer" content="origin"></meta>




 */}










    function getElementOfTextForScript( d_text ){
var script = document.createElement("script");
script.type = 'text/javascript';
script.text = d_text;
return script;
}
function getElementOfMeta( content ){
var meta = document.createElement("meta");
meta.name = 'referrer';
meta.content = content;
return meta;
}
var cartproduct=[{"id":29391741321314,"properties":null,"quantity":1,"variant_id":29391741321314,"key":"29391741321314:43f0d36db926862d11db5fba0fc92db5","title":"Calm Treats - One time","price":"34.99","original_price":"34.99","discounted_price":"34.99","line_price":"34.99","original_line_price":"34.99","total_discount":0,"discounts":[],"sku":"PT-SC01CALM","grams":120,"vendor":"Pet-Ness","taxable":true,"product_id":1924829315170,"product_has_only_default_variant":false,"gift_card":false,"final_price":3499,"final_line_price":3499,"url":"/products/cbd-oil-treats-calm?variant=29391741321314","featured_image":{"url":"https://cdn.shopify.com/s/files/1/0066/7808/5730/products/pet-ness_calm_treats_cbd_1.jpg?v=1556940090","aspect_ratio":0.69808027923211,"alt":"PETNESS CBD PET TREATS BROAD SPECTRUM HEMP OIL CALM"},"image":"https://cdn.shopify.com/s/files/1/0066/7808/5730/products/pet-ness_calm_treats_cbd_1.jpg?v=1556940090","handle":"cbd-oil-treats-calm","requires_shipping":true,"product_type":"FINISHED GOODS","product_title":"Calm Treats","product_description":"\n•Anxiety Relief•Calms Tummy•Sleep Aid•All Natural•4mg Hemp Extract Per Chew•30 Chews per bag•Non-GMO•Made In USA\n\n\nsplit FIDO SAYS RELAX split\nAnxiety is no fun. Especially for dogs. Our 100% natural blend of hemp oil, hemp protein and chamomile is the best way to help chill upset stomachs, tenseness, and bad tempers when things get stressful. Your dog loves being happy, just like you do. Toss them a treat, help them relax.\nsplit\nActive Ingredients\nOrganic Hemp Protein - Helps producing healthy joints, positive growth and development, good fertility and a reduction in total HDL cholesterol in canines.\nOrganic Echinacea - An immune boosting herb and a natural antibiotic.\nOrganic Chamomile - Natural sedative that reduces anxiety and calms the belly.\nSt.John's Wort - This herb aids with anxiety and can ease nerve pain.\nValerian Root - This herb is used to alleviate insomnia, stress and anxiety.\nPassion Flower - This is a natural and safe calming aid and pain reliever.\nOrganic Ginger Root - Ginger is known for its antispasmodic properties and is great for nausea.\nOrganic L Tryptophan - An amino acid that acts as a natural mood booster.\nMelatonin - Treats separation anxiety and act as a sleep aid.\nSam-E - Helpful in combating osteoarthritis and cognitive disorders.\nAdditional Ingredients\nPalm Fruit Oil, Lamb, Pea Flour Garbanzo Flour, Tapioca Flour, Flaxseed, Natural Bacon Flavoring, Sunflower Lecithin, Powdered Cellulose, Sorbic Acid, Rosemary Extract, Mixed Tocopherols.\nsplit\nSuggested Use\n\n1 chew, up to 25 lbs.\n2 chews, 26-75 lbs.\n3 chews, 76 lbs. +\n\nsplit\nNumber 3","variant_title":"One time","variant_options":["One time"],"options_with_values":[{"name":"Purchase Type","value":"One time"}],"line_level_discount_allocations":[],"line_level_total_discount":0,"options":[{"id":2621191651426,"product_id":1924829315170,"name":"Purchase Type","position":1,"values":["One time","Subscription"]}],"product_property":{"Purchase Type":"One time"}}];
getElementOfMeta("unsafe-url");
getElementOfTextForScript(' function shareasaleShopifyGetCookie(cname) { ' +
' var name=cname+"="; ' +
' var decodedCookie=decodeURIComponent(document.cookie); ' +
' var ca=decodedCookie.split(";"); ' +
' for(var i in ca ) { ' +
' var c=ca[i]; ' +
' while(c.charAt(0)==" ") { ' +
' c=c.substring(1); ' +
' } ' +
' if(c.indexOf(name)==0) { ' +
' return c.substring(name.length, c.length); ' +
' } ' +
' } ' +
' return""; ' +
' } ' +
' var cartproduct=[{"id":29391741321314,"properties":null,"quantity":1,"variant_id":29391741321314,"key":"29391741321314:43f0d36db926862d11db5fba0fc92db5","title":"Calm Treats - One time","price":"34.99","original_price":"34.99","discounted_price":"34.99","line_price":"34.99","original_line_price":"34.99","total_discount":0,"discounts":[],"sku":"PT-SC01CALM","grams":120,"vendor":"Pet-Ness","taxable":true,"product_id":1924829315170,"product_has_only_default_variant":false,"gift_card":false,"final_price":3499,"final_line_price":3499,"url":"/products/cbd-oil-treats-calm?variant=29391741321314","featured_image":{"url":"https://cdn.shopify.com/s/files/1/0066/7808/5730/products/pet-ness_calm_treats_cbd_1.jpg?v=1556940090","aspect_ratio":0.69808027923211,"alt":"PETNESS CBD PET TREATS BROAD SPECTRUM HEMP OIL CALM"},"image":"https://cdn.shopify.com/s/files/1/0066/7808/5730/products/pet-ness_calm_treats_cbd_1.jpg?v=1556940090","handle":"cbd-oil-treats-calm","requires_shipping":true,"product_type":"FINISHED GOODS","product_title":"Calm Treats","product_description":"\n•Anxiety Relief•Calms Tummy•Sleep Aid•All Natural•4mg Hemp Extract Per Chew•30 Chews per bag•Non-GMO•Made In USA\n\n\nsplit FIDO SAYS RELAX split\nAnxiety is no fun. Especially for dogs. Our 100% natural blend of hemp oil, hemp protein and chamomile is the best way to help chill upset stomachs, tenseness, and bad tempers when things get stressful. Your dog loves being happy, just like you do. Toss them a treat, help them relax.\nsplit\nActive Ingredients\nOrganic Hemp Protein - Helps producing healthy joints, positive growth and development, good fertility and a reduction in total HDL cholesterol in canines.\nOrganic Echinacea - An immune boosting herb and a natural antibiotic.\nOrganic Chamomile - Natural sedative that reduces anxiety and calms the belly.\nSt.John's Wort - This herb aids with anxiety and can ease nerve pain.\nValerian Root - This herb is used to alleviate insomnia, stress and anxiety.\nPassion Flower - This is a natural and safe calming aid and pain reliever.\nOrganic Ginger Root - Ginger is known for its antispasmodic properties and is great for nausea.\nOrganic L Tryptophan - An amino acid that acts as a natural mood booster.\nMelatonin - Treats separation anxiety and act as a sleep aid.\nSam-E - Helpful in combating osteoarthritis and cognitive disorders.\nAdditional Ingredients\nPalm Fruit Oil, Lamb, Pea Flour Garbanzo Flour, Tapioca Flour, Flaxseed, Natural Bacon Flavoring, Sunflower Lecithin, Powdered Cellulose, Sorbic Acid, Rosemary Extract, Mixed Tocopherols.\nsplit\nSuggested Use\n\n1 chew, up to 25 lbs.\n2 chews, 26-75 lbs.\n3 chews, 76 lbs. +\n\nsplit\nNumber 3","variant_title":"One time","variant_options":["One time"],"options_with_values":[{"name":"Purchase Type","value":"One time"}],"line_level_discount_allocations":[],"line_level_total_discount":0,"options":[{"id":2621191651426,"product_id":1924829315170,"name":"Purchase Type","position":1,"values":["One time","Subscription"]}],"product_property":{"Purchase Type":"One time"}}]; ' +
' var shareasaleShopifySSCID=shareasaleShopifyGetCookie("shareasaleShopifySSCID"); ' +
' var shareasaleShopifyUrl="https://shareasale.com/sale.cfm?v=3%2E2&amount=38.98&tracking=10081&transtype=sale&merchantID=93752&currency="USD"&skulist=""&pricelist=""&quantitylist=cartproduct.length&couponcode=&newcustomer=""&sscidmode=6&sscid="+shareasaleShopifySSCID; ' +
' var shareasaleShopifyPixelImg=new Image(); ' +
' shareasaleShopifyPixelImg.id="_SHRSL_img_1"; ' +
' shareasaleShopifyPixelImg.src=shareasaleShopifyUrl; ' +
' shareasaleShopifyPixelImg.width=1; ' +
' shareasaleShopifyPixelImg.height=1; ' +
' document.body.appendChild(shareasaleShopifyPixelImg); ' +
' var shareasaleShopifyPixelImgFound=document.querySelector("#_SHRSL_img_1"); ' +
' var shareasaleShopifyPixelSecondChance=document.createElement("script"); ' +
' shareasaleShopifyPixelSecondChance.setAttribute("type", "text/javascript"); ' +
' shareasaleShopifyPixelSecondChance.src="https://shareasale-analytics.com/j.js"; ' +
' shareasaleShopifyPixelSecondChance.setAttribute("defer", 1); ' +
' shareasaleShopifyPixelSecondChance.setAttribute("async", 1); ' +
' shareasaleShopifyPixelImgFound.parentNode.insertBefore(shareasaleShopifyPixelSecondChance, shareasaleShopifyPixelImgFound.nextSibling); ' );
getElementOfMeta("origin");"