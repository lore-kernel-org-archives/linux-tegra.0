From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/6] ALSA: hda/tegra - Set CORBRP self-clear flag
Date: Tue,  5 May 2015 14:56:19 +0200
Message-ID: <1430830584-3113-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is set for the MCP variants of the NVIDIA HDA controller, which the
Tegra variant was derived from. This fixes the following warning at boot
time:

	[    2.486610] tegra-hda 70030000.hda: CORB reset timeout#1, CORBRP = 0

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/hda_tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index db0bb50fa5b9..7003677f7473 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -460,11 +460,12 @@ MODULE_DEVICE_TABLE(of, hda_tegra_match);
 
 static int hda_tegra_probe(struct platform_device *pdev)
 {
+	const unsigned int driver_flags = AZX_DCAPS_RIRB_DELAY |
+					  AZX_DCAPS_CORBRP_SELF_CLEAR;
 	struct snd_card *card;
 	struct azx *chip;
 	struct hda_tegra *hda;
 	int err;
-	const unsigned int driver_flags = AZX_DCAPS_RIRB_DELAY;
 
 	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
 	if (!hda)
-- 
2.3.5
