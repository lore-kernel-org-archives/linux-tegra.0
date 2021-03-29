Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3950C433E3
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FF5461968
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhC2Njk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhC2NjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 09:39:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91B8C061574
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=murPcBjdwTD8STuTjOocIz/IEhH4UpdfB493mZrWpuU=; b=SDhhi19IRluF7RjyEP214QmD9x
        CcOhkeekJ8kF+S3ieAbsFUi8l4PBTsLoghN+ztg02fMhbKQvvpYq8P6y5cJ7Tv+RDe+vy67oLRIqQ
        RuMBgWfiEsb2tC7FLzjPtrmUys2/h1WPcgvG/GjEFGIpoG5PGK1JOmPRsdJ7OdniwvLMSwL7/Av+i
        03l+7jJzKog5FFLSOW3u4FvOVxZKEBYyHv6hN24aGBYvEFwq8XuWV8BwOdY9pr14p0qU2oLXvJie1
        CYr0rXRX2yRzLXSPOrGEH5q0JfiJ/2gpjMDiF7ZujmZJtYUUNgXSqNO4knprAZ4IcEFVLQ+1HDLPh
        1cNzJgfw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lQs6n-0000Yj-O6; Mon, 29 Mar 2021 16:39:09 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 07/10] gpu: host1x: Reset max value when freeing a syncpoint
Date:   Mon, 29 Mar 2021 16:38:33 +0300
Message-Id: <20210329133836.2115236-8-mperttunen@nvidia.com>
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
 drivers/gpu/host1x/syncpt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 7bb5de8c3d63..877c5ab40cbd 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -400,6 +400,8 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read(sp));
+
 	mutex_lock(&sp->host->syncpt_mutex);
 
 	host1x_syncpt_base_free(sp->base);
-- 
2.30.1

