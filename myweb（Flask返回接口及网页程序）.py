from flask import Flask,render_template
#导入json模块
import json
#相当于把菜单整合到平台中,整合时指定网页的模板位置，携带参数template_folder
app=Flask(__name__,template_folder="myfolder")
#理解成点餐，点餐必须有一地址，还有一个功能，功能里面必须有返回
#下面的功能表示在页面显示Hello World,必须访问是/hello才可以
#显示文字
@app.route("/hello")
def hello():
    return "Hello World!"
#显示页面，需要使用render_template
@app.route("/index")
def myindex():
    return render_template("index.html")
#返回json数据，企业常用
@app.route("/json")
def myjson():
    a={"书名":"三国演义","作者":"罗贯中"}
    #dumps把json数据转成字符串
    return json.dumps(a,ensure_ascii=False)
if __name__=="__main__":
    #相当于app理解成外卖小哥，代替本人去购餐送餐
    app.run()