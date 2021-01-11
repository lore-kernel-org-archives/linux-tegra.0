Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E373C43332
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88659225AC
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbhAKNBx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbhAKNBv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:51 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E9BC0617A7
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7U2ixRKbqOHuyXz+R/GqYFGI2wziELxmuUDNoNmPT0M=; b=LMNSD/9ChaAK9Qjj8YMjy3EEJN
        IiANlYlF7S+AXNbyRH7pmzTStcyNgFlTpXLNIxtx12pFNVFizx93me7TkYeCi+f4woSe1muPiF/zE
        3ZcK38aoRsmYzouL42rCB7TimMVVIp14sPKtzdHI8NW4RtxtSL/FdOeOtjVSw0c0EkUjmS0DMWnzs
        /QsT90w85VvZslXcLZWKvRqbd4ePVzkl7oMXeHy7dU0veUlmXPN+kwS/oY31H82Ce5ENYRGFcvHo9
        g8SYCX2uS9ldT7fd9VoXom3RH1NB+JzsNCJT4+3lDklZGGNKIiPFCQ6QlZyuQo913SAzpekpUBk5O
        ETEyaKWA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo6-0002tl-Ce; Mon, 11 Jan 2021 15:00:26 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in debugfs
Date:   Mon, 11 Jan 2021 15:00:01 +0200
Message-Id: <20210111130019.3515669-4-mperttunen@nvidia.com>
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

Show the number of pending waiters in the debugfs status file.
This is useful for testing to verify that waiters do not leak
or accumulate incorrectly.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/debug.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 1b4997bda1c7..8a14880c61bb 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 
 static void show_syncpts(struct host1x *m, struct output *o)
 {
+	struct list_head *pos;
 	unsigned int i;
 
 	host1x_debug_output(o, "---- syncpts ----\n");
@@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
 	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
 		u32 max = host1x_syncpt_read_max(m->syncpt + i);
 		u32 min = host1x_syncpt_load(m->syncpt + i);
+		unsigned int waiters = 0;
 
-		if (!min && !max)
+		spin_lock(&m->syncpt[i].intr.lock);
+		list_for_each(pos, &m->syncpt[i].intr.wait_head)
+			waiters++;
+		spin_unlock(&m->syncpt[i].intr.lock);
+
+		if (!min && !max && !waiters)
 			continue;
 
-		host1x_debug_output(o, "id %u (%s) min %d max %d\n",
-				    i, m->syncpt[i].name, min, max);
+		host1x_debug_output(o,
+				    "id %u (%s) min %d max %d (%d waiters)\n",
+				    i, m->syncpt[i].name, min, max, waiters);
 	}
 
 	for (i = 0; i < host1x_syncpt_nb_bases(m); i++) {
-- 
2.30.0

