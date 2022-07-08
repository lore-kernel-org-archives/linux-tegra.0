Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C22AC43334
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 15:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238219AbiGHPSZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 11:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238813AbiGHPSX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 11:18:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9064A71BEB
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=YB0MEtRKCjiefnpFCGAACL9OCmYc8qRsAvG6uRgrqGY=; b=J2or1fISVTn7ulHhsrpa8xq0Sb
        lOsWpe3Pu50c2hMLTj09v6bxPC09pZqKaG2iK6Pgw0PUBbF5fcTw0OjPTSm5BVSVQkT7Ib0aC8OIP
        CKPXpMze2a/CoSnz6kt4qGQqZXAqAthrn1O14y6+swonhpOSDBRZ+WZ0ewJ1eAx1E/BatYYEjfosU
        vmogfbKH88kIhCdfS3wtCs9qPD7DlthxbMxet++9eH/Fq/xBrLGQeoa0lZDunZecVXqYpIURGUkp4
        LvCT2jFHkxbk3yPibgPSfLkvjar0hReLVviSB15IVUytvk8AmJUtO4ePDfxlQkXLVD0e44CP2v4T2
        myW3GWOQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o9pkH-009wYA-JA; Fri, 08 Jul 2022 18:18:16 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] gpu: host1x: Initialize syncval in channel_submit
Date:   Fri,  8 Jul 2022 18:18:01 +0300
Message-Id: <20220708151803.3064062-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

During the refactoring of channel_submit, assignment of syncval
was moved but it is also used in channel_submit. Add this assignment
back to channel_submit as well.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 4eb7fb2e4f0a..732abe0750ff 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -319,6 +319,7 @@ static int channel_submit(struct host1x_job *job)
 	}
 
 	channel_program_cdma(job);
+	syncval = host1x_syncpt_read_max(sp);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
 	host1x_cdma_end(&ch->cdma, job);
-- 
2.36.1

