From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Don't enable PLLs during early boot
Date: Fri, 22 Mar 2013 14:02:33 +0200
Message-ID: <1363953762-29783-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PLL code relies on udelay() which is not available when CCF is
initialized. Hence we can't enable any PLL during this phase.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--

Stephen,

Can you confirm this is ok for the audio drivers?

We used to be lucky that this has worked up to now, but I will introduce some
changes to the pll lock check code which cause this to fail due to the
slight differences in timing.

---
 drivers/clk/tegra/clk-tegra20.c |    4 ++--
 drivers/clk/tegra/clk-tegra30.c |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index b92d48b..7cc76b0 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1230,8 +1230,8 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{usbd, clk_max, 12000000, 0},
 	{usb2, clk_max, 12000000, 0},
 	{usb3, clk_max, 12000000, 0},
-	{pll_a, clk_max, 56448000, 1},
-	{pll_a_out0, clk_max, 11289600, 1},
+	{pll_a, clk_max, 56448000, 0},
+	{pll_a_out0, clk_max, 11289600, 0},
 	{cdev1, clk_max, 0, 1},
 	{blink, clk_max, 32768, 1},
 	{i2s1, pll_a_out0, 11289600, 0},
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ba6f51b..b705408 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1882,11 +1882,11 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{uartc, pll_p, 408000000, 0},
 	{uartd, pll_p, 408000000, 0},
 	{uarte, pll_p, 408000000, 0},
-	{pll_a, clk_max, 564480000, 1},
-	{pll_a_out0, clk_max, 11289600, 1},
-	{extern1, pll_a_out0, 0, 1},
+	{pll_a, clk_max, 564480000, 0},
+	{pll_a_out0, clk_max, 11289600, 0},
+	{extern1, pll_a_out0, 0, 0},
 	{clk_out_1_mux, extern1, 0, 0},
-	{clk_out_1, clk_max, 0, 1},
+	{clk_out_1, clk_max, 0, 0},
 	{blink, clk_max, 0, 1},
 	{i2s0, pll_a_out0, 11289600, 0},
 	{i2s1, pll_a_out0, 11289600, 0},
-- 
1.7.7.rc0.72.g4b5ea.dirty
