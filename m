Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C45C49EB9
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A237E61380
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhFVOMl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:12:41 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37030 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhFVOMi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:38 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7736F2197A;
        Tue, 22 Jun 2021 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQTWdf0/PIeqR+OtvVI1Ry57+82jitavcgCSlPgIzZQ=;
        b=c7b4AXAcGH/bAEXw8Ghdu9GTFduB5gY2x5HgddK57C70i3PzdLsD10Kma1Bsx2uRhyPeJs
        20Co2J3mBbYTWSrbUYPpaeU5fYavZOQA40S4OBWL0ejv7GcR98fMG3NU/VWy4DuzkIYAkL
        nxUBP8lCfiY3hSBu0xHc1E3lIQFizYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371021;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQTWdf0/PIeqR+OtvVI1Ry57+82jitavcgCSlPgIzZQ=;
        b=6r2l44Ff6BoeQLlNn5A7fG60gW+AQ0BfYu1c25LDL0anTrO6DXvbOOhj//R7nLdH1pJHXi
        SWYkAelMz0htb9Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7A128118DD;
        Tue, 22 Jun 2021 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQTWdf0/PIeqR+OtvVI1Ry57+82jitavcgCSlPgIzZQ=;
        b=c7b4AXAcGH/bAEXw8Ghdu9GTFduB5gY2x5HgddK57C70i3PzdLsD10Kma1Bsx2uRhyPeJs
        20Co2J3mBbYTWSrbUYPpaeU5fYavZOQA40S4OBWL0ejv7GcR98fMG3NU/VWy4DuzkIYAkL
        nxUBP8lCfiY3hSBu0xHc1E3lIQFizYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371021;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQTWdf0/PIeqR+OtvVI1Ry57+82jitavcgCSlPgIzZQ=;
        b=6r2l44Ff6BoeQLlNn5A7fG60gW+AQ0BfYu1c25LDL0anTrO6DXvbOOhj//R7nLdH1pJHXi
        SWYkAelMz0htb9Dg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id IAvvHEzv0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:20 +0000
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
Subject: [PATCH v2 16/22] drm/sun4i: Don't set struct drm_device.irq_enabled
Date:   Tue, 22 Jun 2021 16:09:56 +0200
Message-Id: <20210622141002.11590-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in sun4i.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index af335f58bdfc..570f3af25e86 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -97,8 +97,6 @@ static int sun4i_drv_bind(struct device *dev)
 	if (ret)
 		goto cleanup_mode_config;
 
-	drm->irq_enabled = true;
-
 	/* Remove early framebuffers (ie. simplefb) */
 	ret = drm_aperture_remove_framebuffers(false, "sun4i-drm-fb");
 	if (ret)
-- 
2.32.0

