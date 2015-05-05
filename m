From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/6] ALSA: hda/hdmi - Add Tegra114 support
Date: Tue,  5 May 2015 14:56:23 +0200
Message-ID: <1430830584-3113-5-git-send-email-thierry.reding@gmail.com>
References: <1430830584-3113-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430830584-3113-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra114 contains the same codec as Tegra124 and can be supported using
the same patch function.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 8d6ce0a5dbe4..74a18ca3cb2f 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3496,6 +3496,7 @@ static const struct hda_codec_preset snd_hda_preset_hdmi[] = {
 { .id = 0x10de001b, .name = "GPU 1b HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de001c, .name = "GPU 1c HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de0020, .name = "Tegra30 HDMI",	.patch = patch_tegra_hdmi },
+{ .id = 0x10de0022, .name = "Tegra114 HDMI",	.patch = patch_tegra_hdmi },
 { .id = 0x10de0028, .name = "Tegra124 HDMI",	.patch = patch_tegra_hdmi },
 { .id = 0x10de0040, .name = "GPU 40 HDMI/DP",	.patch = patch_nvhdmi },
 { .id = 0x10de0041, .name = "GPU 41 HDMI/DP",	.patch = patch_nvhdmi },
-- 
2.3.5
