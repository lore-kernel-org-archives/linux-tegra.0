Return-Path: <SRS0=vF+y=CO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD6AC31E49
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 10:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB1E92078D
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 10:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="uuFYb2tk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIEKgP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Sep 2020 06:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgIEKgI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 06:36:08 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826A0C06125F
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cPEpocOG4OtUGfE2OnMDDDp60EvvppcCACpp5KRBhNs=; b=uuFYb2tkN6gtqp+7YJBu27zqia
        1VcmW3cv1wmlRw+d4rbRrlPQKkSO+pNT3OYF6wvfkyxm3XcfZxW/XBZjtAtdRD0nfuVfvCMVweL9X
        +29h27+xb75WiuV9ooxWl0BanOMpM+fbpnYL14Jrc+i5vWuPdg6zsZ4CJRusa7sq7ngYEUZRkqtkm
        VA9s96ulI1u1fzPdAuwpDbYdW8Zj57Y2OcGY7RbwuIiLIGhDUi/YtZfWd70EdB4DzXniKfgDkFaPS
        hvw1kYOZNpuv/G3ejI87NsKbGzZ7EKI4GhbssQo0EMjjSH6byYzw/DsRPN/KTFfxJ8fgl2JiS5inc
        s/h/Op+g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kEVXw-0003SS-W2; Sat, 05 Sep 2020 13:35:49 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [RFC PATCH v2 05/17] gpu: host1x: Use HW-equivalent syncpoint expiration check
Date:   Sat,  5 Sep 2020 13:34:08 +0300
Message-Id: <20200905103420.3021852-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
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
index 7cb80d4768b1..5329a0886d29 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -306,59 +306,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
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
2.28.0

