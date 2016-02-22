From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] dt/bindings: Add 'nvidia,hd-no-invert' option
Date: Sun, 21 Feb 2016 23:24:11 -0700
Message-ID: <1456122253-3039-2-git-send-email-sctincman@gmail.com>
References: <56C3977E.8050001@wwwdotorg.org>
 <1456122253-3039-1-git-send-email-sctincman@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456122253-3039-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document an option to not invert the headphone detect GPIO signal

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
index c3495be..5dac704 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -26,6 +26,7 @@ Required properties:
 
 Optional properties:
 - nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
+- nvidia,hd-no-invert : Do not invert headphone detect signal
 - nvidia,mic-det-gpios : The GPIO that detect microphones are plugged in
 
 Example:
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
