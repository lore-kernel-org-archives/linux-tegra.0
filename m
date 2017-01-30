From: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 10:33:07 +0530
Message-ID: <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

of_device_get_match_data could return NULL, and so can cause
a NULL pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4af9bba..93ac1e1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -920,6 +920,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	tegra_i2c_parse_dt(i2c_dev);
 
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	if (!i2c_dev->hw) {
+		dev_err(&pdev->dev, "no device match found\n");
+		return -ENODEV;
+	}
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
 	init_completion(&i2c_dev->msg_complete);
-- 
1.7.9.5
