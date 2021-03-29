Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCEEC433E2
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6142D61968
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhC2Njj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbhC2NjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 09:39:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1150C0613D8
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=oUjncLS3gCDXw94Lt9M8obnU5O3nF6FFg8UrSvy5aXQ=; b=LLmlqY86bAg2E4m26vBnTc2Xu7
        8ZGSuQWmUJZb+Y3WWZ5TvKk7OSznG1o4uLe4wtFuCfozO1puu6GRxqrzEBfYolvxRLVvriB8RMMV1
        FtYce984kN0eO81+9pCz1g7Q9GZmZko/wYq+ec3rT3U93xCb6qdN+TCPKMCXqSH0fWIko34kZMr7q
        ZcC/42t+XUQCnC2kfnP7z+dfsuH+UEOozytq8ZZINROuiE0sHTpIXyDSg+cnEaPdzgvCLs7tAQa7v
        GjZVl6CeL3Yc631ezY/LYI1pm3Jl2JGTXzlvkIyfRox6gcCZJbp+smrgvOTg1zyl1tdOaXz872lqQ
        H6kJe34Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lQs6n-0000Yj-J7; Mon, 29 Mar 2021 16:39:09 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 05/10] gpu: host1x: Use HW-equivalent syncpoint expiration check
Date:   Mon, 29 Mar 2021 16:38:31 +0300
Message-Id: <20210329133836.2115236-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329133836.2115236-1-mperttunen@nvidia.com>
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make syncpoint expiration checks always use the same logic used by
the hardware. This ensures that there are no race conditions that
could occur because of the hardware triggering a syncpoint interrupt
and then the driver disagreeing.

One situation where this could occur is if a job incremented a
syncpoint too many times -- then the hardware would trigger an
interrupt, but the driver would assume that a syncpoint value
greater than the syncpoint's max value is in the future, and not
clean up the job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 51 ++-----------------------------------
 1 file changed, 2 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index f061dfd5bbc7..8da4bbce8b9d 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -321,59 +321,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
 bool host1x_syncpt_is_expired(struct host1x_syncpt *sp, u32 thresh)
 {
 	u32 current_val;
-	u32 future_val;
 
 	smp_rmb();
 
 	current_val = (u32)atomic_read(&sp->min_val);
-	future_val = (u32)atomic_read(&sp->max_val);
-
-	/* Note the use of unsigned arithmetic here (mod 1<<32).
-	 *
-	 * c = current_val = min_val	= the current value of the syncpoint.
-	 * t = thresh			= the value we are checking
-	 * f = future_val  = max_val	= the value c will reach when all
-	 *				  outstanding increments have completed.
-	 *
-	 * Note that c always chases f until it reaches f.
-	 *
-	 * Dtf = (f - t)
-	 * Dtc = (c - t)
-	 *
-	 *  Consider all cases:
-	 *
-	 *	A) .....c..t..f.....	Dtf < Dtc	need to wait
-	 *	B) .....c.....f..t..	Dtf > Dtc	expired
-	 *	C) ..t..c.....f.....	Dtf > Dtc	expired	   (Dct very large)
-	 *
-	 *  Any case where f==c: always expired (for any t).	Dtf == Dcf
-	 *  Any case where t==c: always expired (for any f).	Dtf >= Dtc (because Dtc==0)
-	 *  Any case where t==f!=c: always wait.		Dtf <  Dtc (because Dtf==0,
-	 *							Dtc!=0)
-	 *
-	 *  Other cases:
-	 *
-	 *	A) .....t..f..c.....	Dtf < Dtc	need to wait
-	 *	A) .....f..c..t.....	Dtf < Dtc	need to wait
-	 *	A) .....f..t..c.....	Dtf > Dtc	expired
-	 *
-	 *   So:
-	 *	   Dtf >= Dtc implies EXPIRED	(return true)
-	 *	   Dtf <  Dtc implies WAIT	(return false)
-	 *
-	 * Note: If t is expired then we *cannot* wait on it. We would wait
-	 * forever (hang the system).
-	 *
-	 * Note: do NOT get clever and remove the -thresh from both sides. It
-	 * is NOT the same.
-	 *
-	 * If future valueis zero, we have a client managed sync point. In that
-	 * case we do a direct comparison.
-	 */
-	if (!host1x_syncpt_client_managed(sp))
-		return future_val - thresh >= current_val - thresh;
-	else
-		return (s32)(current_val - thresh) >= 0;
+
+	return ((current_val - thresh) & 0x80000000U) == 0U;
 }
 
 int host1x_syncpt_init(struct host1x *host)
-- 
2.30.1

