From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/6] ALSA: hda/tegra - Improve error reporting
Date: Tue,  5 May 2015 14:56:21 +0200
Message-ID: <1430830584-3113-3-git-send-email-thierry.reding@gmail.com>
References: <1430830584-3113-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430830584-3113-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When probing, provide accurate error messages to help with debugging
failures.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/hda_tegra.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 7003677f7473..477742cb70a2 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -316,14 +316,20 @@ static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)
 	int err;
 
 	hda->hda_clk = devm_clk_get(dev, "hda");
-	if (IS_ERR(hda->hda_clk))
+	if (IS_ERR(hda->hda_clk)) {
+		dev_err(dev, "failed to get hda clock\n");
 		return PTR_ERR(hda->hda_clk);
+	}
 	hda->hda2codec_2x_clk = devm_clk_get(dev, "hda2codec_2x");
-	if (IS_ERR(hda->hda2codec_2x_clk))
+	if (IS_ERR(hda->hda2codec_2x_clk)) {
+		dev_err(dev, "failed to get hda2codec_2x clock\n");
 		return PTR_ERR(hda->hda2codec_2x_clk);
+	}
 	hda->hda2hdmi_clk = devm_clk_get(dev, "hda2hdmi");
-	if (IS_ERR(hda->hda2hdmi_clk))
+	if (IS_ERR(hda->hda2hdmi_clk)) {
+		dev_err(dev, "failed to get hda2hdmi clock\n");
 		return PTR_ERR(hda->hda2hdmi_clk);
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hda->regs = devm_ioremap_resource(dev, res);
@@ -334,8 +340,10 @@ static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)
 	bus->addr = res->start + HDA_BAR0;
 
 	err = hda_tegra_enable_clocks(hda);
-	if (err)
+	if (err) {
+		dev_err(dev, "failed to get enable clocks\n");
 		return err;
+	}
 
 	hda_tegra_init(hda);
 
@@ -385,12 +393,17 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 
 	/* initialize streams */
 	err = azx_init_streams(chip);
-	if (err < 0)
+	if (err < 0) {
+		dev_err(card->dev, "failed to initialize streams: %d\n", err);
 		return err;
+	}
 
 	err = azx_alloc_stream_pages(chip);
-	if (err < 0)
+	if (err < 0) {
+		dev_err(card->dev, "failed to allocate stream pages: %d\n",
+			err);
 		return err;
+	}
 
 	/* initialize chip */
 	azx_init_chip(chip, 1);
-- 
2.3.5
