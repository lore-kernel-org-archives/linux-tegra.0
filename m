Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6955C49EAB
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB46561369
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhFVOMo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:12:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37226 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhFVOMn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:43 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8D5DE21997;
        Tue, 22 Jun 2021 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DscYhNmGc8hx+2cSQEcUqV5KTcYK8ndbRdBK133hEvI=;
        b=np6L5leNQDEE54gF6v5J6BA0B4NcQAuJn1MmO7P8e2qArOCtSGztLuvMynrdUM080bfTBA
        ZAAuOHQbsgwK5jemEKypgzPq/hdlVT0KwG8nZ/98fKAWvyyMAG108IcMtk7YFkYw/xTkNn
        LAm4Y8UjJ8ZRRgcRcfm2QV7diV5nhDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371026;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DscYhNmGc8hx+2cSQEcUqV5KTcYK8ndbRdBK133hEvI=;
        b=y+bZKfGadx5FbBuhpRu9/p1EN4mfA2et2VoOSKtV+RjkBaJXCe6OIIXlhAE96UFU/xAthR
        6OVO/xIjbSv7i/Cw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 847C311A98;
        Tue, 22 Jun 2021 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DscYhNmGc8hx+2cSQEcUqV5KTcYK8ndbRdBK133hEvI=;
        b=np6L5leNQDEE54gF6v5J6BA0B4NcQAuJn1MmO7P8e2qArOCtSGztLuvMynrdUM080bfTBA
        ZAAuOHQbsgwK5jemEKypgzPq/hdlVT0KwG8nZ/98fKAWvyyMAG108IcMtk7YFkYw/xTkNn
        LAm4Y8UjJ8ZRRgcRcfm2QV7diV5nhDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371026;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DscYhNmGc8hx+2cSQEcUqV5KTcYK8ndbRdBK133hEvI=;
        b=y+bZKfGadx5FbBuhpRu9/p1EN4mfA2et2VoOSKtV+RjkBaJXCe6OIIXlhAE96UFU/xAthR
        6OVO/xIjbSv7i/Cw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id cA6AH1Hv0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:25 +0000
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
Subject: [PATCH v2 21/22] drm/xlnx: Don't set struct drm_device.irq_enabled
Date:   Tue, 22 Jun 2021 16:10:01 +0200
Message-Id: <20210622141002.11590-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in xlnx.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 0c1c50271a88..ac37053412a1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -111,8 +111,6 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		return ret;
 
-	drm->irq_enabled = 1;
-
 	drm_kms_helper_poll_init(drm);
 
 	/*
-- 
2.32.0

