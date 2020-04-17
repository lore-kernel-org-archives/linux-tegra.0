From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mfd: max77620: Use single-byte writes on MAX77620
Date: Fri, 17 Apr 2020 19:09:13 +0200
Message-ID: <20200417170913.2552327-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The MAX77620 doesn't support bulk writes, so make sure the regmap code
breaks bulk writes into multiple single-byte writes.

Note that this is mostly cosmetic because currently only the RTC sub-
driver uses bulk writes and the RTC driver ends up using a different
regmap on the MAX77620 anyway. However, it seems like a good idea to
make this change now in order to avoid running into issues if bulk
writes are ever used by other sub-drivers sometime down the road.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/max77620.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c7ed5c353553..fec2096474ad 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -177,6 +177,7 @@ static const struct regmap_config max77620_regmap_config = {
 	.rd_table = &max77620_readable_table,
 	.wr_table = &max77620_writable_table,
 	.volatile_table = &max77620_volatile_table,
+	.use_single_write = true,
 };
 
 static const struct regmap_config max20024_regmap_config = {
-- 
2.24.1
