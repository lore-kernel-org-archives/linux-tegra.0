From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] sound/soc/tegra: tegra_max98090: add 'nvidia,hd-no-invert' option
Date: Sun, 21 Feb 2016 23:24:12 -0700
Message-ID: <1456122253-3039-3-git-send-email-sctincman@gmail.com>
References: <56C3977E.8050001@wwwdotorg.org>
 <1456122253-3039-1-git-send-email-sctincman@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456122253-3039-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a device-tree property that does not invert the headphone
detect signal

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_max98090.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 902da36..73beba6 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -238,6 +238,11 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 	if (machine->gpio_hp_det == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
+	if (of_property_read_bool(np, "nvidia,hd-no-invert"))
+		tegra_max98090_hp_jack_gpio.invert = 0;
+	else
+		tegra_max98090_hp_jack_gpio.invert = 1;
+
 	machine->gpio_mic_det =
 			of_get_named_gpio(np, "nvidia,mic-det-gpios", 0);
 	if (machine->gpio_mic_det == -EPROBE_DEFER)
-- 
2.7.1
