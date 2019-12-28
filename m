From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 09/13] mailbox: sti: do some cleanup
Date: Sat, 28 Dec 2019 18:35:34 +0000
Message-ID: <20191228183538.26189-9-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Cc: Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.
'irq' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-sti.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index 2baf69a0b81c..2a2316dfdca0 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -408,9 +408,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 	struct sti_mbox_device *mdev;
 	struct device_node *np = pdev->dev.of_node;
 	struct mbox_chan *chans;
-	struct resource *res;
-	int irq;
-	int ret;
+	int irq, ret;
 
 	match = of_match_device(sti_mailbox_match, &pdev->dev);
 	if (!match) {
@@ -425,8 +423,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->base = devm_ioremap_resource(&pdev->dev, res);
+	mdev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->base))
 		return PTR_ERR(mdev->base);
 
-- 
2.17.1
