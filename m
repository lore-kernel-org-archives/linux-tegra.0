Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974B5C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 17:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 786E360F9D
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 17:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237849AbhJZRmW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:42:22 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:57250 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237912AbhJZRmV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Oct 2021 13:42:21 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 16A6E20C096E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 22/22] usb: host: xhci-tegra: deny IRQ0
Date:   Tue, 26 Oct 2021 20:39:43 +0300
Message-ID: <20211026173943.6829-23-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211026173943.6829-1-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: e84fce0f8837 ("usb: xhci: Add NVIDIA Tegra XUSB controller driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/xhci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1bf494b649bd..7151b1d4f876 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1439,6 +1439,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	tegra->xhci_irq = platform_get_irq(pdev, 0);
 	if (tegra->xhci_irq < 0)
 		return tegra->xhci_irq;
+	if (!tegra->xhci_irq)
+		return -ENIVAL;
 
 	tegra->mbox_irq = platform_get_irq(pdev, 1);
 	if (tegra->mbox_irq < 0)
-- 
2.26.3

