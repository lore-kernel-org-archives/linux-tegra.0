From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Fix zero comparison with unsigned in clk-dfll
Date: Mon, 25 May 2015 10:50:35 +0300
Message-ID: <1432540235-11927-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The DFLL clock driver mistakenly assigned a function result
value with negative error codes to an unsigned variable and
then tried to check for error. Fix by assigning first to
signed variable and then only to unsigned if the result was
OK.

Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-dfll.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 6ec64577..7aa6eac 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1444,10 +1444,12 @@ static int dfll_build_i2c_lut(struct tegra_dfll *td)
 	v_max = dev_pm_opp_get_voltage(opp);
 
 	v = td->soc->min_millivolts * 1000;
-	td->i2c_lut[0] = find_vdd_map_entry_exact(td, v);
-	if (td->i2c_lut[0] < 0)
+	ret = find_vdd_map_entry_exact(td, v);
+	if (ret < 0)
 		goto out;
 
+	td->i2c_lut[0] = ret;
+
 	for (j = 1, rate = 0; ; rate++) {
 		opp = dev_pm_opp_find_freq_ceil(td->soc->opp_dev, &rate);
 		if (IS_ERR(opp))
-- 
2.1.4
