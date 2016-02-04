From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] sound/soc: tegra_max98090: document headphone jack rename
Date: Wed,  3 Feb 2016 22:31:01 -0700
Message-ID: <1454563862-1971-4-git-send-email-sctincman@gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Update device-tree bindings to reflect the rename of the board's
headphone jack.

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
index c3495be..7ad911f 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -15,7 +15,7 @@ Required properties:
   sinks are the MAX98090's pins (as documented in its binding), and the jacks
   on the board:
 
-  * Headphones
+  * Headphone Jack
   * Speakers
   * Mic Jack
   * Int Mic
@@ -36,8 +36,8 @@ sound {
 	nvidia,model = "NVIDIA Tegra Venice2";
 
 	nvidia,audio-routing =
-		"Headphones", "HPR",
-		"Headphones", "HPL",
+		"Headphone Jack", "HPR",
+		"Headphone Jack", "HPL",
 		"Speakers", "SPKR",
 		"Speakers", "SPKL",
 		"Mic Jack", "MICBIAS",
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
