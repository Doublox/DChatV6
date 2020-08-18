var msg = '';
window.APP = {
  template: '#app_template',
  name: 'app',
  data() {
    return {
      style: CONFIG.style,
      showInput: false,
      showWindow: false,
      showTab: false,
	    showHuongdan: false,
      shouldHide: true,
      backingSuggestions: [],
      removedSuggestions: [],
      templates: CONFIG.templates,
      message: '',
      messages: [],
      messagesA: [],
      messagesG: [],
      oldMessages: [],
      oldMessagesIndex: -1,
      tplBackups: [],
      msgTplBackups: []
    };
  },
  destroyed() {
    clearInterval(this.focusTimer);
    window.removeEventListener('message', this.listener);
  },
  mounted() {
    $.post('http://chat/loaded', JSON.stringify({}));
    this.listener = window.addEventListener('message', (event) => {
      const item = event.data || event.detail; //'detail' is for debuging via browsers
      if (this[item.type]) {
        this[item.type](item);
      }
    });
  },
  watch: {
    messages() {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.showTab = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messages;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
	
	messagesA() {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.showTab = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messagesA;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
	
	messagesG() {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.showTab = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messagesG;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
	
	message: function(val) {
		mgs1 = val
		//data.msg = val
		//console.log(mgs1);
	}
  },
  computed: {
    suggestions() {
      return this.backingSuggestions.filter((el) => this.removedSuggestions.indexOf(el.name) <= -1);
    },
    length() {
      return 1;
    },
  },
  methods: {
    ON_SCREEN_STATE_CHANGE({ shouldHide }) {
      this.shouldHide = shouldHide;
    },
    ON_OPEN() {
      this.showInput = true;
      this.showWindow = true;
      this.showTab = true;
	    this.showHuongdan = true;
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.focusTimer = setInterval(() => {
        if (this.$refs.input) {
          this.$refs.input.focus();
        } else {
          clearInterval(this.focusTimer);
        }
      }, 100);
    },
    ON_MESSAGE({ message }) {
      this.messages.push(message);
    },
    ON_MESSAGEA({ message }) {
      this.messagesA.push(message);
    },
    ON_MESSAGEG({ message }) {
      this.messagesG.push(message);
    },
    ON_CLEAR() {
      this.messages = [];
      this.oldMessages = [];
      this.oldMessagesIndex = -1;
    },
    ON_SUGGESTION_ADD({ suggestion }) {
      const duplicateSuggestion = this.backingSuggestions.find(a => a.name == suggestion.name);
      if (duplicateSuggestion) {
        if(suggestion.help || suggestion.params) {
          duplicateSuggestion.help = suggestion.help || "";
          duplicateSuggestion.params = suggestion.params || [];
        }
        return;
      }
      if (!suggestion.params) {
        suggestion.params = []; //TODO Move somewhere else
      }
      this.backingSuggestions.push(suggestion);
    },
    ON_SUGGESTION_REMOVE({ name }) {
      if(this.removedSuggestions.indexOf(name) <= -1) {
        this.removedSuggestions.push(name);
      }
    },
    ON_TEMPLATE_ADD({ template }) {
      if (this.templates[template.id]) {
        this.warn(`Tried to add duplicate template '${template.id}'`)
      } else {
        this.templates[template.id] = template.html;
      }
    },
    ON_UPDATE_THEMES({ themes }) {
      this.removeThemes();

      this.setThemes(themes);
    },
    removeThemes() {
      for (let i = 0; i < document.styleSheets.length; i++) {
        const styleSheet = document.styleSheets[i];
        const node = styleSheet.ownerNode;
        
        if (node.getAttribute('data-theme')) {
          node.parentNode.removeChild(node);
        }
      }

      this.tplBackups.reverse();

      for (const [ elem, oldData ] of this.tplBackups) {
        elem.innerText = oldData;
      }

      this.tplBackups = [];

      this.msgTplBackups.reverse();

      for (const [ id, oldData ] of this.msgTplBackups) {
        this.templates[id] = oldData;
      }

      this.msgTplBackups = [];
    },
    setThemes(themes) {
      for (const [ id, data ] of Object.entries(themes)) {
        if (data.style) {
          const style = document.createElement('style');
          style.type = 'text/css';
          style.setAttribute('data-theme', id);
          style.appendChild(document.createTextNode(data.style));

          document.head.appendChild(style);
        }
        
        if (data.styleSheet) {
          const link = document.createElement('link');
          link.rel = 'stylesheet';
          link.type = 'text/css';
          link.href = data.baseUrl + data.styleSheet;
          link.setAttribute('data-theme', id);

          document.head.appendChild(link);
        }

        if (data.templates) {
          for (const [ tplId, tpl ] of Object.entries(data.templates)) {
            const elem = document.getElementById(tplId);

            if (elem) {
              this.tplBackups.push([ elem, elem.innerText ]);
              elem.innerText = tpl;
            }
          }
        }

        if (data.script) {
          const script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = data.baseUrl + data.script;

          document.head.appendChild(script);
        }

        if (data.msgTemplates) {
          for (const [ tplId, tpl ] of Object.entries(data.msgTemplates)) {
            this.msgTplBackups.push([ tplId, this.templates[tplId] ]);
            this.templates[tplId] = tpl;
          }
        }
      }
    },
    warn(msg) {
      this.messages.push({
        args: [msg],
        template: '^3<b>CHAT-WARN</b>: ^0{0}',
      });
    },
    clearShowWindowTimer() {
      clearTimeout(this.showWindowTimer);
    },
    resetShowWindowTimer() {
      this.clearShowWindowTimer();
      this.showWindowTimer = setTimeout(() => {
        if (!this.showInput) {
          this.showWindow = false;
          this.showTab = false;
		  this.showHuongdan = false;
        }
      }, CONFIG.fadeTimeout);
    },
    keyUp() {
      this.resize();
    },
    keyDown(e) {
      if (e.which === 38 || e.which === 40) {
        e.preventDefault();
        this.moveOldMessageIndex(e.which === 38);
      } else if (e.which == 33) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop - 100;
      } else if (e.which == 34) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop + 100;
      }
    },
    moveOldMessageIndex(up) {
      if (up && this.oldMessages.length > this.oldMessagesIndex + 1) {
        this.oldMessagesIndex += 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 >= 0) {
        this.oldMessagesIndex -= 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 === -1) {
        this.oldMessagesIndex = -1;
        this.message = '';
      }
    },
    resize() {
      const input = this.$refs.input;
      input.style.height = '5px';
      input.style.height = `${input.scrollHeight + 2}px`;
    },
    send(e) {
	  var channel = $('.active').val();
      if(msg !== '') {
        if (channel == 'global') {
          $.post('http://chat/chatResult', JSON.stringify({
            message: getEmojiChars(msg),
          }));
          this.oldMessages.unshift(this.message);
          this.oldMessagesIndex = -1;
          this.hideInput();
        } else if (channel == 'admin') {
          $.post('http://chat/chatResultA', JSON.stringify({
            message: getEmojiChars(msg),
          }));
          this.oldMessages.unshift(this.message);
          this.oldMessagesIndex = -1;
          this.hideInput();
        } else if (channel == 'gang') {
          $.post('http://chat/chatResultG', JSON.stringify({
            message: getEmojiChars(msg),
          }));
          this.oldMessages.unshift(this.message);
          this.oldMessagesIndex = -1;
          this.hideInput();
        }
          } else {
            this.hideInput(true);
          }
    },
	onChangeTest() {
		console.log(1);
	},
    hideInput(canceled = false) {
      if (canceled) {
        $.post('http://chat/chatResult', JSON.stringify({ canceled }));
      }
      this.message = '';
      this.showInput = false;
	    this.showHuongdan = false;
      clearInterval(this.focusTimer);
      this.resetShowWindowTimer();
    },
  },
};

var instance = new Vue({
    el: '#app',
    render: h => h(APP),
});

$(function()
{

	$(".dbxPanel").on('click', function() {
		//console.log(1);

		//var txtToAdd = $(".dbxPanel").attr("value");

		var txtToAdd;

		
		var getType = $(this).attr('type');
		if (getType == 'img') {
			txtToAdd = $(this).attr('value');
		} else {
			txtToAdd = this.innerHTML;
		}
		
		$('#inputText').val($('#inputText').val() + "" + txtToAdd);
		$("textarea").change();
		//$('#inputText').focus();
		//console.log($("#inputText").val());
		/*$('#inputText').val(function(i, text) {
			return text + txtToAdd + " ";
		});*/
	});
	
	
	
	var opened = false;
	 
	$("#emoji").on('click', function(){
	 if (!opened) {
		 opened = true;
		 $("#panelEmoji").css("display", "block");
	 } else {
		 opened = false;
		 $("#panelEmoji").css("display", "none");
	 }
	 
	 
	})
	
	
	$(document).on('keypress',function(e) {
		if(e.which == 13) {
			opened = false;
			$("#panelEmoji").css("display", "none");
		}
	});
	

	
	$('#inputText').on('change input', function(){
		msg = $('#inputText').val();
	});

	
});

function openPage(pageName, elmnt, evt) {
  // Hide all elements with class="tabcontent" by default */
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Remove the background color of all tablinks/buttons
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
    tablinks[i].style.color = "";
	tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  // Show the specific tab content
  document.getElementById(pageName).style.display = "flex";
  elmnt.style.color = "red";
  elmnt.style.backgroundColor = "rgba(0, 0, 0, 0.732)";
	//this.classList.remove("active");
  // Add the specific color to the button used to open the tab content
  //elmnt.style.backgroundColor = "rgba(85, 85, 85, 1)";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

	String.prototype.replaceAll = function (stringToFind, stringToReplace) {
			if (stringToFind === stringToReplace) return this;
			var temp = this;
			var index = temp.indexOf(stringToFind);
			while (index != -1) {
				temp = temp.replace(stringToFind, stringToReplace);
				index = temp.indexOf(stringToFind);
			}
			return temp;
		};
	
	function getEmojiChars(text) {
		var emojRange = [
		  [':)', '🙂'], ['<3', '❤'], [':D', '😀'], [':(', '😔'], [':/', '😐'], [':o', '😲']
		];
		var finalText = text;
		
		for (var i = 0; i < emojRange.length; i++) {
			var range = emojRange[i];
			
			finalText = finalText.replaceAll(range[0], range[1]);

		}
		return finalText;
	}


