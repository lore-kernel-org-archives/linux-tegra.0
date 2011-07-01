From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ASoC: Tegra: I2S: Ensure clock is enabled when writing regs
Date: Fri,  1 Jul 2011 13:56:13 -0600
Message-ID: <1309550175-30551-2-git-send-email-swarren@nvidia.com>
References: <1309550175-30551-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1309550175-30551-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The I2S controller needs a clock to respond to register writes. Without
this, register writes will at worst hang the CPU. In practice, I've only
observed writes being dropped.

Luckily, the dropped register writes historically had no effect:

TEGRA_I2S_TIMING: The value we wrote was the reset default.

TEGRA_I2S_FIFO_SCR: The default was for the FIFOs to request more data
when one slot was empty. The requested value was for the FIFOs to request
when four slots were empty. The DMA controller in the mainline kernel is
configured to burst a single entry at a time into the FIFO, hence there
was no issue. The only negative effect was on bus efficiency losses due
to an increased number of arbitration attempts.

However, in various non-upstream changes, the DMA controller now bursts
four entries at a time into the FIFO. If there is only space for one
entry, the data is simply dropped. In practice, this resulted in 3/4 of
samples being dropped, and playback at 4x the expected rate and pitch.
By fixing the clocking issue, this is solved.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 6b817e2..95f03c1 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -222,12 +222,18 @@ static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2sclock % (2 * srate))
 		reg |= TEGRA_I2S_TIMING_NON_SYM_ENABLE;
 
+	if (!i2s->clk_refs)
+		clk_enable(i2s->clk_i2s);
+
 	tegra_i2s_write(i2s, TEGRA_I2S_TIMING, reg);
 
 	tegra_i2s_write(i2s, TEGRA_I2S_FIFO_SCR,
 		TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
 		TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
 
+	if (!i2s->clk_refs)
+		clk_disable(i2s->clk_i2s);
+
 	return 0;
 }
 
-- 
1.7.0.4
