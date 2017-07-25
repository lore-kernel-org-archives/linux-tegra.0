From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/14] clk: tegra: Add TEGRA_PERIPH_ON_APB flag to I2C
Date: Tue, 25 Jul 2017 13:34:08 +0300
Message-ID: <1500978856-5981-8-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alex Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I2C controllers are also on the APB bus and therefor need this flag to handle
resets correctly.

Signed-off-by: Alex Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 294bfe4..848255c 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -216,7 +216,8 @@
 			     _clk_num, _clk_id)			\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 16, 0, TEGRA_DIVIDER_ROUND_UP,\
-			_clk_num, 0, _clk_id, _parents##_idx, 0, NULL)
+			_clk_num, TEGRA_PERIPH_ON_APB, _clk_id, \
+			_parents##_idx, 0, NULL)
 
 #define XUSB(_name, _parents, _offset, \
 			     _clk_num, _gate_flags, _clk_id)	 \
-- 
1.9.1
