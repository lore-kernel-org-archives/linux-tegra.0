Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D106C4709D
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0639D61108
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhE3MYE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 30 May 2021 08:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3MYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 08:24:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5A9C06138E
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Ziz4aXBaIoS0F/ir80nXYLA38zDsJAHGniRuJrq2bCw=; b=j514rlRvYaUji7VSSX9pdNrlhA
        xydl/nB16TuJ/PPtI/u70+oe9tG4V7T44/MxQuCvdCGCQvoYL8m6M4F54Qk5qqBAB24BcDNoRgfwe
        43DkkBtdMg+dCy7PS/i43Cg3aCaveAS4hUqTtxxqVReHa9hx5FO7wC2QzFqBytzVs906H6qgiYZ66
        njoDlj+9dHq40vayNalepJQJD2iZzu/ViJLtsSFplzEJ1vCYqxEUC5dcxwwnJjo8GM3B4PbulGaJ8
        GGOE02I9pxmTVxm30xpmwqp+pRAAYAX54+ySneclsXPmLh2hh6SGzDInVBxjIH225LIktU9kzdAku
        cdUIMBFA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lnKSP-000775-RG; Sun, 30 May 2021 15:22:17 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 03/14] gpu: host1x: Add job release callback
Date:   Sun, 30 May 2021 15:21:45 +0300
Message-Id: <20210530122156.3292479-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
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
index 8f59b34672c2..09097e19c0d0 100644
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
 				    job->waiter, false);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 98dfb72e6c77..432125804208 100644
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
2.30.1

