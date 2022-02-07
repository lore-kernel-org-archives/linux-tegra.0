Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62200C43217
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 13:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238710AbiBGNq1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381718AbiBGNmG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 08:42:06 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB83C0401C4
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 05:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=THrB40q/yOSt5cd0Iu4CGyYT6zUZMR21yUK3lUKzKZ8=; b=wB2ahBMfpiwLs/yizKobnktO1e
        r1u64pQ6f24ow6srdnt3Tbbva76WV8L8463+JUWKL3EdW+oeDAx51OZ4NzY5WAXVmWu/Aq6OBWkxj
        vTo9jDJYwzGZ24k4AH2YGFaoM9mozOGAjZi2eBO/pEHTrh2n+xpsYWzbCqmv+gPd8ktYKkDAEQV9Q
        2A95CHTFjEVx0gbbujjtbHavxlbhEolM08i63GQHByszZgJElzML0b0ATOVEn2RBfjhkFN1BNzG3F
        9JLisrq26hRVnpdL5xr1V2nTyQI8NjfX+xpegLm0Cho5LmnxXtR18JLfoNpzFflNJBIKQ5iqp8bOP
        BtEShDFA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1nH3vx-0007xv-M8; Mon, 07 Feb 2022 15:19:57 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/2] gpu: host1x: Always return syncpoint value when waiting
Date:   Mon,  7 Feb 2022 15:19:31 +0200
Message-Id: <20220207131932.2164560-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The new TegraDRM UAPI uses syncpoint waiting with timeout set to
zero to indicate reading the syncpoint value. To support that we
need to return the syncpoint value always when waiting.

Fixes: 44e961381354 ("drm/tegra: Implement syncpoint wait UAPI")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e08e331e46ae..fb4036a32095 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -227,27 +227,12 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	void *ref;
 	struct host1x_waitlist *waiter;
 	int err = 0, check_count = 0;
-	u32 val;
 
 	if (value)
-		*value = 0;
-
-	/* first check cache */
-	if (host1x_syncpt_is_expired(sp, thresh)) {
-		if (value)
-			*value = host1x_syncpt_load(sp);
+		*value = host1x_syncpt_load(sp);
 
+	if (host1x_syncpt_is_expired(sp, thresh))
 		return 0;
-	}
-
-	/* try to read from register */
-	val = host1x_hw_syncpt_load(sp->host, sp);
-	if (host1x_syncpt_is_expired(sp, thresh)) {
-		if (value)
-			*value = val;
-
-		goto done;
-	}
 
 	if (!timeout) {
 		err = -EAGAIN;
-- 
2.35.0

