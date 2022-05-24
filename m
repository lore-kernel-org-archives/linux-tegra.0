Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB614C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 12:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbiEXMQS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 08:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbiEXMQR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 08:16:17 -0400
X-Greylist: delayed 185 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 May 2022 05:16:15 PDT
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com [221.176.66.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9611F5001F;
        Tue, 24 May 2022 05:16:15 -0700 (PDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.83])
        by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3628ccbd25bc-f0759;
        Tue, 24 May 2022 20:13:08 +0800 (CST)
X-RM-TRANSID: 2ee3628ccbd25bc-f0759
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
        by rmsmtp-syy-appsvrnew02-12027 (RichMail) with SMTP id 2efb628ccbcea11-ac82b;
        Tue, 24 May 2022 20:13:07 +0800 (CST)
X-RM-TRANSID: 2efb628ccbcea11-ac82b
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        ulf.hansson@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] usb: xhci: tegra: Fix error check
Date:   Tue, 24 May 2022 20:14:04 +0800
Message-Id: <20220524121404.18376-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In the function tegra_xusb_powerdomain_init(),
dev_pm_domain_attach_by_name() may return NULL in some cases,
so IS_ERR() doesn't meet the requirements. Thus fix it.

Fixes: 6494a9ad86de ("usb: xhci: tegra: Add genpd support")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/usb/host/xhci-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 996958a65..bdb776553 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1010,15 +1010,15 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 	int err;
 
 	tegra->genpd_dev_host = dev_pm_domain_attach_by_name(dev, "xusb_host");
-	if (IS_ERR(tegra->genpd_dev_host)) {
-		err = PTR_ERR(tegra->genpd_dev_host);
+	if (IS_ERR_OR_NULL(tegra->genpd_dev_host)) {
+		err = PTR_ERR(tegra->genpd_dev_host) ? : -ENODATA;
 		dev_err(dev, "failed to get host pm-domain: %d\n", err);
 		return err;
 	}
 
 	tegra->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "xusb_ss");
-	if (IS_ERR(tegra->genpd_dev_ss)) {
-		err = PTR_ERR(tegra->genpd_dev_ss);
+	if (IS_ERR_OR_NULL(tegra->genpd_dev_ss)) {
+		err = PTR_ERR(tegra->genpd_dev_ss) ? : -ENODATA;
 		dev_err(dev, "failed to get superspeed pm-domain: %d\n", err);
 		return err;
 	}
-- 
2.20.1.windows.1



