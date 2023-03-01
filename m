Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C63BC7EE23
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Mar 2023 19:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjCATsj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Mar 2023 14:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCATsi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Mar 2023 14:48:38 -0500
X-Greylist: delayed 1781 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Mar 2023 11:48:20 PST
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3A8271C;
        Wed,  1 Mar 2023 11:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1677700090; bh=G8Do2SeddR9IDejdzfXb3mJ2yINZAw/nhNCrxZzNMRY=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=gV519zEmvj4C4oNOXlhBA9+i64aevboY1rgNNx4PKLxoEWW6JgKJP23itMrurDJfu
         Px3lCOp2lbebQetpUtp7f787ciPnF1tGcHMUxzwDk3J7DptzLHsxeo4WvkQw0I4Dlb
         AO/qcQ0oantrR6J9L7YSOsn1DyVmzDhUcQeT/W5M=
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
        via ip-20.mailobj.net [213.182.54.20]
        Wed,  1 Mar 2023 20:48:10 +0100 (CET)
X-EA-Auth: hASAmwc8c6mMvRs+drNOd7GE2MX2lpbv4ZZC16GwJGIyF7aeVvkjA9YVkK/0oDZC1lfNol3EpAbLXaI5MtKzcX/mGBkLHTrw
Date:   Thu, 2 Mar 2023 01:18:06 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>,
        Deepak R Varma <drv@mailo.com>
Subject: [PATCH RESEND] drm/tegra: sor: Remove redundant error logging
Message-ID: <Y/+r9jOO0s8sG4pX@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A call to platform_get_irq() already prints an error on failure within
its own implementation. So printing another error based on its return
value in the caller is redundant and should be removed. The clean up
also makes if condition block braces unnecessary. Remove that as well.

Issue identified using platform_get_irq.cocci coccicheck script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Note:
   Resending the patch for review and feedback. Originally sent on Dec 12 2022.

 drivers/gpu/drm/tegra/sor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..ceaebd33408d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3799,10 +3799,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	err = platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
+	if (err < 0)
 		goto remove;
-	}
 
 	sor->irq = err;
 
-- 
2.34.1



