From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 4/8] clk: tegra: fix MUX_I2S_SPDIF macro
Date: Fri, 20 Jul 2018 14:45:28 +0100
Message-ID: <20180720134532.13148-5-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Thomas Preston <thomas.preston@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

From: Thomas Preston <thomas.preston@codethink.co.uk>

The i2s clock mux should take audio_2x as a parent, but the
current macro misses the _2x suffix off the audio input clock
which means the audio_2x cannot be selected as a parent of i2s.

Fix the issue by appending the _2x prefix in the name array.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index ed70419f4ff9..47e5b1ac1a69 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -280,7 +280,7 @@ static DEFINE_SPINLOCK(sor0_lock);
 
 #define MUX_I2S_SPDIF(_id)						\
 static const char *mux_pllaout0_##_id##_2x_pllp_clkm[] = { "pll_a_out0", \
-							   #_id, "pll_p",\
+							   #_id"_2x", "pll_p",\
 							   "clk_m"};
 MUX_I2S_SPDIF(audio0)
 MUX_I2S_SPDIF(audio1)
-- 
2.18.0
