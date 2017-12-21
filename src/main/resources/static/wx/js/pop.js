var pop = {
    init: function (dat) {
        this.clean();
        var div=document.createElement("div");
        var mask=document.createElement("div");
        mask.className = 'chick_prompt_mask';
        div.className = 'prompts in';
        div.innerHTML = dat.html;
        var w = dat.size[0];
        var h = dat.size[1];
        div.style = 'width: '+w+'px; height: '+h+'px;left: calc(50% - '+w/2+'px); top: calc(50% - '+h/2+'px)'
        document.body.appendChild(mask);
        document.body.appendChild(div)
    },
    clean: function () {
        var mask = document.querySelector('.chick_prompt_mask');
        if (mask) {
            document.body.removeChild(mask);
        }
        var prompts = document.querySelector('.prompts');
        if (prompts) {
            prompts.setAttribute('class', 'prompts out');
            setTimeout(function () {
                document.body.removeChild(prompts)
            }, 350)
        }
    }
}