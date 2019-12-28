From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 13/13] mailbox: armada-37xx-rwtm: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:38 +0000
Message-ID: <20191228183538.26189-13-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Cc: Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
index 19f086716dc5..02b7b28e6969 100644
--- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
+++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
@@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
 static int armada_37xx_mbox_probe(struct platform_device *pdev)
 {
 	struct a37xx_mbox *mbox;
-	struct resource *regs;
 	struct mbox_chan *chans;
 	int ret;
 
@@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base)) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		return PTR_ERR(mbox->base);
-- 
2.17.1
