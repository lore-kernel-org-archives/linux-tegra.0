Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E838C49EA7
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 11:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B65F61410
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 11:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhFJLHU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 07:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFJLHR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486BEC06124C
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=MFlMxs7mPfGirQckRTQU/v5RBSYMOAxql+R9uj4ynBM=; b=kJQe9c9iax8ZLqcz71g94RFppi
        wHhaPmtcOcmJKBjyBYJ6DsOltaT+FMaQ/Enn9WxD1aGrCdnHju2UaZlCLM1t9fsuSnMS/0UzPWhx0
        tZCKCtC+lXWj4PkplWw3KA2gHTOKbu0MxhWjUjlL0/kWV+IYlF/oGKZxGuSmFETSPM5O+f7JrOblg
        X3oDKWdlu8XL/g2QedjQn3JqRbNbyAfwg1XIbdb9bSuAY0pLkAxs9+6iROeYIFmVqh40C2/0u7FTu
        quIQ/vfiTrcVOrrHX+C0hTqE/+/gsSM3IUJ4ba9tVWsBR+Lo77+h5D+2uqg2eMh4/RLXost1nxErk
        rO6JWssg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrIUt-0001s7-1h; Thu, 10 Jun 2021 14:05:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v7 05/15] gpu: host1x: Add option to skip firewall for a job
Date:   Thu, 10 Jun 2021 14:04:46 +0300
Message-Id: <20210610110456.3692391-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The new UAPI will have its own firewall, and we don't want to run
the firewall in the Host1x driver for those jobs. As such, add a
parameter to host1x_job_alloc to specify if we want to skip the
firewall in the Host1x driver.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v7:
* New patch
---
 drivers/gpu/drm/tegra/drm.c |  2 +-
 drivers/gpu/host1x/job.c    | 21 +++++++++++++--------
 include/linux/host1x.h      |  6 +++++-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 739250acd498..0e2a6f24c4f6 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -193,7 +193,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		return -EINVAL;
 
 	job = host1x_job_alloc(context->channel, args->num_cmdbufs,
-			       args->num_relocs);
+			       args->num_relocs, false);
 	if (!job)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 32619b73a2fc..0eef6df7c89e 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -24,14 +24,18 @@
 #define HOST1X_WAIT_SYNCPT_OFFSET 0x8
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-				    u32 num_cmdbufs, u32 num_relocs)
+				    u32 num_cmdbufs, u32 num_relocs,
+				    bool skip_firewall)
 {
 	struct host1x_job *job = NULL;
 	unsigned int num_unpins = num_relocs;
+	bool enable_firewall;
 	u64 total;
 	void *mem;
 
-	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+	enable_firewall = IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && !skip_firewall;
+
+	if (!enable_firewall)
 		num_unpins += num_cmdbufs;
 
 	/* Check that we're not going to overflow */
@@ -48,6 +52,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	if (!job)
 		return NULL;
 
+	job->enable_firewall = enable_firewall;
+
 	kref_init(&job->ref);
 	job->channel = ch;
 
@@ -214,7 +220,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	 * We will copy gathers BO content later, so there is no need to
 	 * hold and pin them.
 	 */
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+	if (job->enable_firewall)
 		return 0;
 
 	for (i = 0; i < job->num_cmds; i++) {
@@ -321,7 +327,7 @@ static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
 		if (cmdbuf != reloc->cmdbuf.bo)
 			continue;
 
-		if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
+		if (job->enable_firewall) {
 			target = (u32 *)job->gather_copy_mapped +
 					reloc->cmdbuf.offset / sizeof(u32) +
 						g->offset / sizeof(u32);
@@ -634,7 +640,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 	if (err)
 		goto out;
 
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL)) {
+	if (job->enable_firewall) {
 		err = copy_gathers(host->dev, job, dev);
 		if (err)
 			goto out;
@@ -653,7 +659,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 			continue;
 
 		/* copy_gathers() sets gathers base if firewall is enabled */
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		if (!job->enable_firewall)
 			g->base = job->gather_addr_phys[i];
 
 		for (j = i + 1; j < job->num_cmds; j++) {
@@ -688,8 +694,7 @@ void host1x_job_unpin(struct host1x_job *job)
 		struct device *dev = unpin->dev ?: host->dev;
 		struct sg_table *sgt = unpin->sgt;
 
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
-		    unpin->size && host->domain) {
+		if (!job->enable_firewall && unpin->size && host->domain) {
 			iommu_unmap(host->domain, job->addr_phys[i],
 				    unpin->size);
 			free_iova(&host->iova,
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9b6784708f2e..ed4b53999df3 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -273,10 +273,14 @@ struct host1x_job {
 	/* Callback called when job is freed */
 	void (*release)(struct host1x_job *job);
 	void *user_data;
+
+	/* Whether host1x-side firewall should be ran for this job or not */
+	bool enable_firewall;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-				    u32 num_cmdbufs, u32 num_relocs);
+				    u32 num_cmdbufs, u32 num_relocs,
+				    bool skip_firewall);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset);
 void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh,
-- 
2.30.1

