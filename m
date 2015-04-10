From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 2/9] ARM: tegra: fix hda2codec_2x clock name for Tegra30
Date: Fri, 10 Apr 2015 23:35:57 +0200
Message-ID: <4c052b5a83e74b1571409a0a2cee1cc2832095c2.1428700856.git.marcel.ziswiler@toradex.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Matt Porter <mporter@linaro.org>, Paul Walmsley <paul@pwsan.com>, Eduardo Valentin <edubezval@gmail.com>, Takashi Iwai <tiwai@suse.de>, Dylan Reid <dgreid@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 4b9d8bd..3d14ea5 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -679,7 +679,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .dev_id = "tegra30-dam.1", .dt_id = TEGRA30_CLK_DAM1 },
 	{ .dev_id = "tegra30-dam.2", .dt_id = TEGRA30_CLK_DAM2 },
 	{ .con_id = "hda", .dev_id = "tegra30-hda", .dt_id = TEGRA30_CLK_HDA },
-	{ .con_id = "hda2codec", .dev_id = "tegra30-hda", .dt_id = TEGRA30_CLK_HDA2CODEC_2X },
+	{ .con_id = "hda2codec_2x", .dev_id = "tegra30-hda", .dt_id = TEGRA30_CLK_HDA2CODEC_2X },
 	{ .dev_id = "spi_tegra.0", .dt_id = TEGRA30_CLK_SBC1 },
 	{ .dev_id = "spi_tegra.1", .dt_id = TEGRA30_CLK_SBC2 },
 	{ .dev_id = "spi_tegra.2", .dt_id = TEGRA30_CLK_SBC3 },
-- 
1.9.3
