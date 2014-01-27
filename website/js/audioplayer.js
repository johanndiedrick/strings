
 	$(document).ready(function(){
		  
	      $("#jquery_jplayer_1").jPlayer({
	      ready: function () {
	        $(this).jPlayer("setMedia", {
	        mp3: "https://s3.amazonaws.com/luisaph_site/projects/The_Well_Sequenced_Synthesizer/bach_prelude_excerpt.mp3"
	        });
	      },
	      swfPath: "/js",
	      supplied: "mp3",
	      cssSelectorAncestor: "",
	      cssSelector: {
	        play: "#play_1",
	        pause: "#pause_1",
	        stop: "#stop_1",
	        mute: "#mute_1",
	        unmute: "#unmute_1",
	        currentTime: "#currentTime_1",
	        duration: "#duration_1"
	      },
	      size: {
	        width: "100%"
	      }
	    });
	
		$("#jquery_jplayer_2").jPlayer({
	      ready: function () {
	        $(this).jPlayer("setMedia", {
	        mp3: "https://s3.amazonaws.com/luisaph_site/projects/The_Well_Sequenced_Synthesizer/wendy_prelude_excerpt.mp3"
	        });
	      },
	      swfPath: "/js",
	      supplied: "mp3",
	      cssSelectorAncestor: "",
	      cssSelector: {
	        play: "#play_2",
	        pause: "#pause_2",
	        stop: "#stop_2",
	        mute: "#mute_2",
	        unmute: "#unmute_2",
	        currentTime: "#currentTime_2",
	        duration: "#duration_2"
	      },
	      size: {
	        width: "100%"
	      }
	    });
	
	
	
	});
	
	
	
	