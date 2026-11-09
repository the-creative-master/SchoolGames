(function(){
  if(window.__arcadeControlsInstalled)return;window.__arcadeControlsInstalled=true;window.__arcadeHome=new URL('index.html',document.currentScript.src).href;
  function mount(){
    if(!document.body||document.getElementById('offline-arcade-controls'))return;
    const box=document.createElement('div');box.id='offline-arcade-controls';box.style.cssText='position:fixed;top:8px;right:8px;z-index:2147483647;display:flex;gap:6px;font:600 12px system-ui,sans-serif;';
    const btn=document.createElement('button');btn.type='button';btn.style.cssText='background:#211b34;color:white;border:1px solid #b9a8ff;border-radius:7px;padding:8px 10px;cursor:pointer;opacity:.92;font:inherit';
    btn.textContent='✕ Exit game';btn.setAttribute('aria-label','Exit game');
    btn.addEventListener('click',async e=>{e.preventDefault();e.stopPropagation();try{if(document.fullscreenElement)await document.exitFullscreen()}catch(err){}try{if(window.opener){window.close();return}}catch(err){}if(history.length>1){history.back()}else{location.href=new URL(window.__arcadeHome || '../index.html',location.href).href}});
    box.appendChild(btn);document.body.appendChild(box);
  }
  setInterval(mount,1000);if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',mount);else mount();
})();
