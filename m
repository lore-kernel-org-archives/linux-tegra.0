Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BEAC49EB7
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FB44613E8
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhFXHbn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 03:31:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:47586 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhFXHbm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 03:31:42 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D12D51FD67;
        Thu, 24 Jun 2021 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M5LodZfM0m7Y2WC7cqRflXQmW+1vF4kzQczMY/HRrJs=;
        b=OoOsLe5qEhEPwhgmNf9IxTKSlHX9XwEAfOigxGXHTFu3Ins1ZUh/IYKMv5vFFgXDuAL6SY
        pjT6wjfFrynrgL/7/v1ZY/sN8Eu/u328tjbI5W5ech/BpTCOvuony2O9ZM7pgMa78IH2yC
        EY0TAfWQEdsy77vQeQgk8Q4Sfv52NKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519762;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M5LodZfM0m7Y2WC7cqRflXQmW+1vF4kzQczMY/HRrJs=;
        b=mIkLvzuf89pnc+s4odpNvJ1eyeYNj6Lz6gOo50DdQo6uIy911ifVXxrL6x1gYg3BBdDkml
        p2x/oOkvaNjE8DAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id AF9BE11A97;
        Thu, 24 Jun 2021 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M5LodZfM0m7Y2WC7cqRflXQmW+1vF4kzQczMY/HRrJs=;
        b=OoOsLe5qEhEPwhgmNf9IxTKSlHX9XwEAfOigxGXHTFu3Ins1ZUh/IYKMv5vFFgXDuAL6SY
        pjT6wjfFrynrgL/7/v1ZY/sN8Eu/u328tjbI5W5ech/BpTCOvuony2O9ZM7pgMa78IH2yC
        EY0TAfWQEdsy77vQeQgk8Q4Sfv52NKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519762;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M5LodZfM0m7Y2WC7cqRflXQmW+1vF4kzQczMY/HRrJs=;
        b=mIkLvzuf89pnc+s4odpNvJ1eyeYNj6Lz6gOo50DdQo6uIy911ifVXxrL6x1gYg3BBdDkml
        p2x/oOkvaNjE8DAQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id 4PnxKVE01GAJfwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:21 +0000
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
        michal.simek@xilinx.com, jani.nikula@linux.intel.com,
        rodrigo.vivi@intel.com, linux@armlinux.org.uk,
        kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 02/27] drm/hibmc: Call drm_irq_uninstall() unconditionally
Date:   Thu, 24 Jun 2021 09:28:51 +0200
Message-Id: <20210624072916.27703-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove the check around drm_irq_uninstall(). The same test is
done by the function internally. The tested state in irq_enabled
is considered obsolete and should not be used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

