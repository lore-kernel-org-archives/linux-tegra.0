From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ALSA: hda: Fix build warning
Date: Mon,  7 Jul 2014 15:13:12 +0200
Message-ID: <1404738792-20344-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The hda_tegra_disable_clocks() function is only used by the suspend and
resume code, so it needs to be included in the #ifdef CONFIG_PM_SLEEP
block to prevent the following warning:

  CC      sound/pci/hda/hda_tegra.o
sound/pci/hda/hda_tegra.c:238:13: warning: 'hda_tegra_disable_clocks' defined but not used [-Wunused-function]
 static void hda_tegra_disable_clocks(struct hda_tegra *data)
             ^

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/hda_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index dc4bb21ed17b..227990bc02e3 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -235,6 +235,7 @@ disable_hda:
 	return rc;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static void hda_tegra_disable_clocks(struct hda_tegra *data)
 {
 	clk_disable_unprepare(data->hda2hdmi_clk);
@@ -242,7 +243,6 @@ static void hda_tegra_disable_clocks(struct hda_tegra *data)
 	clk_disable_unprepare(data->hda_clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
-- 
2.0.1
