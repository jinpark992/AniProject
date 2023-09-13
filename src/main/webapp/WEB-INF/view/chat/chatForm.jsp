<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    <script type="module">
    import { Configuration, OpenAIApi } from 'https://cdn.skypack.dev/openai';

    document.querySelector('#send').addEventListener('click', function(){
      var template = `<div class="line">
        <span class="chat-box mine">${ document.querySelector('#input').value }</span>
      </div>`
      document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);

      

      const configuration = new Configuration({
        apiKey: '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',
      });
      const openai = new OpenAIApi(configuration);

      openai.createCompletion({
        model: "text-davinci-002",
        prompt: document.querySelector('#input').value,
        temperature: 0.7,
        max_tokens: 256,
        top_p: 1,
        frequency_penalty: 0,
        presence_penalty: 0,
      }).then((result)=>{
        console.log(result.data.choices[0].text)
        var template = `<div class="line">
          <span class="chat-box">${ result.data.choices[0].text }</span>
        </div>`
        document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
      })

    })
  </script>
    <style>
    .chat-content { height: 350px; overflow-y: scroll;}
    .line { margin-top: 10px; display: flex;}
    .chat-box {background: #eee; padding: 5px; max-width: 200px;}
    .mine {margin-left: auto;}
  </style>
  
</head>
<body>

  <div class="chat-content">
    <div class="line">
      <span class="chat-box">�ȳ�?</span>
    </div>
    <div class="line">
      <span class="chat-box mine">�ȳ�!</span>
    </div>
  </div>
  <input class="chat-box" id="input">
  <button id="send">����</button>


</body>
</html>