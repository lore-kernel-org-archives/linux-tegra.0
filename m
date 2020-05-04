From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ALSA: hda/tegra: workaround playback failure on Tegra194
Date: Mon, 4 May 2020 13:46:16 +0530
Message-ID: <1588580176-2801-4-git-send-email-spujar@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588580176-2801-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra194 has 4 SDO lines and with this configuration playback fails
for 44.1K/48K, 2-channel and 16-bps. It results in below print,
  "aplay: pcm_write:2011: write error: Input/output error"

Below relation is used to derive stripe control and is referenced
from HD Audio Specification: Revision 1.0a.
  { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

Due to a legacy HW design problem, playback issue is hit while using
a stripe value resulting from above formula when ratio is '8'. Thus
it is recommended that the ratio must be greater than '8'. Since the
number of SDO lines is in powers of 2, next available ratio '16' is
used as a limiting factor on Tegra194 to workaround the problem.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/hda_tegra.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 45dc544..0cc5fad 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -364,6 +364,23 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	/* initialize chip */
 	azx_init_chip(chip, 1);
 
+	/*
+	 * Playback (for 44.1K/48K, 2-channel, 16-bps) fails with
+	 * 4 SDO lines due to legacy design limitation. Following
+	 * is, from HD Audio Specification (Revision 1.0a), used to
+	 * control striping of the stream across multiple SDO lines
+	 * for sample rates <= 48K.
+	 *
+	 * { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }
+	 *
+	 * Due to legacy design issue it is recommended that above
+	 * ratio must be greater than 8. Since number of SDO lines is
+	 * in powers of 2, next available ratio is 16 which can be
+	 * used as a limiting factor here.
+	 */
+	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
+		chip->bus.core.sdo_limit = 16;
+
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_err(card->dev, "no codecs found!\n");
-- 
2.7.4
