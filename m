Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5100EB64D9
	for <linux-tegra@archiver.kernel.org>; Wed, 12 Jul 2023 09:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbjGLJrZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 Jul 2023 05:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjGLJrY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Jul 2023 05:47:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E154B0
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jul 2023 02:47:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRI-0001fb-Hy; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRG-00Dr6f-VH; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qJWRE-004GUN-Fq; Wed, 12 Jul 2023 11:47:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH RFC v1 39/52] drm/tegra: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date:   Wed, 12 Jul 2023 11:46:49 +0200
Message-Id: <20230712094702.1770121-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2446; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ax8ONDcRHv76lsDxxbFHdUOnp1kAQSD0oQKcbrCxnXg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpR1Zc2iV/rsl4vufry8QoNxP+MhoYldVU9fqu85L7JMw /LkMqeTnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBM5CUPB8O2qIjLYYyuriYi utMMZmr1ls9j3GpfPifQuWPJmcofXgGL3S+fmp93Q4lNY63N5mV1pY6aN3V4XH7ci8hsuJuvdW+ 7g3eEcfevC8HeKdn8AotWsHXc1mGzCWOqibpdEHoto8B9RTM3WzCjtw571XLnovY0je1HxF7v9j 4fuaLGYzlTbXpjdpiuh7aB7Z7z22ur92kl62/6KPHu/5bt/tPnfLh8fOr7JQKKD1NvttdYu73rN ePN2h929RDDnhfefRv7ZTYZpe+o+PXEL9Ss6TX7BCYFK7ufe46272V/GhtdsE/pqv4K8UceeRJP p9fGJK1fkreEW4iX40rx01NpDPtDNXa9+X5fKSJTM7cGAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tegra/dc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6e78416e64b0..05504fe99a77 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1717,7 +1717,7 @@ static struct drm_info_list debugfs_files[] = {
 static int tegra_dc_late_register(struct drm_crtc *crtc)
 {
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm_dev->primary;
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 
@@ -1743,7 +1743,7 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 static void tegra_dc_early_unregister(struct drm_crtc *crtc)
 {
 	unsigned int count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm_dev->primary;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 
 	drm_debugfs_remove_files(dc->debugfs_files, count, minor);
@@ -2119,14 +2119,14 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	tegra_dc_stats_reset(&dc->stats);
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
@@ -2279,14 +2279,14 @@ static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 	tegra_crtc_update_memory_bandwidth(crtc, state, true);
 
 	if (crtc->state->event) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 
 		crtc->state->event = NULL;
 	}
-- 
2.39.2

