From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ALSA: hda: fix tegra build
Date: Mon, 26 May 2014 18:14:21 +0200
Message-ID: <4769804.MRZYg8zfIB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When CONFIG_PM is disabled, the CONFIG_SND_HDA_POWER_SAVE_DEFAULT symbol
does not get defined, which causes a build error for the hda-tegra driver:

hda/hda_tegra.c:80:25: error: 'CONFIG_SND_HDA_POWER_SAVE_DEFAULT' undeclared here (not in a function)
 static int power_save = CONFIG_SND_HDA_POWER_SAVE_DEFAULT;
                         ^
/git/arm-soc/sound/pci/hda/hda_tegra.c:235:13: warning: 'hda_tegra_disable_clocks' defined but not used [-Wunused-function]
 static void hda_tegra_disable_clocks(struct hda_tegra *data)
             ^

This works around the problem by not referencing that macro
when CONFIG_PM is disabled. Instead, we assume that it's disabled
unconditionally and cannot be enabled at runtime.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 086fd06..a366ba9 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -77,10 +77,14 @@ struct hda_tegra {
 	void __iomem *regs;
 };
 
+#ifdef CONFIG_PM
 static int power_save = CONFIG_SND_HDA_POWER_SAVE_DEFAULT;
 module_param(power_save, bint, 0644);
 MODULE_PARM_DESC(power_save,
 		 "Automatic power-saving timeout (in seconds, 0 = disable).");
+#else
+static int power_save = 0;
+#endif
 
 /*
  * DMA page allocation ops.
