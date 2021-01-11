Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788E0C4332B
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5444D22AAB
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbhAKNCe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbhAKNCc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:02:32 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1958C0617BE
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=s7TfMlPsR+ucEQZz3jWFcw+EzKc1Eh02ORugZRn9Lec=; b=rEnMR9eKxBIoCnml6e7sEc6hyf
        wPvDp1nA4z0/mp9L8WY30fbGRAlU8vnjjqQddEyVot59cVvQi7rR8OI4l8V/1D0E0/ZvFLWsEYetD
        7QuvEox+4Weq1XFgKkBxByKHxeNjUsiNGopGOUJndX3uWjG4dU8eVAAbrgPnemTr4Y9ymlXDLtR+P
        +ZgjcAamhzckWd7b2UbJhU6HC1uPzfT1X1Qdk2J5WDIuOsxn3d2z7WvER3i405THCyTkGYWWTgjYB
        GaG5j7ahz4f6agMlAdV27mTk/sw01r2z7rPWabwE2DLOz+mUns67Wyh7CRCTfMpNWUXo3qttfVfoj
        d67v6oUw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo7-0002tl-7i; Mon, 11 Jan 2021 15:00:27 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 13/21] gpu: host1x: Reset max value when freeing a syncpoint
Date:   Mon, 11 Jan 2021 15:00:11 +0200
Message-Id: <20210111130019.3515669-14-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

With job recovery becoming optional, syncpoints may have a mismatch
between their value and max value when freed. As such, when freeing,
set the max value to the current value of the syncpoint so that it
is in a sane state for the next user.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Use host1x_syncpt_read instead of read_min to ensure syncpoint
  value is current.
---
 drivers/gpu/host1x/syncpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 81315cd1a3ed..9c39f5bfc70c 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read(sp));
 	sp->locked = false;
 
 	mutex_lock(&sp->host->syncpt_mutex);
-- 
2.30.0

