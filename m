Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD61CC05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 08:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjATIqW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 03:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjATIqV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 03:46:21 -0500
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C691E893C5;
        Fri, 20 Jan 2023 00:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1674204355; bh=7AGM/VKSfqplW97tuNvqH0EXLn8mZUwWtDxRa34Qcns=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=KoFDrV+rztzQO41lGqScRZ6OOfndsDmFmN2qTCHs2q4P/8Btth0Khvy0B6GXp+Zny
         v0lav+iWH4SUM62IHh6tQ/K4b0yB/q8GTQ/C5jZUcH2NtDWwb/2n6P8Tz6nm7pV3jA
         whxbTlWhmQCY4jmNy0m5Xdah+wP4uoC8ZPWhmXTc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 20 Jan 2023 09:45:55 +0100 (CET)
X-EA-Auth: AJPgsdx2PiQAxTAi4hOwr9wTl/T18ftrcAb47lbj28zIJ76a3afMdxDqUAIzv5hpOuuyonfCG2kPxLx8+oe/sl1EHuq1bH64
Date:   Fri, 20 Jan 2023 14:15:51 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: [PATCH] phy: tegra: xusb: Release device node reference
Message-ID: <Y8pUv0IfEfqosPEF@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Platform device reference is retrieved using the device node using a call
to of_find_device_by_node(). Since we do not need to maintain the device
node reference further, we can release it back to the core.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Please note: The patch proposal is compile tested using tegra defconfig.

 drivers/phy/tegra/xusb-tegra210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index ebc8a7e21a31..d30de77515a3 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -3169,6 +3169,8 @@ tegra210_xusb_padctl_probe(struct device *dev,
 		goto out;
 	}
 
+	of_node_put(np);
+
 	if (!platform_get_drvdata(pdev))
 		return ERR_PTR(-EPROBE_DEFER);
 
-- 
2.34.1



