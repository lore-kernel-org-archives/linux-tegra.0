From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 06/13] mailbox: hi3660: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:31 +0000
Message-ID: <20191228183538.26189-6-tiny.windzz@gmail.com>
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
 drivers/mailbox/hi3660-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 53f4bc2488c5..97e2c4ed807d 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hi3660_mbox *mbox;
 	struct mbox_chan *chan;
-	struct resource *res;
 	unsigned long ch;
 	int err;
 
@@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base))
 		return PTR_ERR(mbox->base);
 
-- 
2.17.1
