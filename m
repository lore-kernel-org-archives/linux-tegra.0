From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 04/13] mailbox: mediatek: cmdq: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:29 +0000
Message-ID: <20191228183538.26189-4-tiny.windzz@gmail.com>
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..7f9e34b021c8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
 
@@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (!cmdq)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cmdq->base = devm_ioremap_resource(dev, res);
+	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cmdq->base)) {
 		dev_err(dev, "failed to ioremap gce\n");
 		return PTR_ERR(cmdq->base);
-- 
2.17.1
