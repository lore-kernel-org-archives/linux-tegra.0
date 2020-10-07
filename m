Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281EDC4742C
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C572221707
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="jpauS5bN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgJGRR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbgJGRR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:27 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17115C0613DA
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=C3a6hHP/EODQar2NxMZnTwHcTqQF/FjwGaefI710fww=; b=jpauS5bNejl3PNQz4hVozDO+EU
        hWux1Xq6k0wyzRStX+0dZEkDZuN32hyTsCQGdLWBpEBy9CWm1EpGWMluV9fsXtrr7oL7GQ/J68V2I
        g6oHQWBUWlh7cu7hR5HhnmVeFSknXwxRhvqDL24YIh9HlWSzNVJ6siD+C8FT2ztuqxfyiM6KUz6Wd
        JfloafhVGCtUboPoTXgsmLQgDN5kaccMl0Nd4bmItU3/BQ4d+3pw1iurdseS2dX2rFdZOvEho1+qu
        yFzO8r1XSLe6Qa9D10VEgZHaVl/k+hyoiVHzSIN0n/6QhWAmWGuLYAg82nPwbAEXe4aLlVELdI3SF
        csEboCKg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD40-0006P9-OK; Wed, 07 Oct 2020 20:17:16 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 14/20] gpu: host1x: Reserve VBLANK syncpoints at initialization
Date:   Wed,  7 Oct 2020 20:12:32 +0300
Message-Id: <20201007171238.1795964-15-mperttunen@nvidia.com>
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

On T20-T148 chips, the bootloader can set up a boot splash
screen with DC configured to increment syncpoint 26/27
at VBLANK. Because of this we shouldn't allow these syncpoints
to be allocated until DC has been reset and will no longer
increment them in the background.

As such, on these chips, reserve those two syncpoints at
initialization, and only mark them free once the DC
driver has indicated it's safe to do so.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* New patch
---
 drivers/gpu/drm/tegra/dc.c  |  6 ++++++
 drivers/gpu/host1x/dev.c    |  6 ++++++
 drivers/gpu/host1x/dev.h    |  6 ++++++
 drivers/gpu/host1x/syncpt.c | 34 +++++++++++++++++++++++++++++++++-
 include/linux/host1x.h      |  3 +++
 5 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index efb41c10dad4..0b23e0922c25 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2031,6 +2031,12 @@ static int tegra_dc_init(struct host1x_client *client)
 	struct drm_plane *cursor = NULL;
 	int err;
 
+	/*
+	 * DC has been reset by now, so VBLANK syncpoint can be released
+	 * for general use.
+	 */
+	host1x_syncpt_release_vblank_reservation(client, 26 + dc->pipe);
+
 	/*
 	 * XXX do not register DCs with no window groups because we cannot
 	 * assign a primary plane to them, which in turn will cause KMS to
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 641317d23828..8b50fbb22846 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -77,6 +77,7 @@ static const struct host1x_info host1x01_info = {
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
+	.reserve_vblank_syncpts = true,
 };
 
 static const struct host1x_info host1x02_info = {
@@ -91,6 +92,7 @@ static const struct host1x_info host1x02_info = {
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
+	.reserve_vblank_syncpts = true,
 };
 
 static const struct host1x_info host1x04_info = {
@@ -105,6 +107,7 @@ static const struct host1x_info host1x04_info = {
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
+	.reserve_vblank_syncpts = false,
 };
 
 static const struct host1x_info host1x05_info = {
@@ -119,6 +122,7 @@ static const struct host1x_info host1x05_info = {
 	.has_hypervisor = false,
 	.num_sid_entries = 0,
 	.sid_table = NULL,
+	.reserve_vblank_syncpts = false,
 };
 
 static const struct host1x_sid_entry tegra186_sid_table[] = {
@@ -142,6 +146,7 @@ static const struct host1x_info host1x06_info = {
 	.has_hypervisor = true,
 	.num_sid_entries = ARRAY_SIZE(tegra186_sid_table),
 	.sid_table = tegra186_sid_table,
+	.reserve_vblank_syncpts = false,
 };
 
 static const struct host1x_sid_entry tegra194_sid_table[] = {
@@ -165,6 +170,7 @@ static const struct host1x_info host1x07_info = {
 	.has_hypervisor = true,
 	.num_sid_entries = ARRAY_SIZE(tegra194_sid_table),
 	.sid_table = tegra194_sid_table,
+	.reserve_vblank_syncpts = false,
 };
 
 static const struct of_device_id host1x_of_match[] = {
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 7b8b7e20e32b..e360bc4a25f6 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -102,6 +102,12 @@ struct host1x_info {
 	bool has_hypervisor; /* has hypervisor registers */
 	unsigned int num_sid_entries;
 	const struct host1x_sid_entry *sid_table;
+	/*
+	 * On T20-T148, the boot chain may setup DC to increment syncpoints
+	 * 26/27 on VBLANK. As such we cannot use these syncpoints until
+	 * the display driver disables VBLANK increments.
+	 */
+	bool reserve_vblank_syncpts;
 };
 
 struct host1x {
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 99d31932eb34..d0be7bdbc6c9 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -52,7 +52,7 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 
 	mutex_lock(&host->syncpt_mutex);
 
-	for (i = 0; i < host->info->nb_pts && sp->name; i++, sp++)
+	for (i = 0; i < host->info->nb_pts && kref_read(&sp->ref); i++, sp++)
 		;
 
 	if (i >= host->info->nb_pts)
@@ -359,6 +359,11 @@ int host1x_syncpt_init(struct host1x *host)
 	if (!host->nop_sp)
 		return -ENOMEM;
 
+	if (host->info->reserve_vblank_syncpts) {
+		kref_init(&host->syncpt[26].ref);
+		kref_init(&host->syncpt[27].ref);
+	}
+
 	return 0;
 }
 
@@ -545,3 +550,30 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base)
 	return base->id;
 }
 EXPORT_SYMBOL(host1x_syncpt_base_id);
+
+static void do_nothing(struct kref *ref)
+{
+}
+
+/**
+ * host1x_syncpt_release_vblank_reservation() - Make VBLANK syncpoint
+ *   available for allocation
+ *
+ * @client: host1x bus client
+ *
+ * Makes VBLANK<i> syncpoint available for allocatation if it was
+ * reserved at initialization time. This should be called by the display
+ * driver after it has ensured that any VBLANK increment programming configured
+ * by the boot chain has been disabled.
+ */
+void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
+					      u32 syncpt_id)
+{
+	struct host1x *host = dev_get_drvdata(client->host->parent);
+
+	if (!host->info->reserve_vblank_syncpts)
+		return;
+
+	kref_put(&host->syncpt[syncpt_id].ref, do_nothing);
+}
+EXPORT_SYMBOL(host1x_syncpt_release_vblank_reservation);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 59296d3346fe..ff2a23cd6bb0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -163,6 +163,9 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 struct host1x_syncpt_base *host1x_syncpt_get_base(struct host1x_syncpt *sp);
 u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 
+void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
+					      u32 syncpt_id);
+
 struct host1x_syncpt *host1x_syncpt_fd_get(int fd);
 
 struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
-- 
2.28.0

