From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] soc/sound: tegra_max98090: do not invert headphone jack
Date: Wed,  3 Feb 2016 22:30:59 -0700
Message-ID: <1454563862-1971-2-git-send-email-sctincman@gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The headphone jack should not be inverted

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 902da36..b373d06 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -110,7 +110,7 @@ static struct snd_soc_jack_gpio tegra_max98090_hp_jack_gpio = {
 	.name = "Headphone detection",
 	.report = SND_JACK_HEADPHONE,
 	.debounce_time = 150,
-	.invert = 1,
+	.invert = 0,
 };
 
 static struct snd_soc_jack tegra_max98090_mic_jack;
-- 
2.7.0
