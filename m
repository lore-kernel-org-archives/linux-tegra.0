From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 5/9] drivers: ata: libahci_platform: use devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 14:35:44 +0200
Message-ID: <1566304548-19972-5-git-send-email-info@metux.net>
References: <1566304548-19972-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: axboe@kernel.dk, hdegoede@redhat.com, b.zolnierkie@samsung.com, linus.walleij@linaro.org, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/ata/libahci_platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 9e9583a..3d84be8 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -408,8 +408,7 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
 
 	devres_add(dev, hpriv);
 
-	hpriv->mmio = devm_ioremap_resource(dev,
-			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	hpriv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hpriv->mmio)) {
 		rc = PTR_ERR(hpriv->mmio);
 		goto err_out;
-- 
1.9.1
