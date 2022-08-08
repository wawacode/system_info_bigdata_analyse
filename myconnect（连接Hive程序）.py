from flask import Flask,render_template
#导入json模入
import json
#导入impyla中的dbapi
from impala.dbapi import connect
#相当于把菜单整合到平台中
app=Flask(__name__,template_folder="myfolder")
#定义根路径，专门访问myweb.html
@app.route("/")
def index():
    return render_template("myweb.html")
#定义一个连接hive的接口地址
@app.route("/link")
def link():
    try:
        #连接hive2的服务器
        conn=connect(host="192.168.110.156",port=10000,user="root",password="admin",auth_mechanism="PLAIN")
        #连接后，获取游标，标志指示数据库的当前记录
        cursor=conn.cursor()
        #游标帮助我们执持HQL语句
        cursor.execute("select hour(sysdate),max(cpu_us) from system group by hour(sysdate)")
        #查询的结果在cursor.fetchall方法中
        results=cursor.fetchall()
        a_json={"result":results,"status":200}
        print(a_json)
        return json.dumps(a_json,ensure_ascii=False)
    except:
        return json.dumps({"result":"网络连接错误","status":404},ensure_ascii=False)

if __name__=="__main__":
    #相当于app理解成外卖小哥，代替本人去购餐送餐
    app.run()