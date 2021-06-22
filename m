Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FA6C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 754B96113D
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhFVOMa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:12:30 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34330 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhFVOM3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:29 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 113241FD5D;
        Tue, 22 Jun 2021 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nsb6EOV5i9yxNJWt/hSSm5Rr2kdRZDSU/aOUfcCebr0=;
        b=ZNcm0/6CnNd7BvJvhLBC8ASvBLgQu7QZ9yO+BmqybX0/NSkVIso82Eq7YTLwlVJzSkvdbx
        7XQR1WWI1nOcXn9TK+Fuq0iRbtu7Yfy/UAyFpgoBUbC8MaarsWLBDafYG4AEcVuGZr1azT
        WrocGG3/0Ff8jXYG1KX3Pb0wIxuyBJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371013;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nsb6EOV5i9yxNJWt/hSSm5Rr2kdRZDSU/aOUfcCebr0=;
        b=9sQelEixBwewxDbr3EUl+EMKS6mABBc3WpMZY8Ylu91oJWWCJVL6o6jSVQweOegMO7aUi5
        7YvfHxPmfAL3JwDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 0AD35118DD;
        Tue, 22 Jun 2021 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nsb6EOV5i9yxNJWt/hSSm5Rr2kdRZDSU/aOUfcCebr0=;
        b=ZNcm0/6CnNd7BvJvhLBC8ASvBLgQu7QZ9yO+BmqybX0/NSkVIso82Eq7YTLwlVJzSkvdbx
        7XQR1WWI1nOcXn9TK+Fuq0iRbtu7Yfy/UAyFpgoBUbC8MaarsWLBDafYG4AEcVuGZr1azT
        WrocGG3/0Ff8jXYG1KX3Pb0wIxuyBJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371013;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nsb6EOV5i9yxNJWt/hSSm5Rr2kdRZDSU/aOUfcCebr0=;
        b=9sQelEixBwewxDbr3EUl+EMKS6mABBc3WpMZY8Ylu91oJWWCJVL6o6jSVQweOegMO7aUi5
        7YvfHxPmfAL3JwDA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id KA3OAUTv0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:12 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/22] drm/kirin: Don't set struct drm_device.irq_enabled
Date:   Tue, 22 Jun 2021 16:09:48 +0200
Message-Id: <20210622141002.11590-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in kirin.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index e590e19db657..98ae9a48f3fe 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -185,8 +185,6 @@ static int kirin_drm_kms_init(struct drm_device *dev,
 		DRM_ERROR("failed to initialize vblank.\n");
 		goto err_unbind_all;
 	}
-	/* with irq_enabled = true, we can use the vblank feature. */
-	dev->irq_enabled = true;
 
 	/* reset all the states of crtc/plane/encoder/connector */
 	drm_mode_config_reset(dev);
-- 
2.32.0

