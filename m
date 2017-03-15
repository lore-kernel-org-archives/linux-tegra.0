From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] soc/tegra: Add initial flowctrl support for Tegra210
Date: Wed, 15 Mar 2017 13:31:55 +0000
Message-ID: <1489584715-23138-6-git-send-email-jonathanh@nvidia.com>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489584715-23138-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra210 supports the flowctrl module and so add initial support for
this device.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/flowctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
index b94d9161e448..1a993104e7ff 100644
--- a/drivers/soc/tegra/flowctrl.c
+++ b/drivers/soc/tegra/flowctrl.c
@@ -147,6 +147,7 @@ void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 }
 
 static const struct of_device_id matches[] __initconst = {
+	{ .compatible = "nvidia,tegra210-flowctrl" },
 	{ .compatible = "nvidia,tegra124-flowctrl" },
 	{ .compatible = "nvidia,tegra114-flowctrl" },
 	{ .compatible = "nvidia,tegra30-flowctrl" },
-- 
2.7.4
