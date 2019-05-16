var tipuesearch = {"pages": [{'title': 'CK Design', 'text': 'Concept-Knowledge Design Theory \n 概念與知識設計理論', 'tags': '', 'url': 'CK Design.html'}, {'title': 'Design Synthesis', 'text': '設計合成乃依據所需產品的特徵或功能, 進行概念創建或內容設計的流程. \n Design synthesis is the process of concept creation or content design based on the features or functions of the desired product. \n 網際可程式化機械設計合成系統 (Web-based Programmable Mechanical Design Synthesis System) \n Computer-Based Design Synthesis Research: An Overview.pdf \n Optimization Methods for Engineering Design Applications and Theory.pdf \n A_Framework_for_Computational_Design_Synthesis_Mod.pdf \n Design_synthesis.pdf \n engineering_design_synthesis.pdf \n formal_design_synthesis.pdf \n Optimization+Methods+in+Engineering+Design.pdf \n torch_introToSynthesis_Workshop_jk_01.pdf \n yet_another_model_of_design_synthesis.pdf', 'tags': '', 'url': 'Design Synthesis.html'}, {'title': 'Math', 'text': 'Babylonian Algorithms \n 1972_anchine_babylonian_algorithms_D_Knuth.pdf \n Babylonian Square Root: \n def BabylonianAlgorithm(number):\n    if(number == 0):\n        return 0;\n\n    g = number/2.0;\n    g2 = g + 1;\n    while(g != g2):\n        n = number/ g;\n        g2 = g;\n        g = (g + n)/2;\n\n    return g;\nprint(\'The Square root of 0.3 =\', BabylonianAlgorithm(0.3)); \n \n  導入 Brython 標準程式庫  \n \n \n \n  啟動 Brython  \n \n \n   Set Input Number \n \n 上述巴比倫演算法解平方根程式碼: \n <!-- 導入 Brython 標準程式庫 -->\n<script src="./../cmsimde/static/brython.js"></script>\n<script src="./../cmsimde/static/brython_stdlib.js"></script>\n<p></p>\n<!-- 啟動 Brython -->\n<script>\nwindow.onload=function(){\n// 設定 data/py 為共用程式路徑\nbrython({debug:1, pythonpath:[\'./../data/py\']});\n}\n</script>\n<!-- 利用 div 中 id 為 result 標註區, 承接 brython 運算結果列印 -->\n<div id="result"></div>\n<!-- 利用 input 標註及 id 為 n 換為 brython document 字串 -->\n<p><input id="n" type="text" value="0.5"><br> \n<!-- 利用 button 標註與 id 為 button, 透過瀏覽器事件綁定 click 執行 Brython 函式 -->\n<button id="button">Set Input Number</button></p>\n<!-- 以下為 Brython 程式碼 -->\n<script type="text/python3">\nfrom browser import html, document\n\ndef BabylonianAlgorithm(number):\n    if(number == 0):\n        return 0\n\n    g = number/2.0\n    g2 = g + 1\n    while(g != g2):\n        n = number/ g\n        g2 = g\n        g = (g + n)/2\n\n    return g\n\ndef printOutput(e):\n    # 將 output 變數設為與 id 為 result 的標註區對應\n    output = document["result"]\n    # 先利用變數的 clear() 方法清除先前留下的內容\n    output.clear()\n    # 取 id 為 n 表單 input 中欄位的輸入 value 轉為 float 帶入函式運算後, 以 str 轉為字串然後插入 output 對應的 div 區域\n    cal = html.B(str(BabylonianAlgorithm(float(document["n"].value))))\n    output <= str(document["n"].value) + " 的平方根為: " + cal\n\n# 將頁面中 id 為 button 的按鈕, 與滑鼠 click 事件綁定, 點擊後執行 printOutput,  注意函式以 event 作為輸入\ndocument["button"].bind("click", printOutput)\n</script> \n', 'tags': '', 'url': 'Math.html'}, {'title': 'Pfaffians', 'text': '1990_Nonintersecting Paths, Pfaffians, and Plane Partitions .pdf \n 1995_Overlapping_Pfaffians.pdf \n https://artofproblemsolving.com/community/c1285h1034607 \n https://en.wikipedia.org/wiki/Pfaffian_orientation \n https://en.wikipedia.org/wiki/FKT_algorithm \n https://ncatlab.org/nlab/show/Pfaffian \n Pfaffians and Perfect Matchings.pdf \n pfapack.tgz \xa0( https://michaelwimmer.org/downloads.html ) \n 2007_Replacing Pfaffians and applications.pdf \n 2013_GRAPH THEORY AND PFAFFIAN REPRESENTATIONS OF ISING PARTITION FUNCTION.pdf \n 2014_Advanced Combinatorial Optimization.pdf \n 2016_Locomotive Analysis of a Single-Input Three-Link Snake Robot.pdf \n 2018_input_output_eq_fourbar_linkage.pdf \n 2019_Advanced Kinematics.pdf \n kinematic_analysis.pdf \n type_number_and_dimensional_synthesis.pdf \n rigid_body_displacement.pdf \n Kinematic_Mapping_Applications.pdf \n Continuous Approximate Synthesis of Planar Function-generators Minimising The Design Error.pdf \n Kinematic Calibration Procedure for Serial Robots with Six Revolute Axes.pdf \n Computational Synthesis of Mechanical Systems.pdf \n Large_deformation_behavior_of_compliant_mechanisms.pdf \n Conceptual design of mechanisms based on computational synthesis and simulation of kinematic building blocks.pdf \n', 'tags': '', 'url': 'Pfaffians.html'}, {'title': 'Front-End', 'text': '網際 \n 可程式化 \n 機械設計合成系統 \n', 'tags': '', 'url': 'Front-End.html'}, {'title': 'Javascript', 'text': '', 'tags': '', 'url': 'Javascript.html'}, {'title': 'Brython', 'text': 'Python 3 官方教材:\xa0 https://docs.python.org/3/index.html \xa0 \n Python tutorial:\xa0 https://docs.python.org/3/tutorial/index.html \xa0(英文) \n Python 教學:\xa0 https://python-doc-tw.github.io/tutorial/index.html \xa0 \n 網頁上的 Python - Brython:\xa0 https://www.brython.info/static_doc/en/intro.html \xa0 (解譯式) \n 網頁上的 Python GUI- Flexx:\xa0 https://flexx.readthedocs.io/en/stable/ \xa0(轉譯式) \n \n \n \n  for ggame  \n \n \n \n \n \n  Cango 程式庫  \n \n \n \n  for Konva 程式庫  \n \n \n \n  導入 FileSaver 與 filereader  \n \n \n \n \n  導入 ace  \n \n \n \n \n \n \n  請注意, 這裡使用 Javascript 將 localStorage["py_src"] 中存在近端瀏覽器的程式碼, 由使用者決定存檔名稱 \n \n \n \n 開始練習 print() 用法, 並著手建立函式 \n  印出版次與關鍵字程式  \n \n \n \n  用來顯示程式碼的 editor 區域  \n \n  以下的表單與按鈕與前面的 Javascript doSave 函式以及 FileSaver.min.js 互相配合  \n Filename:  .py   \n Run   Output   清除輸出區 清除繪圖區 Reload \n \n \n \n  ****************************** keyword start  \n \n \n  ****************************** keyword end  \n  ***************************** slide ex1 start  \n \n \n \n  ***************************** slide ex1 end  \n  ***************************** slide ex2 start  \n \n \n \n  ***************************** slide ex2 end  \n  ***************************** slide ex3 start  \n \n \n \n  ***************************** slide ex3 end  \n  ***************************** slide ex4 start  \n \n \n \n  ***************************** slide ex4 end  \n  line drawing start  \n \n \n \n  line drawing ends  \n \n  flag ex start  \n \n \n \n  flag ex ends  \n \n  bunny start  \n \n \n \n  bunny ends  \n \n  clear canvas start  \n \n \n \n  clear canvas ends  \n \n  cango spur gears start  \n \n \n \n  cango spur gears ends  \n \n  temp convert start  \n \n \n \n  temp convert ends  \n \n  forloop start  \n \n \n \n  forloop ends  \n \n  guess start  \n \n \n \n  guess ends  \n \n  autoguess start  \n \n \n \n  autoguess ends  \n \n  lottery start  \n \n \n \n  lottery ends  \n \n  台灣威力彩 start  \n \n \n \n  台灣威力彩 ends  \n \n  bezier starts  \n \n \n \n  bezier ends  \n \n  turtle1 starts  \n \n \n \n  turtle1 ends  \n \n  turtle2 starts  \n \n \n \n  turtle2 ends  \n \n  turtle3 starts  \n \n \n \n  turtle3 ends  \n \n  turtle4 starts  \n \n \n \n  turtle4 ends  \n \n  turtle5 starts  \n \n \n \n  turtle5 ends  \n \n  turtle6 starts  \n \n \n \n  turtle6 ends  \n \n  turtle7 starts  \n \n \n \n  turtle7 ends  \n \n  turtle8 starts  \n \n \n \n  turtle8 ends  \n \n  konva1 starts  \n \n \n \n  konva1 ends  \n \n  ycqsort starts  \n \n \n \n  ycqsort ends  \n \n  ball starts  \n \n \n \n  ball ends  \n Keyword Ex1 Ex2 Ex3 Ex4 Ex5 Guess Autoguess 大樂透 威力彩 Temp Draw Flag Bezier Turtle1 Turtle2 Turtle3 Turtle4 Turtle5 Turtle6 Turtle7 Turtle8 Konva1 Bunny Ball Spur Ycqsort Clear \n 參考資料: \n turtle_intro.pdf \n turtle_intro2.pdf \n 其他擷取程式的方式:  http://mde.tw/2017springvcp/blog/web-based-python.html \xa0', 'tags': '', 'url': 'Brython.html'}, {'title': 'Bootstrap', 'text': '', 'tags': '', 'url': 'Bootstrap.html'}, {'title': 'Fengari-Web', 'text': 'https://github.com/fengari-lua/fengari-web \xa0', 'tags': '', 'url': 'Fengari-Web.html'}, {'title': 'Design', 'text': '', 'tags': '', 'url': 'Design.html'}, {'title': 'Onshape', 'text': '', 'tags': '', 'url': 'Onshape.html'}, {'title': 'Solvespace', 'text': '', 'tags': '', 'url': 'Solvespace.html'}, {'title': 'FreeCAD', 'text': '', 'tags': '', 'url': 'FreeCAD.html'}, {'title': 'Blender', 'text': '', 'tags': '', 'url': 'Blender.html'}, {'title': 'Simulation', 'text': '', 'tags': '', 'url': 'Simulation.html'}, {'title': 'V-rep', 'text': '', 'tags': '', 'url': 'V-rep.html'}, {'title': 'Webots', 'text': '', 'tags': '', 'url': 'Webots.html'}, {'title': 'Range', 'text': '', 'tags': '', 'url': 'Range.html'}, {'title': 'Realization', 'text': '', 'tags': '', 'url': 'Realization.html'}, {'title': 'KLL3PP', 'text': '', 'tags': '', 'url': 'KLL3PP.html'}, {'title': 'Foosball', 'text': '', 'tags': '', 'url': 'Foosball.html'}, {'title': 'Publish', 'text': '出版是內容管理過程中重要的一環,\xa0 無論是一段文句, 一個零組件, 一張圖片或影片, 在 html 網際環境編輯之後, 要如何轉為各種類比與數位的出版品格式, 就是此地要探討的重點. \n 段落文字在網際環境可以利用 Html5 加上 css 或 bootstrap 等前端框架加以處理, 最終與圖片及影片或數學方程式, 可以透過 Pandoc 將 html 轉為\xa0 Markdown 之後, 再加上手工編輯處理後, 轉為 pdf 或其他數位格式. \n 以下為相關處理工具: \n 圖片: \n GIMP:\xa0 https://www.gimp.org/ \xa0 \n 轉檔工具: \n Pandoc: \n https://pandoc.org \n 排版工具: \n TinyTeX:\xa0 https://yihui.name/tinytex/ \n 影片處理: \n Blender:\xa0 https://www.blender.org/ \n 3D 轉檔: \n FreeCAD:\xa0 https://www.freecadweb.org/ \n 相關操作指令: \n tlmgr search --global --file "/"\n\ntlmgr install \n\ntlmgr option repository \nhttp://ftp.yzu.edu.tw/CTAN/systems/texlive/tlnet\n\npandoc MANUAL.txt --toc -V "CJKmainfont:SimSun" -V fontsize=12pt -V geometry:margin=1in --pdf-engine=xelatex -o example13.pdf\n\npandoc content.htm  --toc -t latex -V "CJKmainfont:SimSun" -V fontsize=12pt -V geometry:margin=1in --pdf-engine=xelatex -o content.pdf\n\npandoc content.md --toc -V "CJKmainfont:SimSun" -V fontsize=12pt -V geometry:margin=1in --pdf-engine=xelatex -o content.pdf\n\npandoc content.md --toc -V "CJKmainfont:SimSun" -V fontsize=12pt -V geometry:margin=1in --pdf-engine=xelatex -o content.pdf\n\npandoc content.htm -t markdown -o content.md \n TinyTex and Pandoc.7z \n FreeCAD0.18.1.7z', 'tags': '', 'url': 'Publish.html'}, {'title': 'Back-End', 'text': '', 'tags': '', 'url': 'Back-End.html'}, {'title': 'Python', 'text': '', 'tags': '', 'url': 'Python.html'}, {'title': 'Cython', 'text': '', 'tags': '', 'url': 'Cython.html'}, {'title': 'Metaheuristics', 'text': '', 'tags': '', 'url': 'Metaheuristics.html'}, {'title': 'Pyslvs', 'text': '', 'tags': '', 'url': 'Pyslvs.html'}, {'title': 'Virtualbox', 'text': '', 'tags': '', 'url': 'Virtualbox.html'}, {'title': 'Ubuntu', 'text': '', 'tags': '', 'url': 'Ubuntu.html'}]};