From: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Subject: [PATCH] [v2] spi: tegra114: Fix runtime PM imbalance on error
Date: Sat, 23 May 2020 20:57:04 +0800
Message-ID: <20200523125704.30300-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
---

Changelog:

v2: - Use pm_runtime_put_noidle() instead of pm_runtime_put().
---
 drivers/spi/spi-tegra114.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
index 83edabdb41ad..c2c58871a947 100644
--- a/drivers/spi/spi-tegra114.c
+++ b/drivers/spi/spi-tegra114.c
@@ -1398,6 +1398,7 @@ static int tegra_spi_probe(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
 		goto exit_pm_disable;
 	}
 
-- 
2.17.1
