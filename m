From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/8] soc/tegra: Add Tegra132 support
Date: Mon,  4 May 2015 13:46:41 +0200
Message-ID: <1430740006-29539-4-git-send-email-thierry.reding@gmail.com>
References: <1430740006-29539-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430740006-29539-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add Tegra132 to the matching table for NVIDIA Tegra SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index a71cb74f3674..a952986a14b7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -15,6 +15,7 @@ static const struct of_device_id tegra_machine_match[] = {
 	{ .compatible = "nvidia,tegra30", },
 	{ .compatible = "nvidia,tegra114", },
 	{ .compatible = "nvidia,tegra124", },
+	{ .compatible = "nvidia,tegra132", },
 	{ }
 };
 
-- 
2.3.5
