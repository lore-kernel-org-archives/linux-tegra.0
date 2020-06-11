From: Keyur Patel <iamkeyur96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] memory: tegra: Avoid double error messaging when IRQ absent
Date: Thu, 11 Jun 2020 15:07:54 -0400
Message-ID: <20200611190758.172605-1-iamkeyur96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Keyur Patel <iamkeyur96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since the commit 7723f4c ("driver core: platform: Add an error message
to platform_get_irq*()") platform_get_irq() started issuing an error message.
Thus, there is no need to have the same in the driver.

Signed-off-by: Keyur Patel <iamkeyur96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/mc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..f519c0987485 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -659,10 +659,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	}
 
 	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
+	if (mc->irq < 0)
 		return mc->irq;
-	}
 
 	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
-- 
2.26.2
