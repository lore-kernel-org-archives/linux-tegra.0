From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Fix build error due to 64-by-32 division
Date: Thu, 23 Jul 2020 13:43:31 +0530
Message-ID: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Build errors are seen on 32-bit platforms because of a plain 64-by-32
division. For example, following build erros were reported.

"ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
 undefined!"
"ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
 undefined!"

This can be fixed by using div_u64() helper from 'math64.h' header.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Reported-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra210_dmic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index ff6fd65..d682414 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -129,7 +130,7 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
 	 * Boost Gain Volume control has 100x factor.
 	 */
 	if (dmic->boost_gain)
-		gain_q23 = (gain_q23 * dmic->boost_gain) / 100;
+		gain_q23 = div_u64(gain_q23 * dmic->boost_gain, 100);
 
 	regmap_write(dmic->regmap, TEGRA210_DMIC_LP_FILTER_GAIN,
 		     (unsigned int)gain_q23);
-- 
2.7.4
