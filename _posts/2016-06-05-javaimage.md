---
layout: post
title: "JavaScriptเปลี่ยนพื้นหลังตามช่วงเวลาของวัน"
date: 2016-06-05
category: Java
img:
    url: /img/posts/java-script.jpg
    title: "Java Script"
    alt: "Java Script"
type: entry
---

วันนี้ขอ มาแบ่งปันความรู้เกี่ยวกับ Java Script กันสักหน่อยครับ
ผมเองได้มีโอกาสทำ Project Website หนึ่งที่ลูกค้าอยากให้ ภาพสื่อถึงบรรยากาศ
ผมเลยเสนอว่า ถ้า ผู้ใช้งาน เข้าเว็บตอนเช้า ก็ให้พื้นหลังเป็นยามเช้า เข้าตอนเย็นเห็นพระอาทิตย์ตก เข้ามาเว็บตอนกลางคืน ก็เห็นพระจันทร์ ประมาณนี้ ลูกค้าก็เห็นดีด้วย ผมเลยได้โอกาสเขียน Snippet Java เล็กๆ ขึ้นเพื่องานนี้

โดยตัวอย่างจะแบ่งเป็น 4 ช่วงดังนี้<br>
<img src="/img/posts/1.png" width="150" alt="เช้า 5:01 - 8:00">
<img src="/img/posts/2.png" width="150" alt="สาย 8:01 - 15:00">
<img src="/img/posts/3.png" width="150" alt="เย็น 15:01 - 19:00">
<img src="/img/posts/4.png" width="150" alt="ค่ำ 19:01 - 5:00">
<br>


<pre><code>
  &lt;script type="text/javascript">
    var now = new Date();
    var nowTime = now.getDay();

    var dayTime =  new Date();
    var brunch =  new Date();
    var noon =  new Date();
    var nightTime =  new Date();

    //ตั้งเวลาเริ่มต้นเของช่วงที่ต้องการ

    dayTime.setHours(5);
    dayTime.setMinutes(1);

    brunch.setHours(8);
    brunch.setMinutes(1);

    noon.setHours(15);
    noon.setMinutes(1);

    nightTime.setHours(19);
    nightTime.setMinutes(1);

    //แสดงภาพตามเวลา
    if(dayTime<now && brunch > now){
      document.write('&lt;img src="/img/posts/1.png">');
    }
    else if(brunch<now && noon > now){
      document.write('&lt;img src="/img/posts/2.png">');
    }
    else if(noon<now && nightTime > now){
      document.write('&lt;img src="/img/posts/3.png">');
    }
    else {
      document.write('&lt;img src="/img/posts/4.png">');
    }
  &lt;/script>

  </code></pre>
ผลที่ได้ก็จะเป็นแบบนี้

<script type="text/javascript">
  var now = new Date();
  var nowTime = now.getDay();

  var dayTime =  new Date();
  var brunch =  new Date();
  var noon =  new Date();
  var nightTime =  new Date();

  //ตั้งเวลาเริ่มต้นเของช่วงที่ต้องการ

  dayTime.setHours(5);
  dayTime.setMinutes(1);

  brunch.setHours(8);
  brunch.setMinutes(1);

  noon.setHours(15);
  noon.setMinutes(1);

  nightTime.setHours(19);
  nightTime.setMinutes(1);

  //แสดงภาพตามเวลา
  if(dayTime<now && brunch > now){
    document.write('<img src="/img/posts/1.png">');
  }
  else if(brunch<now && noon > now){
    document.write('<img src="/img/posts/2.png">');
  }
  else if(noon<now && nightTime > now){
    document.write('<img src="/img/posts/3.png">');
  }
  else {
    document.write('<img src="/img/posts/4.png">');
  }
</script>
