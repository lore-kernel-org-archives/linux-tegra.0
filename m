Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F843C49EA4
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1278061357
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhFVOM0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:12:26 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36528 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbhFVOMX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:23 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A156621988;
        Tue, 22 Jun 2021 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
        b=vqm9dI3V0nrHSjy2CtFLenVHqjz8WsHqZyyjhgNtOINrIavnieIQ310rzLkEAPtHq7VzGS
        VHLPNnQEc6k693CAl2rM+uYgXq+OrJd5hMG3WynS3vDPiEhJD54dTYSd3GXskP1jP4nEyp
        dxj1jZ3xfQ7o4TdmLLfQxD9AbLw4GdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371006;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
        b=xBXa4bW1nD4K8968XQUo8pVHbPuTILpO3mWKrxajgAUVry/PxbHgWYOtNoK22If5d4UBBj
        w+UCYzGFnlkmd6Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 9B8C8118DD;
        Tue, 22 Jun 2021 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
        b=vqm9dI3V0nrHSjy2CtFLenVHqjz8WsHqZyyjhgNtOINrIavnieIQ310rzLkEAPtHq7VzGS
        VHLPNnQEc6k693CAl2rM+uYgXq+OrJd5hMG3WynS3vDPiEhJD54dTYSd3GXskP1jP4nEyp
        dxj1jZ3xfQ7o4TdmLLfQxD9AbLw4GdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371006;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
        b=xBXa4bW1nD4K8968XQUo8pVHbPuTILpO3mWKrxajgAUVry/PxbHgWYOtNoK22If5d4UBBj
        w+UCYzGFnlkmd6Aw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id AKIBJT3v0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:05 +0000
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
Subject: [PATCH v2 02/22] drm/hibmc: Call drm_irq_uninstall() unconditionally
Date:   Tue, 22 Jun 2021 16:09:42 +0200
Message-Id: <20210622141002.11590-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove the check around drm_irq_uninstall(). The same test is
done by the function internally. The tested state in irq_enabled
is considered obsolete and should not be used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index f4bc5386574a..f8ef711bbe5d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -253,8 +253,7 @@ static int hibmc_unload(struct drm_device *dev)
 {
 	drm_atomic_helper_shutdown(dev);
 
-	if (dev->irq_enabled)
-		drm_irq_uninstall(dev);
+	drm_irq_uninstall(dev);
 
 	pci_disable_msi(to_pci_dev(dev->dev));
 
-- 
2.32.0

