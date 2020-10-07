Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8109C41604
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA689206DD
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="RHjU2Rgm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgJGRRW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgJGRRW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDA8C061755
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=nLb3bOGATzWgojyiuehY6eIM1ZYtWXH4XUuxMvplrD4=; b=RHjU2Rgm3fjVN+/krE6LOhoNaT
        rUa5W3BfTEu9MmZ9eLDKjv7/h3qZQ+T3L5YW4IU+NrikXPKtnmOD9gMzBT611eVPP5Ai0SvXhpdv/
        l+iJPyYiJo14JPtN8zvSIMu30MmDhISztVYQIh4tm3sXD3UrvTfoBNnAzgaiVLSnJ2za8mDlix9nw
        xHcRrrk2wProZba0lVIBPU+As7Xn5EDjpQMZ2NqNvgodvObqA3xC9fuyoYDPB9c3JBgSKCjm8pq6Y
        uiuQAug3TMd/UGms63t7NJtjCSXnU10/iHyZD6e7iCzEsAtmvO7RHl95gZSR6wHxrIZoe9HcOq51t
        Ew1MsUpA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD40-0006P9-G2; Wed, 07 Oct 2020 20:17:16 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 11/20] gpu: host1x: Add job release callback
Date:   Wed,  7 Oct 2020 20:12:29 +0300
Message-Id: <20201007171238.1795964-12-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a callback field to the job structure, to be called just before
the job is to be freed. This allows the job's submitter to clean
up any of its own state, like decrement runtime PM refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/job.c | 3 +++
 include/linux/host1x.h   | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index e4f16fc899b0..acf322beb56c 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -79,6 +79,9 @@ static void job_free(struct kref *ref)
 {
 	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
 
+	if (job->release)
+		job->release(job);
+
 	if (job->waiter)
 		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
 				    job->waiter);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index fb62cc8b77dd..d7070fd65833 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -265,6 +265,10 @@ struct host1x_job {
 
 	/* Fast-forward syncpoint increments on job timeout */
 	bool syncpt_recovery;
+
+	/* Callback called when job is freed */
+	void (*release)(struct host1x_job *job);
+	void *user_data;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.28.0

