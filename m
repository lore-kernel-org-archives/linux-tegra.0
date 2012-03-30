From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 02/17] ASoC: tegra: ensure clocks are enabled when touching registers
Date: Fri, 30 Mar 2012 17:07:17 -0600
Message-ID: <1333148852-17806-3-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Debugfs files could be accessed any time, so explicitly enable clocks
when reading registers to generate debugfs file content.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c   |    4 ++++
 sound/soc/tegra/tegra_spdif.c |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 0a874fb..8aafc53 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -79,11 +79,15 @@ static int tegra_i2s_show(struct seq_file *s, void *unused)
 	struct tegra_i2s *i2s = s->private;
 	int i;
 
+	clk_enable(i2s->clk_i2s);
+
 	for (i = 0; i < ARRAY_SIZE(regs); i++) {
 		u32 val = tegra_i2s_read(i2s, regs[i].offset);
 		seq_printf(s, "%s = %08x\n", regs[i].name, val);
 	}
 
+	clk_disable(i2s->clk_i2s);
+
 	return 0;
 }
 
diff --git a/sound/soc/tegra/tegra_spdif.c b/sound/soc/tegra/tegra_spdif.c
index 3426633..e16c4ff 100644
--- a/sound/soc/tegra/tegra_spdif.c
+++ b/sound/soc/tegra/tegra_spdif.c
@@ -79,11 +79,15 @@ static int tegra_spdif_show(struct seq_file *s, void *unused)
 	struct tegra_spdif *spdif = s->private;
 	int i;
 
+	clk_enable(spdif->clk_spdif_out);
+
 	for (i = 0; i < ARRAY_SIZE(regs); i++) {
 		u32 val = tegra_spdif_read(spdif, regs[i].offset);
 		seq_printf(s, "%s = %08x\n", regs[i].name, val);
 	}
 
+	clk_disable(spdif->clk_spdif_out);
+
 	return 0;
 }
 
-- 
1.7.0.4
