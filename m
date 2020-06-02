From: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] spi: tegra20-slink: add missing pm_runtime_put if pm_runtime_get_sync fails
Date: Tue,  2 Jun 2020 00:24:04 -0500
Message-ID: <20200602052404.81041-1-navid.emamdoost@gmail.com>
Return-path: <linux-spi-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-spi-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: emamd001-OJFnDUYgAso@public.gmane.org, wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org, smccaman-OJFnDUYgAso@public.gmane.org, Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Call to pm_runtime_get_sync increments counter even in case of
failure leading to incorrect ref count.
Call pm_runtime_put if pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/spi/spi-tegra20-slink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 7f4d932dade7..9509b7cb14e4 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -756,6 +756,7 @@ static int tegra_slink_setup(struct spi_device *spi)
 	ret = pm_runtime_get_sync(tspi->dev);
 	if (ret < 0) {
 		dev_err(tspi->dev, "pm runtime failed, e = %d\n", ret);
+		pm_runtime_put(tspi->dev);
 		return ret;
 	}
 
-- 
2.17.1
